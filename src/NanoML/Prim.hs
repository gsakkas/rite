{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase      #-}
{-# LANGUAGE RecordWildCards #-}
module NanoML.Prim where

import Control.Arrow
import Control.Monad.Except
import Control.Monad.Random
import Control.Monad.Reader
import Data.Char
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Text.Printf
import Text.Read

import NanoML.Gen
import NanoML.Types

baseTypeEnv = Map.fromList $ map (\td -> (tyCon td, td)) 
  [ tInt, tFloat, tBool, tChar, tString, tArray
  , tUnit, tList, tOption, tExn, tRef
  ]

baseDataEnv = Map.fromList $ concatMap (\TypeDecl {..} -> case tyRhs of
                                         Alg ds -> [(dCon d, d) | d <- ds]
                                         _ -> [])
                           $ Map.elems baseTypeEnv

baseFieldEnv = Map.fromList $ concatMap (\td@TypeDecl {..} -> case tyRhs of
                                          TRec flds -> [(f, td) | (f,_,_) <- flds]
                                          _ -> [])
                            $ Map.elems baseTypeEnv

mkTypeDecl :: TCon -> [TVar] -> (TypeDecl -> TypeRhs) -> TypeDecl
mkTypeDecl tyCon tyVars mkRhs = let td = TypeDecl tyCon tyVars (mkRhs td) in td

mkAlgRhs :: [TypeDecl -> DataDecl] -> TypeDecl -> TypeRhs
mkAlgRhs rhss td = Alg $ map ($ td) rhss

tInt    = mkTypeDecl "int"    []    (mkAlgRhs [])
tFloat  = mkTypeDecl "float"  []    (mkAlgRhs [])
tBool   = mkTypeDecl "bool"   []    (mkAlgRhs [])
tChar   = mkTypeDecl "char"   []    (mkAlgRhs [])
tString = mkTypeDecl "string" []    (mkAlgRhs [])
tArray  = mkTypeDecl "array"  ["a"] (mkAlgRhs [])
tUnit   = mkTypeDecl "unit"   []    (mkAlgRhs [dUnit])
tList   = mkTypeDecl "list"   ["a"] (mkAlgRhs [dNil, dCons])
tOption = mkTypeDecl "option" ["a"] (mkAlgRhs [dNone, dSome])
tExn    = mkTypeDecl "exn"    []    (mkAlgRhs [dFailure, dNot_found, dMatch_failure, dInvalid_argument])
tRef    = mkTypeDecl "ref"    ["a"] (\td -> TRec [("contents", Mut, TVar "a")])

dUnit = DataDecl "()" []
dNil = DataDecl "[]" []
dCons = DataDecl "::" [ TVar "a", TApp "list" [TVar "a"] ]
dNone = DataDecl "None" []
dSome = DataDecl "Some" [TVar "a"]
dFailure = DataDecl "Failure" []
dNot_found = DataDecl "Not_found" []
dMatch_failure = DataDecl "Match_failure" []
dInvalid_argument = DataDecl "Invalid_argument" [tCon "string"]

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
           , ("!", mkNonRec $ mkLams [VarPat "x"] (Field (Var "x") "contents"))
           , (":=", mkNonRec $ mkLams [VarPat "x", VarPat "v"]
                                      (SetField (Var "x") "contents" (Var "v")))
           , ("ref", mkNonRec $ mkLams [VarPat "x"] (Record [("contents", Var "x")]))
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
           , ("List.exists"
             ,mkRec "List.exists"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,Lit (LB False))
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Ite (App (Var "f") [Var "y"])
                                   (Lit (LB True))
                                   (App (Var "List.exists") [Var "f", Var "ys"])
                              )
                             ]))
             )
           , ("List.for_all"
             ,mkRec "List.for_all"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" Nothing
                              ,Nothing
                              ,Lit (LB True))
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Ite (App (Var "not") [App (Var "f") [Var "y"]])
                                   (Lit (LB False))
                                   (App (Var "List.for_all") [Var "f", Var "ys"])
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
           , ("Sys.argv", VV (Vector.fromList [VS "foo", VS "bar", VS "qux"]) (tCon "string"))
           , ("**", mkPrim2Fun $ P2 "exp" pexp tF tF)
           , ("@", mkPrim2Fun $ P2 "@" pappend (tL a) (tL a))
           , ("^", mkPrim2Fun $ P2 "^" pconcat tS tS)
           , ("&&", mkPrim2Fun $ P2 "&&" pand tB tB)
           , ("&", mkPrim2Fun $ P2 "&" pand tB tB)
           , ("||", mkPrim2Fun $ P2 "||" por tB tB)
           , ("not", mkPrim1Fun $ P1 "not" pnot tB)
           , ("fst", mkPrim1Fun $ P1 "fst" pfst (tT a b))
           , ("snd", mkPrim1Fun $ P1 "snd" psnd (tT a b))
           , ("failwith", mkPrim1Fun $ P1 "failwith" pfailwith tS)
           , ("Array.get", mkPrim2Fun $ P2 "Array.get" parray_get (tA a) tI)
           , ("Char.code", mkPrim1Fun $ P1 "Char.code" pchar_code tC)
           , ("Char.compare", mkPrim2Fun $ P2 "Char.compare" pchar_compare tC tC)
           , ("Char.escaped", mkPrim1Fun $ P1 "Char.escaped" pchar_escaped tC)
           , ("Char.lowercase", mkPrim1Fun $ P1 "Char.lowercase" pchar_lowercase tC)
           , ("Char.uppercase", mkPrim1Fun $ P1 "Char.uppercase" pchar_uppercase tC)
           , ("List.append", mkPrim2Fun $ P2 "List.append" pappend (tL a) (tL a))
           , ("List.combine", mkPrim2Fun $ P2 "List.combine" plist_combine (tL a) (tL b))
           , ("List.hd", mkPrim1Fun $ P1 "List.hd" plist_hd (tL a))
           , ("List.length", mkPrim1Fun $ P1 "List.length" plist_length (tL a))
           , ("List.mem", mkPrim2Fun $ P2 "List.mem" plist_mem a (tL a))
           , ("List.nth", mkPrim2Fun $ P2 "List.nth" plist_nth (tL a) tI)
           , ("List.rev", mkPrim1Fun $ P1 "List.rev" plist_rev (tL a))
           , ("List.split", mkPrim1Fun $ P1 "List.split" plist_split (tL (tT a b)))
           , ("List.tl", mkPrim1Fun $ P1 "List.tl" plist_tl (tL a))
           , ("String.create", mkPrim1Fun $ P1 "String.create" pstring_create tI)
           , ("String.get", mkPrim2Fun $ P2 "String.get" pstring_get tS tI)
           , ("String.length", mkPrim1Fun $ P1 "String.length" pstring_length tS)
           , ("String.make", mkPrim2Fun $ P2 "String.make" pstring_make tS tC)
           , ("print_char", mkPrim1Fun $ P1 "print_char" pprint_char tC)
           , ("print_int", mkPrim1Fun $ P1 "print_int" pprint_int tI)
           , ("print_float", mkPrim1Fun $ P1 "print_float" pprint_float tF)
           , ("print_string", mkPrim1Fun $ P1 "print_string" pprint_string tS)
           , ("print_endline", mkPrim1Fun $ P1 "print_endline" pprint_endline tS)
           , ("print_newline", mkPrim1Fun $ P1 "print_newline" pprint_newline tU)
           , ("char_of_int", mkPrim1Fun $ P1 "char_of_int" pchar_of_int tI)
           , ("int_of_char", mkPrim1Fun $ P1 "int_of_char" pint_of_char tC)
           , ("int_of_float", mkPrim1Fun $ P1 "int_of_float" pint_of_float tF)
           , ("int_of_string", mkPrim1Fun $ P1 "int_of_string" pint_of_string tS)
           , ("float", mkPrim1Fun $ P1 "float" pfloat tI)
           , ("float_of_int", mkPrim1Fun $ P1 "float_of_int" pfloat_of_int tI)
           , ("float_of_string", mkPrim1Fun $ P1 "float_of_string" pfloat_of_string tS)
           , ("string_of_bool", mkPrim1Fun $ P1 "string_of_bool" pstring_of_bool tB)
           , ("string_of_int", mkPrim1Fun $ P1 "string_of_int" pstring_of_int tI)
           , ("string_of_float", mkPrim1Fun $ P1 "string_of_float" pstring_of_float tF)
           , ("abs", mkPrim1Fun $ P1 "abs" pabs tI)
           , ("abs_float", mkPrim1Fun $ P1 "abs_float" pabs_float tF)
           , ("exp", mkPrim2Fun $ P2 "exp" pexp tF tF)
           , ("log", mkPrim1Fun $ P1 "log" plog tF)
           , ("log10", mkPrim1Fun $ P1 "log10" plog10 tF)
           , ("mod_float", mkPrim2Fun $ P2 "mod_float" pmod_float tF tF)
           , ("modf", mkPrim1Fun $ P1 "modf" pmodf tF)
           , ("sqrt", mkPrim1Fun $ P1 "sqrt" psqrt tF)
           , ("acos", mkPrim1Fun $ P1 "acos" pacos tF)
           , ("asin", mkPrim1Fun $ P1 "asin" pasin tF)
           , ("atan", mkPrim1Fun $ P1 "atan" patan tF)
           , ("cos", mkPrim1Fun $ P1 "cos" pcos tF)
           , ("sin", mkPrim1Fun $ P1 "sin" psin tF)
           , ("tan", mkPrim1Fun $ P1 "tan" ptan tF)
           , ("tanh", mkPrim1Fun $ P1 "tanh" ptanh tF)
           , ("truncate", mkPrim1Fun $ P1 "truncate" ptruncate tF)
           , ("compare", mkPrim2Fun $ P2 "compare" pcompare a a)
           , ("raise", mkPrim1Fun $ P1 "raise" praise tE)
           , ("Printexc.to_string", mkPrim1Fun $ P1 "Printexc.to_string" pprintexc_to_string tE)
           ]

pfailwith :: MonadEval m => Value -> m Value
pfailwith (VS s) = maybeThrow $ MLException (mkExn "Failure" [VS s])

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
               in return (VT 2 [VD d, VD (fromInteger n)] [tCon tFLOAT, tCon tFLOAT])

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

pchar_of_int :: MonadEval m => Value -> m Value
pchar_of_int (VI i) = return (VC (chr i))

pint_of_char :: MonadEval m => Value -> m Value
pint_of_char (VC c) = return (VI (ord c))

pint_of_string :: MonadEval m => Value -> m Value
pint_of_string (VS s) = case readMaybe s of
  Just i  -> return (VI i)
  Nothing -> maybeThrow $ MLException (mkExn "Failure" [VS "int_of_string"])

pint_of_float :: MonadEval m => Value -> m Value
pint_of_float (VD d) = return (VI (truncate d))

pfloat_of_int :: MonadEval m => Value -> m Value
pfloat_of_int (VI i) = return (VD (fromIntegral i))

pfloat :: MonadEval m => Value -> m Value
pfloat = pfloat_of_int

pfloat_of_string :: MonadEval m => Value -> m Value
pfloat_of_string (VS s) = case readMaybe s of
  Just d  -> return (VD d)
  Nothing -> maybeThrow $ MLException (mkExn "Failure" [VS "float_of_string"])

pstring_of_int :: MonadEval m => Value -> m Value
pstring_of_int (VI i) = return (VS (show i))

pstring_of_float :: MonadEval m => Value -> m Value
pstring_of_float (VD i) = return (VS (show i))

pstring_of_bool :: MonadEval m => Value -> m Value
pstring_of_bool (VB b) = return (VS (if b then "true" else "false"))

-- pstring_concat :: MonadEval m => Value -> Value -> m Value
-- pstring_concat (VS s) (VL xs) = return (VL ())

pstring_get :: MonadEval m => Value -> Value -> m Value
pstring_get (VS s) (VI i)
  | i >= 0 && i < length s
  = return (VC (s !! i))
  | otherwise
  = maybeThrow $ MLException $ mkExn "Invalid_argument" [VS "index out of bounds"]

pstring_length :: MonadEval m => Value -> m Value
pstring_length (VS s) = return (VI (length s))

pstring_create :: MonadEval m => Value -> m Value
pstring_create (VI n) = return (VS (replicate n '\NUL'))

pstring_make :: MonadEval m => Value -> Value -> m Value
pstring_make (VI n) (VC c) = return (VS (replicate n c))

parray_get :: MonadEval m => Value -> Value -> m Value
parray_get (VV a _) (VI i)
  | i >= 0 && i < Vector.length a
  = return (a Vector.! i)
  | otherwise
  = maybeThrow $ MLException $ mkExn "Invalid_argument" [VS "index out of bounds"]

pprint_string :: MonadEval m => Value -> m Value
pprint_string (VS s) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr s
  return VU

pprint_endline :: MonadEval m => Value -> m Value
pprint_endline (VS s) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStrLn s
  return VU

pprint_newline :: MonadEval m => Value -> m Value
pprint_newline VU = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStrLn ""
  return VU

pprint_int :: MonadEval m => Value -> m Value
pprint_int (VI i) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr $ show i
  return VU

pprint_float :: MonadEval m => Value -> m Value
pprint_float (VD f) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr $ show f
  return VU

pprint_char :: MonadEval m => Value -> m Value
pprint_char (VC c) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr $ [c]
  return VU

pchar_code :: MonadEval m => Value -> m Value
pchar_code (VC c) = return (VI (ord c))

pchar_compare :: MonadEval m => Value -> Value -> m Value
pchar_compare (VC c1) (VC c2) = cmpVal (VC c1) (VC c2)

pchar_escaped :: MonadEval m => Value -> m Value
pchar_escaped (VC c) = return (VS (showLitChar c ""))

pchar_lowercase :: MonadEval m => Value -> m Value
pchar_lowercase (VC c) = return (VC (toLower c))

pchar_uppercase :: MonadEval m => Value -> m Value
pchar_uppercase (VC c) = return (VC (toUpper c))

plist_combine :: MonadEval m => Value -> Value -> m Value
plist_combine (VL xs tx) (VL ys ty)
  | length xs == length ys
  = return (VL (zipWith (\x y -> VT 2 [x,y] [tx, ty]) xs ys) (TTup [tx,ty]))
  | otherwise
  = maybeThrow (MLException (mkExn "Invalid_argument" [VS "List.combine"]))

plist_nth :: MonadEval m => Value -> Value -> m Value
plist_nth (VL xs _) (VI n)
  | n >= 0 && n < length xs
  = return (xs !! n)
  | otherwise
  = maybeThrow (MLException (mkExn "Invalid_argument" [VS "List.nth"]))

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
pappend (VL xs tx) (VL ys ty) = do
  su <- unify tx ty
  return (VL (xs ++ ys) (subst su tx))

pconcat :: MonadEval m => Value -> Value -> m Value
pconcat (VS xs) (VS ys) = return (VS (xs ++ ys))

praise :: MonadEval m => Value -> m Value
praise x@(VA {}) = maybeThrow (MLException x)

pprintexc_to_string :: MonadEval m => Value -> m Value
pprintexc_to_string x@(VA {}) = return $ VS $ show x

getField :: MonadEval m => Value -> String -> m Value
getField x@(VR fs _) f = case lookup f fs of
  Just i  -> snd <$> readStore i
  Nothing -> typeError $ printf "record %s does not have a field '%s'"
                                (show x) f
getField x f = typeError $ printf "%s is not a record" (show x)

setField :: MonadEval m => Value -> String -> Value -> m ()
setField x@(VR fs _) f v = case lookup f fs of
  Nothing    -> typeError $ printf "record %s does not have a field '%s'"
                                   (show x) f
  Just i -> do
    (m, _) <- readStore i
    case m of
      Mut -> writeStore i (m,v)
      _   -> typeError $ printf "field '%s' is not mutable" f
setField x _ _ = typeError $ printf "%s is not a record" (show x)

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

tI = tCon tINT
tF = tCon tFLOAT
tC = tCon tCHAR
tS = tCon tSTRING
tB = tCon tBOOL
tU = tCon tUNIT
tA t = mkTApps tARRAY [t]
tL t = mkTApps tLIST [t]
tE = tCon tEXN
a = TVar "a"
b = TVar "b"
tT x y = TTup [x,y]


maybeThrow :: MonadEval m => NanoError -> m Value
maybeThrow err = do
  b <- getRandom
  r <- asks exceptionRecovery
  unless (r && b) $ throwError err
  r <- fresh
  return (VH r Nothing)
