module NanoML.Misc where

import Control.Arrow
import Control.Monad
import Data.Either
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import System.Directory
import System.FilePath

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
  -- TODO: add support for user-defined ADTs
  -- , ("exprToString", "expr -> string")
  -- , ("eval", "expr * float * float -> float")
  -- , ("build", "((int * int -> int) * int) -> expr")
  -- , ("doRandomGray", "int * int * int -> unit")
  -- , ("doRandomColor", "int * int * int -> unit")
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

facProg :: String
facProg = unlines [ "let rec fac n ="
                  , "  if n = 0 then"
                  , "    1"
                  , "  else"
                  , "    n * fac (n - 1)"
                  , ";;"
                  ]

badProg :: String
badProg = unlines [ "let f lst ="
                  , "  let rec loop lst acc ="
                  , "    if lst = [] then"
                  , "      acc"
                  , "    else"
                  , "      ()"
                  , "  in"
                  , "  match loop lst [(0.0,0.0)] with"
                  , "    | h :: t -> h"
                  , ";;"
                  ]

ignoredMLs :: [String]
ignoredMLs = [ "prog0012.ml" -- accidental use of ! (deref)
             , "prog0510.ml" -- uses Array.of_list
             , "prog0511.ml" -- uses Array.of_list
             , "prog0512.ml" -- uses Array.of_list
             , "prog0513.ml" -- uses Array.of_list
             , "prog0514.ml" -- uses Array.of_list
             , "prog0515.ml" -- uses Array.of_list
             , "prog0516.ml" -- uses Array.of_list
             , "prog0517.ml" -- uses Array.of_list
             , "prog0518.ml" -- uses Array.of_list
             , "prog0582.ml" -- uses ?
             , "prog0583.ml" -- uses ?
             , "prog0584.ml" -- uses ?
             , "prog1123.ml" -- uses try
             , "prog1126.ml" -- blackhole
             , "prog1127.ml" -- blackhole
             , "prog1131.ml" -- uses incr (ref)
             , "prog1261.ml" -- uses n..m range operator
             , "prog1270.ml" -- uses printf
             , "prog1802.ml" -- uses print_int
             , "prog1806.ml" -- uses Printf.kprintf
             , "prog1807.ml" -- uses Printf.printf
             , "prog1808.ml" -- uses Printf.printf
             , "prog1809.ml" -- uses Printf.printf
             , "prog1810.ml" -- uses Printf.printf
             , "prog1811.ml" -- uses Printf.printf
             , "prog1812.ml" -- uses Printf.printf
             , "prog1813.ml" -- uses Printf.printf
             , "prog1814.ml" -- uses Printf.printf
             , "prog1815.ml" -- uses Printf.printf
             , "prog1816.ml" -- uses Printf.printf
             , "prog1817.ml" -- uses Printf.printf
             , "prog1818.ml" -- uses Printf.printf
             , "prog1819.ml" -- uses Printf.printf
             , "prog1820.ml" -- uses Printf.printf
             , "prog1821.ml" -- uses Printf.printf
             , "prog1823.ml" -- uses Printf.printf
             , "prog1824.ml" -- uses Printf.printf
             , "prog1825.ml" -- uses Printf.printf
             , "prog2256.ml" -- uses List.iter (side-effects)
             , "prog2261.ml" -- uses incr (ref)
             , "prog2279.ml" -- uses List.iter (side-effects)
             , "prog2298.ml" -- uses % ??
             , "prog2310.ml" -- uses incr (ref)
             , "prog2329.ml" -- uses print_string
             , "prog2336.ml" -- uses print_string
             , "prog2337.ml" -- uses print_string
             , "prog2916.ml" -- uses list.rev (record selector)
             , "prog2918.ml" -- uses list.rev (record selector)
             , "prog3003.ml" -- uses sepList.map (record selector)
             , "prog3158.ml" -- accidental type annot (let sumList (1 : int list))
             , "prog3160.ml" -- accidental type annot (let sumList (l : int list))
             , "prog3164.ml" -- array index xs.(0)
             , "prog3165.ml" -- array index xs.(0)
             , "prog3223.ml" -- deref (!)
             , "prog3644.ml" -- deref (!)
             , "prog3645.ml" -- deref (!)
             , "prog3646.ml" -- deref (!)
             , "prog3647.ml" -- deref (!)
             , "prog3648.ml" -- deref (!)
             , "prog3649.ml" -- deref (!)
             , "prog3695.ml" -- record selector
             , "prog3747.ml" -- uses ^^ (something to do with printf it seems)
             , "prog3816.ml" -- optional param (~l)
             , "prog4000.ml" -- postfix !
             , "prog4105.ml" -- "or" pattern (1|2)
             , "prog4169.ml" -- deref (!)
             , "prog4170.ml" -- deref (!)
             , "prog4171.ml" -- deref (!)
             , "prog4480.ml" -- uses ?
             , "prog4481.ml" -- uses ?
             , "prog4484.ml" -- uses ?
             , "prog4485.ml" -- uses ?
             , "prog4486.ml" -- uses ?
             , "prog4501.ml" -- uses ?
             , "prog4557.ml" -- uses ?
             , "prog4720.ml" -- uses ?
             , "prog4722.ml" -- uses ?
             ]

testParser :: IO [(FilePath, Prog)]
testParser = do
  let dir = "../yunounderstand/data/sp14/prog/unify"
  mls <- filter (`notElem` ignoredMLs) . filter (".ml" `isSuffixOf`)
          <$> getDirectoryContents dir
  forM mls $ \ml -> do
    r <- parseTopForm <$> readFile (dir </> ml)
    case r of
      Right p -> return (ml, p)
      Left _ -> print ml >> print r >> error "die"

parseFile :: FilePath -> IO Prog
parseFile f = do
  r <- parseTopForm <$> readFile f
  case r of
   Right p -> return p
   Left e  -> error (show e)
