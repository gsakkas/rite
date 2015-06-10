module NanoML.Misc where

import Control.Arrow
import Data.Either
import Data.Map (Map)
import qualified Data.Map as Map

import NanoML.Parser
import NanoML.Types

fromRight :: Either a b -> b
fromRight (Right b) = b

knownFuncs :: Map Var Type
knownFuncs = Map.fromList . map (second (fromRight . parseType)) $
  [ ("sumList", "int list -> int")
  , ("digitsOfInt", "int -> int list")
  , ("additivePersistence", "int -> int")
  , ("digitalRoot", "int -> int")
  , ("listReverse", "'a list -> 'a list")
  , ("palindrome", "string -> bool")
  , ("assoc", "'a * 'b * ('b * 'a) list -> 'a")
  , ("removeDuplicates", "'a list -> 'a list")
  , ("wwhile", "('a -> 'a * bool) * 'a -> 'a")
  , ("fixpoint", "('a -> 'a) * 'a -> 'a")
  , ("exprToString", "expr -> string")
  , ("eval", "expr * float * float -> float")
  , ("build", "((int * int -> int) * int) -> expr")
  , ("doRandomGray", "int * int * int -> unit")
  , ("doRandomColor", "int * int * int -> unit")
  , ("sqsum", "int list -> int")
  , ("pipe", "('a -> 'a) list -> ('a -> 'a)")
  , ("sepConcat", "string -> string list -> string")
  , ("stringOfList", "('a -> string) -> 'a list -> string")
  , ("clone", "'a -> int -> 'a list")
  , ("padZero", "int list -> int list -> int list  * int list")
  , ("removeZero", "int list -> int list")
  , ("bigAdd", "int list -> int list -> int list")
  , ("mulByDigit", "int -> int list -> int list")
  , ("bigMul", "int list -> int list -> int list")
  ]
