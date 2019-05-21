{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase      #-}
{-# LANGUAGE RecordWildCards #-}
module NanoML.Prim
  ( baseEnv, baseTypeEnv, baseDataEnv, baseFieldEnv
  , tB, tL, tU, pand, por, getField, setField
  , maybeThrow
  , primVars, primVarTypes
  , mkPrim1Fun, mkPrim2Fun
  , pappend
  ) where

import Control.Arrow
import Control.Monad.Except
import Control.Monad.Random
import Control.Monad.Reader
import Data.Char
import Data.List
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Text.Printf
import Text.Read

import NanoML.Gen
import NanoML.Types

baseTypeEnv = Map.fromList $ map (\td -> (tyCon td, td))
  [ tInt, tFloat, tBool, tChar, tString, tArray
  , tUnit, tList, tOption, tExn, tRef
  , tRand
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
tExn    = mkTypeDecl "exn"    []    (mkAlgRhs [dFailure, dNot_found, dMatch_failure, dInvalid_argument, dDivision_by_zero])
tRef    = mkTypeDecl "ref"    ["a"] (\td -> TRec [("contents", Mut, TVar "a")])
tRand   = mkTypeDecl "Random.State.t" [] (mkAlgRhs [dRand])

dUnit = DataDecl "()" []
dRand = DataDecl "Random.State.t" []
dNil = DataDecl "[]" []
dCons = DataDecl "::" [ TVar "a", TApp "list" [TVar "a"] ]
dNone = DataDecl "None" []
dSome = DataDecl "Some" [TVar "a"]
dFailure = DataDecl "Failure" []
dNot_found = DataDecl "Not_found" []
dMatch_failure = DataDecl "Match_failure" []
dDivision_by_zero = DataDecl "Division_by_zero" []
dInvalid_argument = DataDecl "Invalid_argument" [tCon "string"]

varD = Var Nothing
iteD = Ite Nothing
mkConAppD = mkConApp Nothing
mkAppsD = mkApps Nothing
fieldD = Field Nothing
setFieldD = SetField Nothing
recordD = Record Nothing
caseD = Case Nothing
bopD = Bop Nothing
appD = App Nothing
seqD = Seq Nothing
litD = Lit Nothing
letD = Let Nothing
listD xs = List Nothing xs Nothing
tupleD = Tuple Nothing

varPatD = VarPat Nothing
conPatD = ConPat Nothing
consPatD = ConsPat Nothing

primVars :: [(Var, Value)]
primVars = [ ("min_float", VD nullProv 0.0) -- FIXME: this is bogus, how do i get the max Double?
           , ("max_float", VD nullProv 0.0) -- FIXME: this is bogus, how do i get the max Double?
           , ("max"
             ,mkLams baseEnv [varPatD "x", varPatD "y"]
                                (iteD (mkAppsD (varD ">=") [varD "x", varD "y"])
                                     (varD "x") (varD "y")))
           , ("min"
             ,mkLams baseEnv [varPatD "x", varPatD "y"]
                                (iteD (mkAppsD (varD "<=") [varD "x", varD "y"])
                                     (varD "x") (varD "y")))
           , ("!", mkLams baseEnv [varPatD "x"] (fieldD (varD "x") "contents"))
           , (":=", mkLams baseEnv [varPatD "x", varPatD "v"]
                                      (setFieldD (varD "x") "contents" (varD "v")))
           , ("ref", mkLams baseEnv [varPatD "x"] (recordD [("contents", varD "x")] Nothing))
           , ("List.fold_left"
             ,(mkLams baseEnv [varPatD "f", varPatD "b", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,varD "b")
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,mkAppsD (varD "List.fold_left")
                                      [varD "f"
                                      ,mkAppsD (varD "f") [varD "b",varD "y"]
                                      ,varD "ys"
                                      ]
                              )
                             ]))
             )
           , ("List.fold_right"
             ,(mkLams baseEnv [varPatD "f", varPatD "xs", varPatD "b"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,varD "b")
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,mkAppsD (varD "f")
                                      [varD "y"
                                      ,mkAppsD (varD "List.fold_right")
                                              [varD "f",varD "ys", varD "b"]
                                      ]
                              )
                             ]))
             )
           , ("List.assoc"
             ,(mkLams baseEnv [varPatD "z", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,appD (varD "raise") [mkConAppD "Not_found" []])
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,iteD (appD (varD "=") [varD "z", appD (varD "fst") [varD "y"]])
                                   (appD (varD "snd") [varD "y"])
                                   (appD (varD "List.assoc") [varD "z", varD "ys"])
                              )
                             ]))
             )
           , ("List.exists"
             ,(mkLams baseEnv [varPatD "f", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,litD (LB False))
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,iteD (appD (varD "f") [varD "y"])
                                   (litD (LB True))
                                   (appD (varD "List.exists") [varD "f", varD "ys"])
                              )
                             ]))
             )
           , ("List.for_all"
             ,(mkLams baseEnv [varPatD "f", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,litD (LB True))
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,iteD (appD (varD "not") [appD (varD "f") [varD "y"]])
                                   (litD (LB False))
                                   (appD (varD "List.for_all") [varD "f", varD "ys"])
                              )
                             ]))
             )
           , ("List.filter"
             ,(mkLams baseEnv [varPatD "f", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,mkConAppD "[]" [])
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,iteD (appD (varD "f") [varD "y"])
                                   (mkConAppD "::" [varD "y", appD (varD "List.filter") [varD "f", varD "ys"]])
                                   (appD (varD "List.filter") [varD "f", varD "ys"])
                              )
                             ]))
             )
           , ("List.map"
             ,(mkLams baseEnv [varPatD "f", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,mkConAppD "[]" [])
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,mkConAppD "::"
                                [ mkAppsD (varD "f") [varD "y"]
                                , mkAppsD (varD "List.map")
                                         [varD "f"
                                         ,varD "ys"
                                         ]
                                ]
                              )
                             ]))
             )
           , ("List.iter"
             ,(mkLams baseEnv [varPatD "f", varPatD "xs"]
                            (caseD (varD "xs")
                             [(conPatD "[]" Nothing
                              ,Nothing
                              ,mkConAppD "[]" [])
                             ,(consPatD (varPatD "y") (varPatD "ys")
                              ,Nothing
                              ,seqD
                                   (mkAppsD (varD "f") [varD "y"])
                                   (mkAppsD (varD "List.iter")
                                           [varD "f"
                                           ,varD "ys"
                                           ])
                              )
                             ]))
             )
           , ("List.partition"
             ,(mkLams baseEnv [varPatD "p", varPatD "xs"]
                (letD Rec
                 [(varPatD "part"
                  ,mkLamsNoEnv [varPatD "yes", varPatD "no", varPatD "l"]
                   (caseD (varD "l")
                    [(conPatD "[]" Nothing
                     ,Nothing
                     ,tupleD [mkAppsD (varD "List.rev") [varD "yes"]
                             ,mkAppsD (varD "List.rev") [varD "no"]]
                     )
                     ,(consPatD (varPatD "x") (varPatD "l'")
                      ,Nothing
                      ,iteD (mkAppsD (varD "p") [varD "x"])
                            (mkAppsD (varD "part")
                                     [mkConAppD "::" [varD "x", varD "yes"]
                                     ,varD "no"
                                     ,varD "l'"])
                            (mkAppsD (varD "part")
                                     [varD "yes"
                                     ,mkConAppD "::" [varD "x", varD "no"]
                                     ,varD "l'"])
                      )]))]
                 (mkAppsD (varD "part") [listD [], listD [], varD "xs"])))
             )
           , ("Sys.argv", VV nullProv [VS nullProv "foo", VS nullProv "bar", VS nullProv "qux"] (Just (tCon tSTRING)))
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
           , ("Array.of_list", mkPrim1Fun $ P1 "Array.of_list" parray_of_list (tL a))
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
           , ("String.make", mkPrim2Fun $ P2 "String.make" pstring_make tI tC)
           , ("String.concat", mkPrim2Fun $ P2 "String.concat" pstring_concat tS (tL tS))
           , ("Random.State.make", mkPrim1Fun $ P1 "Random.State.make" prandom_state_make (tA tI))
           , ("Random.State.int", mkPrim3Fun $ P3 "Random.State.int" prandom_state_int (tCon "Random.State.t") tI tI)
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
           , ("Printf.printf", mkPrim1Fun $ P1 "Printf.printf" pprintf_printf tS)
           , ("Format.printf", mkPrim1Fun $ P1 "Format.printf" pprintf_printf tS)
           , ("Printf.sprintf", mkPrim1Fun $ P1 "Printf.sprintf" pprintf_sprintf tS)
           , ("Format.sprintf", mkPrim1Fun $ P1 "Format.sprintf" pprintf_sprintf tS)
           ]

primVarTypes :: [(Var, Type)]
primVarTypes =
  [ ("=", TAll ["a"] (a :-> a :-> tB))
  , ("<>", TAll ["a"] (a :-> a :-> tB))
  , ("<", TAll ["a"] (a :-> a :-> tB))
  , ("<=", TAll ["a"] (a :-> a :-> tB))
  , (">", TAll ["a"] (a :-> a :-> tB))
  , (">=", TAll ["a"] (a :-> a :-> tB))
  , ("&&", tB :-> tB :-> tB)
  , ("||", tB :-> tB :-> tB)
  , ("and", tB :-> tB :-> tB)
  , ("or", tB :-> tB :-> tB)
  , ("+", tI :-> tI :-> tI)
  , ("-", tI :-> tI :-> tI)
  , ("*", tI :-> tI :-> tI)
  , ("/", tI :-> tI :-> tI)
  , ("mod", tI :-> tI :-> tI)
  , ("+.", tF :-> tF :-> tF)
  , ("-.", tF :-> tF :-> tF)
  , ("*.", tF :-> tF :-> tF)
  , ("/.", tF :-> tF :-> tF)
  , ("mod", tI :-> tI :-> tI)
  , ("min_float", tCon tFLOAT)
  , ("max_float", tCon tFLOAT)
  , ("max", TAll ["a"] (TVar "a" :-> TVar "a" :-> TVar "a"))
  , ("min", TAll ["a"] (TVar "a" :-> TVar "a" :-> TVar "a"))
  , ("!", TAll ["a"] (TApp "ref" [TVar "a"] :-> TVar "a"))
  , (":=", TAll ["a"] (TApp "ref" [TVar "a"] :-> TVar "a" :-> tCon tUNIT))
  , ("ref", TAll ["a"] (TVar "a" :-> TApp "ref" [TVar "a"]))
  , ("List.fold_left", TAll ["a", "b"] ((TVar "b" :-> TVar "a" :-> TVar "b") :-> TVar "b" :-> TApp "list" [TVar "a"] :-> TVar "b"))
  , ("List.fold_right", TAll ["a", "b"] ((TVar "a" :-> TVar "b" :-> TVar "b") :-> TApp "list" [TVar "a"] :-> TVar "b" :-> TVar "b"))
  , ("List.assoc", TAll ["a", "b"] (TVar "a" :-> TApp "list" [TTup [TVar "a", TVar "b"]] :-> TVar "b"))
  , ("List.exists", TAll ["a"] ((TVar "a" :-> tCon tBOOL) :-> TApp "list" [TVar "a"] :-> tCon tBOOL))
  , ("List.for_all", TAll ["a"] ((TVar "a" :-> tCon tBOOL) :-> TApp "list" [TVar "a"] :-> tCon tBOOL))
  , ("List.filter", TAll ["a"] ((TVar "a" :-> tCon tBOOL) :-> TApp "list" [TVar "a"] :-> TApp "list" [TVar "a"]))
  , ("List.map", TAll ["a", "b"] ((TVar "a" :-> TVar "b") :-> TApp "list" [TVar "a"] :-> TApp "list" [TVar "b"]))
  , ("List.iter", TAll ["a"] ((TVar "a" :-> tCon tUNIT) :-> TApp "list" [TVar "a"] :-> tCon tUNIT))
  , ("List.partition", TAll ["a"] ((TVar "a" :-> tCon tBOOL) :-> TApp "list" [TVar "a"] :-> TTup [TApp "list" [TVar "a"], TApp "list" [TVar "a"]]))
  , ("Sys.argv", TApp "array" [tCon tSTRING])
  , ("**", tCon tFLOAT :-> tCon tFLOAT :-> tCon tFLOAT)
  , ("@", TAll ["a"] (TApp "list" [TVar "a"] :-> TApp "list" [TVar "a"] :-> TApp "list" [TVar "a"]))
  , ("^", tCon tSTRING :-> tCon tSTRING :-> tCon tSTRING)
  , ("&&", tCon tBOOL :-> tCon tBOOL :-> tCon tBOOL)
  , ("&", tCon tBOOL :-> tCon tBOOL :-> tCon tBOOL)
  , ("||", tCon tBOOL :-> tCon tBOOL :-> tCon tBOOL)
  , ("not", tCon tBOOL :-> tCon tBOOL)
  , ("fst", TAll ["a", "b"] (TTup [TVar "a", TVar "b"] :-> TVar "a"))
  , ("snd", TAll ["a", "b"] (TTup [TVar "a", TVar "b"] :-> TVar "b"))
  , ("failwith", TAll ["a"] (tCon tSTRING :-> TVar "a"))
  , ("Array.of_list", TAll ["a"] (TApp "list" [TVar "a"] :-> TApp "array" [TVar "a"]))
  , ("Array.get", TAll ["a"] (TApp "array" [TVar "a"] :-> tCon tINT :-> TVar "a"))
  , ("Char.code", tCon tCHAR :-> tCon tINT)
  -- FIXME: support module types
  -- , ("Char.compare", mkPrim2Fun $ P2 "Char.compare" pchar_compare tC tC)
  , ("Char.escaped", tCon tCHAR :-> tCon tSTRING)
  , ("Char.lowercase", tCon tCHAR :-> tCon tCHAR)
  , ("Char.uppercase", tCon tCHAR :-> tCon tCHAR)
  , ("List.append", TAll ["a"] (TApp "list" [TVar "a"] :-> TApp "list" [TVar "a"] :-> TApp "list" [TVar "a"]))
  , ("List.combine", TAll ["a", "b"] (TApp "list" [TVar "a"] :-> TApp "list" [TVar "b"] :-> TApp "list" [TTup [TVar "a", TVar "b"]]))
  , ("List.hd", TAll ["a"] (TApp "list" [TVar "a"] :-> TVar "a"))
  , ("List.length", TAll ["a"] (TApp "list" [TVar "a"] :-> tCon tINT))
  , ("List.mem", TAll ["a"] (TVar "a" :-> TApp "list" [TVar "a"] :-> tCon tBOOL))
  , ("List.nth", TAll ["a"] (tL a :-> tI :-> a))
  , ("List.rev", TAll ["a"] (tL a :-> tL a))
  , ("List.split", TAll ["a", "b"] (tL (tT a b) :-> tT (tL a) (tL b)))
  , ("List.tl", TAll ["a"] (tL a :-> tL a))
  , ("String.create", tI :-> tS)
  , ("String.get", tS :-> tI :-> tC)
  , ("String.length", tS :-> tI)
  , ("String.make", tI :-> tC :-> tS)
  , ("String.concat", tS :-> tL tS :-> tS)
  , ("print_char", tC :-> tU)
  , ("print_int", tI :-> tU)
  , ("print_float", tF :-> tU)
  , ("print_string", tS :-> tU)
  , ("print_endline", tS :-> tU)
  , ("print_newline", tU :-> tU)
  , ("char_of_int", tI :-> tC)
  , ("int_of_char", tC :-> tI)
  , ("int_of_float", tF :-> tI)
  , ("int_of_string", tS :-> tI)
  , ("float", tI :-> tF)
  , ("float_of_int", tI :-> tF)
  , ("float_of_string", tS :-> tF)
  , ("string_of_bool", tB :-> tS)
  , ("string_of_int", tI :-> tS)
  , ("string_of_float", tF :-> tS)
  , ("abs", tI :-> tI)
  , ("abs_float", tF :-> tF)
  , ("exp", tF :-> tF :-> tF)
  , ("log", tF :-> tF)
  , ("log10", tF :-> tF)
  , ("mod_float", tF :-> tF :-> tF)
  , ("modf", tF :-> tF)
  , ("sqrt", tF :-> tF)
  , ("acos", tF :-> tF)
  , ("asin", tF :-> tF)
  , ("atan", tF :-> tF)
  , ("cos", tF :-> tF)
  , ("sin", tF :-> tF)
  , ("tan", tF :-> tF)
  , ("tanh", tF :-> tF)
  , ("truncate", tF :-> tI)
  , ("compare", TAll ["a"] (a :-> a :-> tI))
  , ("raise", TAll ["a"] (tE :-> a))
  , ("Printexc.to_string", tE :-> tS)
  ]

pfailwith :: MonadEval m => Value -> m Value
pfailwith (VS _ s) = withCurrentProvM $ \prv -> maybeThrow $ MLException (mkExn "Failure" [VS prv s] prv)

pcompare :: MonadEval m => Value -> Value -> m Value
pcompare = cmpVal

pfst :: MonadEval m => Value -> m Value
pfst (VT _ [x,_]) = return x

psnd :: MonadEval m => Value -> m Value
psnd (VT _ [_,y]) = return y

pand :: MonadEval m => Value -> Value -> m Value
pand (VB _ x) (VB _ y) = withCurrentProv $ \prv -> (VB prv (x && y))

por :: MonadEval m => Value -> Value -> m Value
por (VB _ x) (VB _ y) = withCurrentProv $ \prv -> (VB prv (x || y))

pnot :: MonadEval m => Value -> m Value
pnot (VB _ x) = withCurrentProv $ \prv -> (VB prv (not x))

pabs :: MonadEval m => Value -> m Value
pabs (VI _ i) = withCurrentProv $ \prv -> (VI prv (abs i))

pabs_float :: MonadEval m => Value -> m Value
pabs_float (VD _ i) = withCurrentProv $ \prv -> (VD prv (abs i))

pmod_float :: MonadEval m => Value -> Value -> m Value
pmod_float (VD _ i) (VD _ j) = withCurrentProv $ \prv -> (VD prv (i - (fromInteger $ floor (i / j)) * j))

pexp :: MonadEval m => Value -> Value -> m Value
pexp (VD _ i) (VD _ j) = withCurrentProv $ \prv -> (VD prv (i ** j))

plog :: MonadEval m => Value -> m Value
plog (VD _ x) = withCurrentProv $ \prv -> (VD prv (log x))

plog10 :: MonadEval m => Value -> m Value
plog10 (VD _ x) = withCurrentProv $ \prv -> (VD prv (logBase 10 x))

pmodf :: MonadEval m => Value -> m Value
pmodf (VD _ x) = let (n,d) = properFraction x
                 in withCurrentProv $ \prv -> (VT prv [VD prv d, VD prv (fromInteger n)])

psqrt :: MonadEval m => Value -> m Value
psqrt (VD _ i) = withCurrentProv $ \prv -> (VD prv (sqrt i))

pacos :: MonadEval m => Value -> m Value
pacos (VD _ i) = withCurrentProv $ \prv -> (VD prv (acos i))

pasin :: MonadEval m => Value -> m Value
pasin (VD _ i) = withCurrentProv $ \prv -> (VD prv (asin i))

patan :: MonadEval m => Value -> m Value
patan (VD _ i) = withCurrentProv $ \prv -> (VD prv (atan i))

pcos :: MonadEval m => Value -> m Value
pcos (VD _ i) = withCurrentProv $ \prv -> (VD prv (cos i))

psin :: MonadEval m => Value -> m Value
psin (VD _ i) = withCurrentProv $ \prv -> (VD prv (sin i))

ptan :: MonadEval m => Value -> m Value
ptan (VD _ i) = withCurrentProv $ \prv -> (VD prv (tan i))

ptanh :: MonadEval m => Value -> m Value
ptanh (VD _ i) = withCurrentProv $ \prv -> (VD prv (tanh i))

ptruncate :: MonadEval m => Value -> m Value
ptruncate (VD _ i) = withCurrentProv $ \prv -> (VI prv (truncate i))

pchar_of_int :: MonadEval m => Value -> m Value
pchar_of_int (VI _ i) = withCurrentProv $ \prv -> (VC prv (chr i))

pint_of_char :: MonadEval m => Value -> m Value
pint_of_char (VC _ c) = withCurrentProv $ \prv -> (VI prv (ord c))

pint_of_string :: MonadEval m => Value -> m Value
pint_of_string (VS _ s) = withCurrentProvM $ \prv -> case readMaybe s of
  Just i  -> return (VI prv i)
  Nothing -> maybeThrow $ MLException (mkExn "Failure" [VS prv "int_of_string"] prv)

pint_of_float :: MonadEval m => Value -> m Value
pint_of_float (VD _ d) = withCurrentProv $ \prv -> (VI prv (truncate d))

pfloat_of_int :: MonadEval m => Value -> m Value
pfloat_of_int (VI _ i) = withCurrentProv $ \prv -> (VD prv (fromIntegral i))

pfloat :: MonadEval m => Value -> m Value
pfloat = pfloat_of_int

pfloat_of_string :: MonadEval m => Value -> m Value
pfloat_of_string (VS _ s) = withCurrentProvM $ \prv -> case readMaybe s of
  Just d  -> return (VD prv d)
  Nothing -> maybeThrow $ MLException (mkExn "Failure" [VS prv "float_of_string"] prv)

pstring_of_int :: MonadEval m => Value -> m Value
pstring_of_int (VI _ i) = withCurrentProv $ \prv -> (VS prv (show i))

pstring_of_float :: MonadEval m => Value -> m Value
pstring_of_float (VD _ i) = withCurrentProv $ \prv -> (VS prv (show i))

pstring_of_bool :: MonadEval m => Value -> m Value
pstring_of_bool (VB _ b) = withCurrentProv $ \prv -> (VS prv (if b then "true" else "false"))

pstring_concat :: MonadEval m => Value -> Value -> m Value
pstring_concat (VS _ s) (VL _ xs _) = withCurrentProv $ \prv -> (VS prv (intercalate s [x | VS _ x <- xs ]))

prandom_state_make :: MonadEval m => Value -> m Value
prandom_state_make _ = withCurrentProv $ \prv -> (VA prv "Random.State.t" Nothing (Just (tCon "Random.State.t")))

prandom_state_int :: MonadEval m => Value -> Value -> Value -> m Value
prandom_state_int _ (VI _ l) (VI _ u) = withCurrentProvM $ \prv -> do
  x <- getRandomR (l,u)
  return (VI prv x)

pstring_get :: MonadEval m => Value -> Value -> m Value
pstring_get (VS _ s) (VI _ i)
  | i >= 0 && i < length s
  = withCurrentProv $ \prv -> (VC prv (s !! i))
  | otherwise
  = withCurrentProvM $ \prv -> maybeThrow $ MLException $ mkExn "Invalid_argument" [VS prv "index out of bounds"] prv

pstring_length :: MonadEval m => Value -> m Value
pstring_length (VS _ s) = withCurrentProv $ \prv -> (VI prv (length s))

pstring_create :: MonadEval m => Value -> m Value
pstring_create (VI _ n) = withCurrentProv $ \prv -> (VS prv (replicate n '\NUL'))

pstring_make :: MonadEval m => Value -> Value -> m Value
pstring_make (VI _ n) (VC _ c) = withCurrentProv $ \prv -> (VS prv (replicate n c))

parray_get :: MonadEval m => Value -> Value -> m Value
parray_get (VV _ a _) (VI _ i)
  | i >= 0 && i < length a
  = return (a !! i)
  | otherwise
  = withCurrentProvM $ \prv -> maybeThrow $ MLException $ mkExn "Invalid_argument" [VS prv "index out of bounds"] prv

parray_of_list :: MonadEval m => Value -> m Value
parray_of_list (VL _ xs mt) = withCurrentProv $ \prv -> VV prv xs mt

pprint_string :: MonadEval m => Value -> m Value
pprint_string (VS _ s) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr s
  withCurrentProv VU

pprint_endline :: MonadEval m => Value -> m Value
pprint_endline (VS _ s) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStrLn s
  withCurrentProv VU

pprint_newline :: MonadEval m => Value -> m Value
pprint_newline (VU _) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStrLn ""
  withCurrentProv VU

pprint_int :: MonadEval m => Value -> m Value
pprint_int (VI _ i) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr $ show i
  withCurrentProv VU

pprint_float :: MonadEval m => Value -> m Value
pprint_float (VD _ f) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr $ show f
  withCurrentProv VU

pprint_char :: MonadEval m => Value -> m Value
pprint_char (VC _ c) = do
  -- opts <- ask
  -- when (enablePrint opts) $
  --   liftIO $ putStr $ [c]
  withCurrentProv VU

pchar_code :: MonadEval m => Value -> m Value
pchar_code (VC _ c) = withCurrentProv $ \prv -> (VI prv (ord c))

pchar_compare :: MonadEval m => Value -> Value -> m Value
pchar_compare c1@(VC {}) c2@(VC {}) = cmpVal c1 c2

pchar_escaped :: MonadEval m => Value -> m Value
pchar_escaped (VC _ c) = withCurrentProv $ \prv -> (VS prv (showLitChar c ""))

pchar_lowercase :: MonadEval m => Value -> m Value
pchar_lowercase (VC _ c) = withCurrentProv $ \prv -> (VC prv (toLower c))

pchar_uppercase :: MonadEval m => Value -> m Value
pchar_uppercase (VC _ c) = withCurrentProv $ \prv -> (VC prv (toUpper c))

plist_combine :: MonadEval m => Value -> Value -> m Value
plist_combine (VL _ xs (Just tx)) (VL _ ys (Just ty))
  | length xs == length ys
  = withCurrentProv $ \prv -> (VL prv (zipWith (\x y -> VT prv [x,y]) xs ys) (Just (TTup [tx, ty])))
  | otherwise
  = withCurrentProvM $ \prv -> maybeThrow (MLException (mkExn "Invalid_argument" [VS prv "List.combine"] prv))

plist_nth :: MonadEval m => Value -> Value -> m Value
plist_nth (VL _ xs _) (VI _ n)
  | n >= 0 && n < length xs
  = return (xs !! n)
  | otherwise
  = withCurrentProvM $ \prv -> maybeThrow (MLException (mkExn "Invalid_argument" [VS prv "List.nth"] prv))

plist_split :: MonadEval m => Value -> m Value
plist_split (VL _ xs mt)
  = withCurrentProv $ \prv -> (VT prv [VL prv as mt, VL prv bs mt])
  where
  -- FIXME: these list functions really shouldn't be primitives,
  -- introduces nasty laziness issues..
  (as, bs) = unzip . map (\(VT _ [a,b]) -> (a,b)) $ xs

plist_mem :: MonadEval m => Value -> Value -> m Value
plist_mem x (VL _ xs _) = withCurrentProvM $ \prv -> VB prv <$> anyM (`eqVal` x) xs

plist_length :: MonadEval m => Value -> m Value
plist_length (VL _ s _) = withCurrentProv $ \prv -> VI prv (length s)

plist_rev :: MonadEval m => Value -> m Value
plist_rev (VL _ xs mt) = withCurrentProv $ \prv -> VL prv (reverse xs) mt

plist_hd :: MonadEval m => Value -> m Value
plist_hd (VL _ xs _) = case xs of
  x : _ -> return x
  _ -> withCurrentProvM $ \prv -> maybeThrow (MLException (mkExn "Invalid_argument" [VS prv "List.hd"] prv))

plist_tl :: MonadEval m => Value -> m Value
plist_tl (VL _ xs mt) = case xs of
  _ : xs -> withCurrentProv $ \prv -> VL prv xs mt
  _ -> withCurrentProvM $ \prv -> maybeThrow (MLException (mkExn "Invalid_argument" [VS prv "List.hd"] prv))

pappend :: MonadEval m => Value -> Value -> m Value
pappend (VL _ xs (Just tx)) (VL _ ys (Just ty)) = do
  unify tx ty
  t <- substM tx
  prv <- getCurrentProv
  return (VL prv (xs ++ ys) (Just t))

pconcat :: MonadEval m => Value -> Value -> m Value
pconcat (VS _ xs) (VS _ ys) = withCurrentProv $ \prv -> VS prv (xs ++ ys)

praise :: MonadEval m => Value -> m Value
praise x@(VA {}) = maybeThrow (MLException x)

pprintexc_to_string :: MonadEval m => Value -> m Value
pprintexc_to_string x@(VA {}) = withCurrentProv $ \prv -> VS prv $ show x

pprintf_printf :: MonadEval m => Value -> m Value
pprintf_printf (VS _ fmt) = do
  ts <- fmt_types fmt
  if null ts
    then withCurrentProv $ \prv -> VU prv
    else do let do_print _vs = withCurrentProv $ \prv -> VU prv
            return (mkPrimNFun $ PN ("printf " ++ show fmt) do_print ts)

pprintf_sprintf :: MonadEval m => Value -> m Value
pprintf_sprintf (VS _ fmt) = do
  ts <- fmt_types fmt
  if null ts
    then withCurrentProv $ \prv -> VS prv fmt
    else do let do_print _vs = withCurrentProv $ \prv -> VS prv "i printed something"
            return (mkPrimNFun $ PN ("sprintf " ++ show fmt) do_print ts)

fmt_types :: MonadEval m => String -> m [Type]
fmt_types cs' = case cs' of
  "" -> return []
  "%" -> otherError "format string ended early!"
  '%':'%':cs -> fmt_types cs
  '%':c:cs -> (:) <$> fmt_type c <*> fmt_types cs
  _:cs -> fmt_types cs

fmt_type :: MonadEval m => Char -> m Type
fmt_type c = case c of
  'd' -> return tI
  'i' -> return tI
  'f' -> return tF
  'e' -> return tF
  's' -> return tS
  _   -> otherError $ "unknown format char '" ++ c : "'"

getField :: MonadEval m => Value -> String -> m Value
getField x@(VR _ fs _) f = case lookup f fs of
  Just (Ref i)  -> snd <$> readStore i
  Nothing -> otherError $ printf "record %s does not have a field '%s'"
                                (show x) f
getField x f = otherError $ printf "%s is not a record" (show x)

setField :: MonadEval m => Value -> String -> Value -> m ()
setField x@(VR _ fs _) f v = case lookup f fs of
  Nothing    -> otherError $ printf "record %s does not have a field '%s'"
                                   (show x) f
  Just (Ref i) -> do
    (m, _) <- readStore i
    case m of
      Mut -> writeStore i (m,v)
      _   -> otherError $ printf "field '%s' is not mutable" f
setField x _ _ = otherError $ printf "%s is not a record" (show x)

-- mkNonRec :: Expr -> Value
-- mkNonRec lam = func
--   where
--   func = Replace Nothing env lam
--   env  = baseEnv

-- mkRec :: Var -> Expr -> Value
-- mkRec f lam = func
--   where
--   func = Replace Nothing env lam
--   env  = {- insertEnv f func -} baseEnv

baseEnv :: Env
baseEnv = Env 0 "global" Nothing
        $  map (second mkBopFun) primBops
        ++ primVars

mkBopFun :: Bop -> Value
mkBopFun bop = mkLams emptyEnv [varPatD "x", varPatD "y"]
                            (bopD bop (varD "x") (varD "y"))

mkPrim1Fun :: Prim1 -> Value
mkPrim1Fun f = Prim1 Nothing f

mkPrim2Fun :: Prim2 -> Value
mkPrim2Fun f = Prim2 Nothing f

mkPrim3Fun :: Prim3 -> Value
mkPrim3Fun f = Prim3 Nothing f

mkPrimNFun :: PrimN -> Value
mkPrimNFun f = PrimN Nothing f

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
  unless (r && not b) $ throwError err
  r <- fresh
  return (Hole Nothing r Nothing)
