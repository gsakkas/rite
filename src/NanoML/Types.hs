{-# LANGUAGE ConstraintKinds       #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE LambdaCase            #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE RecordWildCards       #-}
module NanoML.Types where

import           Control.Arrow
import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.Fix
import           Control.Monad.Reader
import           Control.Monad.State
import           Control.Monad.Writer         hiding (Alt)
import           Data.Char
import           Data.List
import           Data.Map                     (Map)
import qualified Data.Map                     as Map
import           Data.Maybe
import           Data.Typeable (Typeable)
import           GHC.Generics
import           Test.SmartCheck
import           Text.PrettyPrint.ANSI.Leijen (Doc)

import           Debug.Trace
import           Text.Printf

----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type MonadEval m = ( MonadError NanoError m
                   , MonadReader NanoOpts m
                   , MonadWriter [Doc] m
                   , MonadState EvalState m
                   , MonadFix m, MonadIO m
                   )

type Var = String

data NanoOpts = NanoOpts
  { enablePrint           :: Bool -- ^ Should we actually print things to stdout?
  , checkDataCons         :: Bool -- ^ Should we check that datacon args have the proper type?
  , heterogeneousEquality :: Bool -- ^ Should we allow equality comparison between different types?
  } deriving Show

stdOpts, loudOpts :: NanoOpts
stdOpts = NanoOpts { enablePrint = False, checkDataCons = True, heterogeneousEquality = False }
loudOpts = stdOpts { enablePrint = True }

data NanoError
  = MLException Value
  | UnboundVariable Var
  | TypeError String -- TODO:
  | ParseError String
  | OutputTypeMismatch Value Type
  deriving (Show, Typeable)

instance Exception NanoError

varToInt (TVar _)     = TCon tINT
varToInt (TCon c)     = TCon c
varToInt (TTup ts)    = TTup (map varToInt ts)
varToInt (TApp c ts)  = TApp c (map varToInt ts)
varToInt (ti :-> to)  = varToInt ti :-> varToInt to


typeError :: MonadEval m => String -> m a
typeError = throwError . TypeError

outputTypeMismatchError :: MonadEval m => Value -> Type -> m a
outputTypeMismatchError v t = throwError (OutputTypeMismatch v (varToInt t))

data EvalState = EvalState
  { stVarEnv  :: Env
  , stTypeEnv :: Map TCon TypeDecl
  , stDataEnv :: Map DCon DataDecl
  , stStore   :: Env
  }

initState :: EvalState
initState = EvalState
  { stVarEnv = baseEnv
  , stTypeEnv = baseTypeEnv
  , stDataEnv = baseDataEnv
  , stStore = emptyEnv
  }

setVarEnv :: MonadEval m => Env -> m ()
setVarEnv env = modify' $ \ s -> s { stVarEnv = env }

addType :: MonadEval m => TypeDecl -> m ()
addType td@TypeDecl {..} = modify' $ \ s ->
  s { stTypeEnv = Map.insert tyCon td (stTypeEnv s)
    , stDataEnv = Map.union (Map.fromList dds') (stDataEnv s) }
  where
  td' = td { tyRhs = tyRhs' }
  tyRhs' = case tyRhs of
    Alias _ -> tyRhs
    Alg _   -> Alg $ map snd dds'
  dds' = case tyRhs of
    Alias _ -> mempty
    Alg dds -> [(dCon, dd { dType = td' }) | dd@DataDecl {..} <- dds]
  -- dcons = case tyRhs of
  --   Alias _ -> mempty
  --   Alg dds -> Map.fromList [(dCon,dd) | dd@DataDecl {..} <- dds]

extendType :: MonadEval m => TCon -> DataDecl -> m ()
extendType tcon ddecl = do
  td@TypeDecl {..} <- lookupType tcon
  case tyRhs of
    Alias _ -> error $ "cannot extend type alias: " ++ tcon
    Alg dds -> addType (td { tyRhs = Alg (ddecl : dds) })
-- extendType tcon ddecl = modify' $ \ s ->
--   s { stTypeEnv = Map.adjust addDDecl tcon (stTypeEnv s)
--     , stDataEnv = Map.insert (dCon ddecl) ddecl (stDataEnv s)
--     }
--   where
--   addDDecl TypeDecl {..} = case tyRhs of
--     Alias _ -> error $ "cannot extend type alias: " ++ tcon
--     Alg ds  -> let tyRhs = Alg (ddecl:ds) in TypeDecl {..}

lookupType :: MonadEval m => TCon -> m TypeDecl
lookupType tcon = do
  tys <- gets stTypeEnv
  case Map.lookup tcon tys of
    Nothing -> typeError ("unknown type: " ++ tcon)
    Just t -> return t

-- lookupTypeDataCon :: MonadEval m => TCon -> DCon -> m [Type]
-- lookupTypeDataCon tcon dcon = do
--   ds <- lookupType tcon
--   case find (\d -> dcon == dCon d ) ds of
--     Nothing -> typeError (dcon ++ " is not a constructor of " ++ tcon)
--     Just DataDecl {..} -> return dArgs

lookupDataCon :: MonadEval m => DCon -> m DataDecl
lookupDataCon dc = do
  dcons <- gets stDataEnv
  case Map.lookup dc dcons of
    Nothing -> typeError ("unknown data constructor: " ++ dc)
    Just d  -> return d

subst :: [(TVar, Type)] -> Type -> Type
subst su t = case t of
  TVar x -> fromMaybe t (lookup x su)
  TCon _ -> t
  TApp c ts -> TApp c (map (subst su) ts)
  ti :-> to -> subst su ti :-> subst su to
  TTup ts -> TTup (map (subst su) ts)

newtype Env = Env (Map Var Value)

instance Monoid Env where
  mempty  = baseEnv
  mappend = joinEnv

insertEnv :: Var -> Value -> Env -> Env
insertEnv var val (Env env) = Env (Map.insert var val env)

-- | Left-biased union of environments.
joinEnv :: Env -> Env -> Env
joinEnv (Env e1) (Env e2) = Env (Map.union e1 e2)

lookupEnv :: MonadEval m => Var -> Env -> m Value
lookupEnv v (Env env) = case Map.lookup v env of
  Nothing -> throwError (UnboundVariable v)
  Just x  -> return x

toListEnv :: Env -> [(Var,Value)]
toListEnv (Env e) = Map.toList e

emptyEnv :: Env
emptyEnv = Env Map.empty

withEnv :: MonadEval m => m a -> Env -> m a
m `withEnv` env = do
  st <- get
  setVarEnv env
  a <- m
  put st
  return a

----------------------------------------------------------------------
-- Primitives
----------------------------------------------------------------------

baseTypeEnv = Map.fromList $ map (\td -> (tyCon td, td)) 
  [ tUnit, tList, tOption, tExn ]

baseDataEnv = Map.fromList $ concatMap (\TypeDecl {..} -> case tyRhs of
                                         Alias _ -> []
                                         Alg ds -> [(dCon d, d) | d <- ds])
                           $ Map.elems baseTypeEnv

mkTypeDecl :: TCon -> [TVar] -> (TypeDecl -> TypeRhs) -> TypeDecl
mkTypeDecl tyCon tyVars mkRhs = let td = TypeDecl tyCon tyVars (mkRhs td) in td

mkAlgRhs :: [TypeDecl -> DataDecl] -> TypeDecl -> TypeRhs
mkAlgRhs rhss td = Alg $ map ($td) rhss

tUnit   = mkTypeDecl "()"     []    (mkAlgRhs [dUnit])
tList   = mkTypeDecl "list"   ["a"] (mkAlgRhs [dNil, dCons])
tOption = mkTypeDecl "option" ["a"] (mkAlgRhs [dNone, dSome])
tExn    = mkTypeDecl "exn"    []    (mkAlgRhs [dNot_found, dMatch_failure, dInvalid_argument])

dUnit = DataDecl "()" Nothing
dNil = DataDecl "[]" Nothing
dCons = DataDecl "::" (Just (TTup [ TVar "a", TApp "list" [TVar "a"] ]))
dNone = DataDecl "None" Nothing
dSome = DataDecl "Some" (Just (TVar "a"))
dNot_found = DataDecl "Not_found" Nothing
dMatch_failure = DataDecl "Match_failure" Nothing
dInvalid_argument = DataDecl "Invalid_argument" (Just (TCon "string"))

primBops :: [(Var, Bop)]
primBops = [("+",Plus), ("-",Minus), ("*",Times), ("/",Div), ("mod",Mod)
           ,("+.",FPlus), ("-.",FMinus), ("*.",FTimes), ("/.",FDiv)
           ,("=",Eq), ("==",Eq), ("<>",Neq), ("!=",Neq)
           ,(">",Gt), (">=", Ge), ("<",Lt), ("<=",Le)
           ]

primVars :: [(Var, Value)]
primVars = [ ("[]", VL [] (TVar "a"))
           , ("::", VF (Func (mkLams [VarPat "x", VarPat "xs"]
                                     (mkConApp "::" [Var "x", Var "xs"]))
                             emptyEnv))
           , ("()", VU)
           , ("min_float", VD 0.0) -- FIXME: this is bogus, how do i get the max Double?
           , ("max_float", VD 0.0) -- FIXME: this is bogus, how do i get the max Double?
           , ("max"
             ,mkNonRec $ mkLams [VarPat "x", VarPat "y"]
                                (Ite (mkApps (Var ">=") [Var "x", Var "y"])
                                     (Var "x") (Var "y")))
           , ("min"
             ,mkNonRec $ mkLams [VarPat "x", VarPat "y"]
                                (Ite (mkApps (Var "<=") [Var "x", Var "y"])
                                     (Var "x") (Var "y")))
           , ("List.fold_left"
             ,mkRec "List.fold_left"
                    (mkLams [VarPat "f", VarPat "b", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,Var "b")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,mkApps (Var "List.fold_left")
                                      [Var "f"
                                      ,mkApps (Var "f") [Var "b",Var "y"]
                                      ,Var "ys"
                                      ]
                              )
                             ]))
             )
           , ("List.fold_right"
             ,mkRec "List.fold_right"
                    (mkLams [VarPat "f", VarPat "xs", VarPat "b"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,Var "b")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,mkApps (Var "f")
                                      [Var "y"
                                      ,mkApps (Var "List.fold_right")
                                              [Var "f",Var "b", Var "ys"]
                                      ]
                              )
                             ]))
             )
           , ("List.assoc"
             ,mkRec "List.assoc"
                    (mkLams [VarPat "z", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,App (Var "raise") [mkConApp "Not_found" []])
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Ite (App (Var "=") [Var "z", App (Var "fst") [Var "y"]])
                                   (App (Var "snd") [Var "y"])
                                   (App (Var "List.assoc") [Var "z", Var "ys"])
                              )
                             ]))
             )
           , ("List.filter"
             ,mkRec "List.filter"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,mkConApp "[]" [])
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Ite (App (Var "f") [Var "y"])
                                   (mkConApp "::" [Var "y", App (Var "List.filter") [Var "f", Var "ys"]])
                                   (App (Var "List.filter") [Var "f", Var "ys"])
                              )
                             ]))
             )
           , ("List.map"
             ,mkRec "List.map"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,Var "[]")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,mkConApp "::"
                                [ mkApps (Var "f") [Var "y"]
                                , mkApps (Var "List.map")
                                         [Var "f"
                                         ,Var "ys"
                                         ]
                                ]
                              )
                             ]))
             )
           , ("List.iter"
             ,mkRec "List.iter"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,Var "[]")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Seq (mkApps (Var "f") [Var "y"])
                                   (mkApps (Var "List.iter")
                                           [Var "f"
                                           ,Var "ys"
                                           ])
                              )
                             ]))
             )
           , ("**", mkPrim2Fun $ P2 "exp" pexp)
           , ("@", mkPrim2Fun $ P2 "@" pappend)
           , ("^", mkPrim2Fun $ P2 "^" pconcat)
           , ("&&", mkPrim2Fun $ P2 "&&" pand)
           , ("&", mkPrim2Fun $ P2 "&" pand)
           , ("||", mkPrim2Fun $ P2 "||" por)
           , ("not", mkPrim1Fun $ P1 "not" pnot)
           , ("fst", mkPrim1Fun $ P1 "fst" pfst)
           , ("snd", mkPrim1Fun $ P1 "snd" psnd)
           , ("failwith", mkPrim1Fun $ P1 "failwith" pfailwith)
           , ("Char.escaped", mkPrim1Fun $ P1 "Char.escaped" pchar_escaped)
           , ("List.append", mkPrim2Fun $ P2 "List.append" pappend)
           , ("List.combine", mkPrim2Fun $ P2 "List.combine" plist_combine)
           , ("List.hd", mkPrim1Fun $ P1 "List.hd" plist_hd)
           , ("List.length", mkPrim1Fun $ P1 "List.length" plist_length)
           , ("List.mem", mkPrim2Fun $ P2 "List.mem" plist_mem)
           , ("List.nth", mkPrim2Fun $ P2 "List.nth" plist_nth)
           , ("List.rev", mkPrim1Fun $ P1 "List.rev" plist_rev)
           , ("List.split", mkPrim1Fun $ P1 "List.split" plist_split)
           , ("List.tl", mkPrim1Fun $ P1 "List.tl" plist_tl)
           , ("String.get", mkPrim2Fun $ P2 "String.get" pstring_get)
           , ("String.length", mkPrim1Fun $ P1 "String.length" pstring_length)
           , ("print_char", mkPrim1Fun $ P1 "print_char" pprint_char)
           , ("print_int", mkPrim1Fun $ P1 "print_int" pprint_int)
           , ("print_string", mkPrim1Fun $ P1 "print_string" pprint_string)
           , ("print_endline", mkPrim1Fun $ P1 "print_endline" pprint_endline)
           , ("print_newline", mkPrim1Fun $ P1 "print_newline" pprint_newline)
           , ("int_of_char", mkPrim1Fun $ P1 "int_of_char" pint_of_char)
           , ("int_of_float", mkPrim1Fun $ P1 "int_of_float" pint_of_float)
           , ("int_of_string", mkPrim1Fun $ P1 "int_of_string" pint_of_string)
           , ("float", mkPrim1Fun $ P1 "float" pfloat)
           , ("float_of_int", mkPrim1Fun $ P1 "float_of_int" pfloat_of_int)
           , ("float_of_string", mkPrim1Fun $ P1 "float_of_string" pfloat_of_string)
           , ("string_of_int", mkPrim1Fun $ P1 "string_of_int" pstring_of_int)
           , ("string_of_float", mkPrim1Fun $ P1 "string_of_float" pstring_of_float)
           , ("abs", mkPrim1Fun $ P1 "abs" pabs)
           , ("abs_float", mkPrim1Fun $ P1 "abs_float" pabs_float)
           , ("exp", mkPrim2Fun $ P2 "exp" pexp)
           , ("log", mkPrim1Fun $ P1 "log" plog)
           , ("log10", mkPrim1Fun $ P1 "log10" plog10)
           , ("mod_float", mkPrim2Fun $ P2 "mod_float" pmod_float)
           , ("modf", mkPrim1Fun $ P1 "modf" pmodf)
           , ("sqrt", mkPrim1Fun $ P1 "sqrt" psqrt)
           , ("acos", mkPrim1Fun $ P1 "acos" pacos)
           , ("asin", mkPrim1Fun $ P1 "asin" pasin)
           , ("atan", mkPrim1Fun $ P1 "atan" patan)
           , ("cos", mkPrim1Fun $ P1 "cos" pcos)
           , ("sin", mkPrim1Fun $ P1 "sin" psin)
           , ("tan", mkPrim1Fun $ P1 "tan" ptan)
           , ("tanh", mkPrim1Fun $ P1 "tanh" ptanh)
           , ("truncate", mkPrim1Fun $ P1 "truncate" ptruncate)
           , ("compare", mkPrim2Fun $ P2 "compare" pcompare)
           , ("raise", mkPrim1Fun $ P1 "raise" praise)
           , ("Printexc.to_string", mkPrim1Fun $ P1 "Printexc.to_string" pprintexc_to_string)
           ]

pfailwith :: MonadEval m => Value -> m Value
pfailwith (VS s) = throwError $ MLException $ VS s

pcompare :: MonadEval m => Value -> Value -> m Value
pcompare = cmpVal

pfst :: MonadEval m => Value -> m Value
pfst (VT 2 [x,_] _) = return x

psnd :: MonadEval m => Value -> m Value
psnd (VT 2 [_,y] _) = return y

pand :: MonadEval m => Value -> Value -> m Value
pand (VB x) (VB y) = return (VB (x && y))

por :: MonadEval m => Value -> Value -> m Value
por (VB x) (VB y) = return (VB (x || y))

pnot :: MonadEval m => Value -> m Value
pnot (VB x) = return (VB (not x))

pabs :: MonadEval m => Value -> m Value
pabs (VI i) = return (VI (abs i))

pabs_float :: MonadEval m => Value -> m Value
pabs_float (VD i) = return (VD (abs i))

pmod_float :: MonadEval m => Value -> Value -> m Value
pmod_float (VD i) (VD j) = return (VD (i - (fromInteger $ floor (i / j)) * j))

pexp :: MonadEval m => Value -> Value -> m Value
pexp (VD i) (VD j) = return (VD (i ** j))

plog :: MonadEval m => Value -> m Value
plog (VD x) = return (VD (log x))

plog10 :: MonadEval m => Value -> m Value
plog10 (VD x) = return (VD (logBase 10 x))

pmodf :: MonadEval m => Value -> m Value
pmodf (VD x) = let (n,d) = properFraction x
               in return (VT 2 [VD d, VD (fromInteger n)] [TCon tFLOAT, TCon tFLOAT])

psqrt :: MonadEval m => Value -> m Value
psqrt (VD i) = return (VD (sqrt i))

pacos :: MonadEval m => Value -> m Value
pacos (VD i) = return (VD (acos i))

pasin :: MonadEval m => Value -> m Value
pasin (VD i) = return (VD (asin i))

patan :: MonadEval m => Value -> m Value
patan (VD i) = return (VD (atan i))

pcos :: MonadEval m => Value -> m Value
pcos (VD i) = return (VD (cos i))

psin :: MonadEval m => Value -> m Value
psin (VD i) = return (VD (sin i))

ptan :: MonadEval m => Value -> m Value
ptan (VD i) = return (VD (tan i))

ptanh :: MonadEval m => Value -> m Value
ptanh (VD i) = return (VD (tanh i))

ptruncate :: MonadEval m => Value -> m Value
ptruncate (VD i) = return (VI (truncate i))

pint_of_char :: MonadEval m => Value -> m Value
pint_of_char (VC c) = return (VI (ord c))

pint_of_string :: MonadEval m => Value -> m Value
pint_of_string (VS s) = return (VI (read s))

pint_of_float :: MonadEval m => Value -> m Value
pint_of_float (VD d) = return (VI (truncate d))

pfloat_of_int :: MonadEval m => Value -> m Value
pfloat_of_int (VI i) = return (VD (fromIntegral i))

pfloat :: MonadEval m => Value -> m Value
pfloat = pfloat_of_int

pfloat_of_string :: MonadEval m => Value -> m Value
pfloat_of_string (VS s) = return (VD (read s))

pstring_of_int :: MonadEval m => Value -> m Value
pstring_of_int (VI i) = return (VS (show i))

pstring_of_float :: MonadEval m => Value -> m Value
pstring_of_float (VD i) = return (VS (show i))

-- pstring_concat :: MonadEval m => Value -> Value -> m Value
-- pstring_concat (VS s) (VL xs) = return (VL ())

pstring_get :: MonadEval m => Value -> Value -> m Value
pstring_get (VS s) (VI i) = return (VC (s !! i))

pstring_length :: MonadEval m => Value -> m Value
pstring_length (VS s) = return (VI (length s))

pprint_string :: MonadEval m => Value -> m Value
pprint_string (VS s) = do
  opts <- ask
  when (enablePrint opts) $
    liftIO $ putStr s
  return VU

pprint_endline :: MonadEval m => Value -> m Value
pprint_endline (VS s) = do
  opts <- ask
  when (enablePrint opts) $
    liftIO $ putStrLn s
  return VU

pprint_newline :: MonadEval m => Value -> m Value
pprint_newline (VS s) = do
  opts <- ask
  when (enablePrint opts) $
    liftIO $ putStrLn ""
  return VU

pprint_int :: MonadEval m => Value -> m Value
pprint_int (VI i) = do
  opts <- ask
  when (enablePrint opts) $
    liftIO $ putStr $ show i
  return VU

pprint_char :: MonadEval m => Value -> m Value
pprint_char (VC c) = do
  opts <- ask
  when (enablePrint opts) $
    liftIO $ putStr $ [c]
  return VU

pchar_escaped :: MonadEval m => Value -> m Value
pchar_escaped (VC c) = return (VS (showLitChar c ""))

plist_combine :: MonadEval m => Value -> Value -> m Value
plist_combine (VL xs tx) (VL ys ty)
  | tx == ty
  = if length xs == length ys
    then return (VL (zipWith (\x y -> VT 2 [x,y] [tx, ty]) xs ys) (TTup [tx,ty]))
    else throwError (MLException (mkExn "Invalid_argument" [VS "List.combine"]))
  | otherwise = typeError $ printf "(%s) (%s)" (show tx) (show ty)

plist_nth :: MonadEval m => Value -> Value -> m Value
plist_nth (VL xs _) (VI n)
  | n >= 0 && n < length xs
  = return (xs !! n)
  | otherwise
  = throwError (MLException (mkExn "Invalid_argument" [VS "List.nth"]))

plist_split :: MonadEval m => Value -> m Value
plist_split (VL xs (TTup [ta, tb]))
  = return (VT (length xs) [VL as ta, VL bs tb] [ta, tb])
  where
  -- FIXME: these list functions really shouldn't be primitives,
  -- introduces nasty laziness issues..
  (as, bs) = unzip . map (\(VT _ [a,b] _) -> (a,b)) $ xs

plist_mem :: MonadEval m => Value -> Value -> m Value
plist_mem x (VL xs t) = VB <$> allM (`eqVal` x) xs

plist_length :: MonadEval m => Value -> m Value
plist_length (VL s _) = return (VI (length s))

plist_rev :: MonadEval m => Value -> m Value
plist_rev (VL xs t) = return (VL (reverse xs) t)

plist_hd :: MonadEval m => Value -> m Value
plist_hd (VL (x:_) _) = return x

plist_tl :: MonadEval m => Value -> m Value
plist_tl (VL (_:xs) t) = return (VL xs t)

pappend :: MonadEval m => Value -> Value -> m Value
pappend (VL xs tx) (VL ys ty)
  | tx == ty  = return (VL (xs ++ ys) tx)
  | otherwise = typeError $ printf "(%s) (%s)" (show tx) (show ty)

pconcat :: MonadEval m => Value -> Value -> m Value
pconcat (VS xs) (VS ys) = return (VS (xs ++ ys))

praise :: MonadEval m => Value -> m Value
praise x@(VA {}) = throwError (MLException x)

pprintexc_to_string :: MonadEval m => Value -> m Value
pprintexc_to_string x@(VA {}) = return $ VS $ show x

mkNonRec :: Expr -> Value
mkNonRec lam = func
  where
  func = VF (Func lam env)
  env  = baseEnv

mkRec :: Var -> Expr -> Value
mkRec f lam = func
  where
  func = VF (Func lam env)
  env  = insertEnv f func baseEnv

baseEnv :: Env
baseEnv = Env . Map.fromList
        $  map (second mkBopFun) primBops
        ++ primVars

mkBopFun :: Bop -> Value
mkBopFun bop = VF $ Func (mkLams [VarPat "x", VarPat "y"]
                                 (Bop bop (Var "x") (Var "y")))
                         emptyEnv

mkPrim1Fun :: Prim1 -> Value
mkPrim1Fun f = VF $ Func (mkLams [VarPat "x"]
                                 (Prim1 f (Var "x")))
                         emptyEnv

mkPrim2Fun :: Prim2 -> Value
mkPrim2Fun f = VF $ Func (mkLams [VarPat "x", VarPat "y"]
                                 (Prim2 f (Var "x") (Var "y")))
                         emptyEnv

data Value
  = VI Int
  | VD Double
  | VC Char
  | VS String
  | VB Bool
  | VU
  | VL [Value] Type
  | VT Int [Value] [Type] -- VT sz:{Nat | sz >= 2} (ListN Value sz)
  | VA DCon (Maybe Value) Type
  | VF Func
  deriving (Show, Generic)

data Func
  = Func Expr Env
  deriving (Generic)

-- NOTE: we can NEVER print the captured environment since recursive
-- functions will refer to themselves
instance Show Func where
  showsPrec p (Func expr _) = showsPrec p expr

data Literal
  = LI Int
  | LD Double
  | LB Bool
  | LC Char
  | LS String
  | LU
  deriving (Show, Generic)

data RecFlag = Rec | NonRec deriving (Show, Generic)

data SrcSpan = SrcSpan
  { srcSpanStartLine :: !Int
  , srcSpanStartCol  :: !Int
  , srcSpanEndLine   :: !Int
  , srcSpanEndCol    :: !Int
  } deriving (Show, Generic)

type Prog = [Decl]

data Decl
  = DFun SrcSpan RecFlag [(Pat,Expr)]
  | DTyp SrcSpan [TypeDecl]
  | DExn SrcSpan DataDecl
  deriving (Show, Generic)

getSrcSpan :: Decl -> SrcSpan
getSrcSpan d = case d of
  DFun ss _ _ -> ss
  DTyp ss _ -> ss
  DExn ss _ -> ss

data Expr
  = Var Var
  | Lam Pat Expr
  | App Expr [Expr]
  | Bop Bop Expr Expr
  | Uop Uop Expr
  | Lit Literal
  | Let RecFlag [(Pat,Expr)] Expr
  | Ite Expr Expr Expr
  | Seq Expr Expr -- TODO: do we actually need this for the student examples?
  | Case Expr [Alt]
  | Tuple [Expr]
  | ConApp DCon (Maybe Expr)
  | Try Expr [Alt]
  | Prim1 Prim1 Expr
  | Prim2 Prim2 Expr Expr
  | Val Value -- embed a value inside an Expr for ease of tracing
  deriving (Show, Generic)

-- instance SubTypes Expr

data Prim1 = P1 Var (forall m. MonadEval m => Value -> m Value)
instance Show Prim1 where
  show (P1 v _) = v
data Prim2 = P2 Var (forall m. MonadEval m => Value -> Value -> m Value)
instance Show Prim2 where
  show (P2 v _) = v

-- data ExprF f
--   = VarF Var
--   | LamF Var f
--   | AppF f f
--   | BopF Bop f f
--   | LitF Literal
--   | LetF RecFlag Pat f f
--   | IteF f f f
--   | SeqF f f -- TODO: do we actually need this for the student examples?
--   | CaseF f [(Pat, ExprF f)]
--   | ConsF f f
--   | NilF
--   | TupleF [f]
--   deriving (Show, Functor)

-- type LocExpr = Fix ExprF Careted

data Uop
  = Neg | FNeg
  deriving (Show)

data Bop
  = Eq | Neq
  | Lt | Le
  | Gt | Ge
  | And | Or
  | Plus  | Minus  | Times  | Div  | Mod
  | FPlus | FMinus | FTimes | FDiv | FExp
  deriving (Show)

type Alt = (Pat, Guard, Expr)

type Guard = Maybe Expr

data Pat
  = VarPat Var
  | LitPat Literal
  | ConsPat Pat Pat
  | ConPat Var (Maybe Pat)
  | ListPat [Pat]
  | TuplePat [Pat]
  | WildPat
  | OrPat Pat Pat
  | AsPat Pat Var
  deriving (Show)

data Type
  = TVar TVar
  | TCon TCon
  | TApp TCon [Type]
  | Type :-> Type
  | TTup [Type]
  deriving (Show, Eq)

infixr :->

tINT = "int"
tFLOAT = "float"
tCHAR = "char"
tSTRING = "string"
tBOOL = "bool"
tLIST = "list"
tUNIT = "()"
tEXN = "exn"

argTys :: Type -> [Type]
argTys (i :-> o) = i : argTys o
argTys _         = []

resTy :: Type -> Type
resTy (_ :-> o) = resTy o
resTy t         = t

data TypeDecl
  = TypeDecl { tyCon :: TCon, tyVars :: [TVar], tyRhs :: TypeRhs }
  deriving (Show)

data TypeRhs
  = Alias Type
  | Alg   [DataDecl]
  deriving (Show)

data DataDecl
  = DataDecl { dCon :: DCon, dArg :: Maybe Type, dType :: TypeDecl }
  deriving (Show)

typeDeclType TypeDecl {..} = TApp tyCon $ map TVar tyVars

typeDataCons TypeDecl { tyRhs = Alg ds } = ds

type TVar = String

type TCon = String

type DCon = String


unifyVal :: MonadEval m => Type -> Value -> m [(TVar, Type)]
unifyVal (TVar a) v
  = return [(a, typeOf v)] -- FIXME: occur check
unifyVal (TCon "int") (VI _)
  = return []
unifyVal (TCon "float") (VD _)
  = return []
unifyVal (TCon "char") (VC _)
  = return []
unifyVal (TCon "string") (VS _)
  = return []
unifyVal (TCon "bool") (VB _)
  = return []
unifyVal (TCon "()") VU
  = return []
unifyVal (TApp "list" [t]) (VL _ vt)
  = unify t vt
unifyVal (TApp _ ts) (VA _ _ (TApp _ vts))
  = mconcat <$> zipWithM unify ts vts
unifyVal (ti :-> to) (VF _)
  = return []
unifyVal (TTup ts) (VT _ _ vts)
  = mconcat <$> zipWithM unify ts vts

unify :: MonadEval m => Type -> Type -> m [(TVar, Type)]
unify (TVar a) t = unifyVar a t
unify t (TVar a) = unifyVar a t
unify (TCon x) (TCon y)
  | x == y
  = return []
unify (xi :-> xo) (yi :-> yo)
  = mappend <$> unify xi yi <*> unify xo yo
unify (TTup xs) (TTup ys)
  = mconcat <$> zipWithM unify xs ys
unify (TApp xc xts) (TApp yc yts)
  | xc == yc
  = mconcat <$> zipWithM unify xts yts
unify x y
  = typeError $ printf "could not match %s against %s" (show x) (show y)

unifyVar :: Monad m => TVar -> Type -> m [(TVar, Type)]
unifyVar a t
  | t == TVar a = return []
  -- FIXME: occurs check
  | otherwise   = return [(a,t)]

typeOf :: Value -> Type
typeOf v = case v of
  VI _ -> TCon tINT
  VD _ -> TCon tFLOAT
  VC _ -> TCon tCHAR
  VS _ -> TCon tSTRING
  VB _ -> TCon tBOOL
  VU   -> TCon tUNIT
  VL _ t -> TApp tLIST [t]
  VT _ _ ts -> TTup ts
  VA _ _ t -> t
  VF _ -> TVar "a" :-> TVar "b"
  -- VF _ -> error "typeOf: <<function>>"

----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

{-@ mkCurried :: ListNE Pat -> Expr -> Expr @-}
mkCurried :: [Pat] -> Expr -> Expr
mkCurried [p]    e = Lam p e
mkCurried (p:ps) e = Lam p (mkCurried ps e)
mkCurried p e = error $ "mkCurried: " ++ show p ++ " " ++ show e

mkInfix :: Expr -> Expr -> Expr -> Expr
mkInfix x op y = mkApps op [x,y]

mkApps :: Expr -> [Expr] -> Expr
mkApps = App

mkConApp :: DCon -> [Expr] -> Expr
mkConApp c []  = ConApp c Nothing
mkConApp c [e] = ConApp c (Just e)
mkConApp c es  = ConApp c (Just (Tuple es))

mkLams :: [Pat] -> Expr -> Expr
mkLams ps e = case ps of
  []   -> e
  p:ps -> Lam p (mkLams ps e)

mkList :: [Expr] -> Expr
mkList = foldr (\h t -> mkConApp "::" [h,t]) (mkConApp "[]" [])

mkFunction :: [Alt] -> Expr
mkFunction alts = Lam (VarPat "$x") (Case (Var "$x") alts)

mkTApps :: TCon -> [Type] -> Type
mkTApps = TApp

mkUMinus :: Var -> Expr -> Expr
mkUMinus "-"  (Lit (LI i)) = Lit (LI (- i))
mkUMinus "-." (Lit (LD d)) = Lit (LD (- d))
mkUMinus "-"  e            = mkApps (Var "-")  [Lit (LI 0), e]
mkUMinus "-." e            = mkApps (Var "-.") [Lit (LD 0), e]

mkExn :: DCon -> [Value] -> Value
mkExn dcon []   = VA dcon Nothing (TCon tEXN)
mkExn dcon [a]  = VA dcon (Just a) (TCon tEXN)
mkExn dcon args = VA dcon (Just (VT (length args) args (map typeOf args)))
                     (TCon tEXN)

eqVal (VI x) (VI y) = return (x == y)
eqVal (VD x) (VD y) = return (x == y)
eqVal (VB x) (VB y) = return (x == y)
eqVal (VC x) (VC y) = return (x == y)
eqVal (VS x) (VS y) = return (x == y)
eqVal VU     VU     = return True
eqVal (VL x _) (VL y _) = and . ((length x == length y) :) <$> zipWithM eqVal x y
eqVal (VT i x _) (VT j y _)
  | i == j
  = and <$> zipWithM eqVal x y
eqVal (VF x) (VF y) = typeError "cannot compare functions"
eqVal (VA c1 Nothing t1) (VA c2 Nothing t2)
  | c1 == c2 = return True
  | t1 == t2 = return False
eqVal (VA c1 (Just v1) t1) (VA c2 (Just v2) t2)
  | c1 == c2 = eqVal v1 v2
  | t1 == t2 = return False
eqVal x y
  -- = return False
  = typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)

cmpVal (VI x) (VI y) = return (cmp x y)
cmpVal (VD x) (VD y) = return (cmp x y)
cmpVal (VB x) (VB y) = return (cmp x y)
cmpVal (VC x) (VC y) = return (cmp x y)
cmpVal (VS x) (VS y) = return (cmp x y)
cmpVal VU     VU     = return (VI 0)
cmpVal (VL x _) (VL y _) = cmpAnd . ((length x `cmp` length y) :) <$> zipWithM cmpVal x y
cmpVal (VT i x _) (VT j y _)
  | i == j
  = cmpAnd <$> zipWithM cmpVal x y
cmpVal (VF x) (VF y) = typeError "cannot compare functions"
cmpVal x@(VA c1 v1 _) y@(VA c2 v2 _) = do
  dd1 <- lookupDataCon c2
  dd2 <- lookupDataCon c2
  unless (tyCon (dType dd1) == tyCon (dType dd2)) $
    typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)
  let dcs = map dCon . typeDataCons . dType $ dd1
  case compare (fromJust (elemIndex c1 dcs)) (fromJust (elemIndex c2 dcs)) of
    LT -> return (VI (-1))
    GT -> return (VI 1)
    EQ -> case (v1, v2) of
      (Nothing, Nothing) -> return (VI 0)
      (Just v1, Just v2) -> cmpVal v1 v2
  -- = cmpAnd <$> zipWithM cmpVal vs1 vs2 -- FIXME: compare datacons too..
cmpVal x y
  -- = return False
  = typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)

cmp x y = VI $ fromEnum (compare x y) - 1

cmpAnd []        = VI 0
cmpAnd (VI 0:xs) = cmpAnd xs
cmpAnd (x:xs)    = x

allM :: Monad m => (a -> m Bool) -> [a] -> m Bool
allM f []     = return True
allM f (x:xs) = (&&) <$> f x <*> allM f xs
