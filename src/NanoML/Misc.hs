module NanoML.Misc where

import           Control.Arrow
import           Control.DeepSeq
import           Control.Monad
import           Data.Either
import           Data.List
import           Data.Map         (Map)
import qualified Data.Map         as Map
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import           System.Directory
import           System.FilePath
import           System.IO.Unsafe

import           NanoML.Parser
import           NanoML.Types

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

    -- SEMINAL benchmarks
    -- NOTE: i'm guessing the types here based on the definitions and context
  , ("titlecase", "string -> string")
  , ("reverse", "string -> string")
--  , ("reverseHelp", "string -> string")
  , ("prnt", "'a lst -> unit")
  , ("append", "'a lst -> 'a lst -> 'a lst")
  , ("map", "(char -> char) -> string -> string") -- NOTE: non-standard type
--  , ("mapHelp", "string -> string")
  , ("upperMatch", "char -> char")
  , ("client2", "'a t2 -> int")
  , ("lookup", "heap -> string -> int")
  , ("update", "heap -> string -> int -> heap")
  , ("interp_e", "heap -> exp -> int")
  , ("makePoly", "int -> float -> move")
  , ("interp_s", "heap -> stmt -> heap")
  , ("interpLarge", "move list -> (float*float) list")
  , ("interpSmall", "move list -> (float*float) list")
  , ("foo", "move list -> int")
  , ("interpTrans", "move list -> float->float->float-> (float * float) list * float")
  , ("print_heap", "heap -> unit")
  , ("print_elt", "heap_elt -> unit")
  , ("lookup_raw", "heap -> string -> heapElement")
  , ("lookup_var", "heap -> string -> int")
  , ("test", "stmt -> unit")
  , ("interp_prog", "stmt -> int")
  , ("interp", "(env -> (string list) option -> env) -> env -> exp -> exp")
  , ("computeFreeVars", "exp -> (exp * string list)")
  , ("print_prog", "exp -> string")
  , ("print_array", "string list -> unit")
  , ("printExp", "exp -> unit")
  , ("printEnv", "env -> unit")
  , ("subtype", "typ -> typ -> bool")
  , ("typecheck", "env -> exp -> typ")
  , ("type_to_string", "typ -> string")
  ]

facProg :: String
facProg = unlines [ "let rec fac n ="
                  , "  if n = 0 then"
                  , "    true"
                  , "  else"
                  , "    n * fac (n - 1);;"
                  , ""
                  , "fac 1;;"
                  ]
facTarget = SrcSpan { srcSpanStartLine = 3
                    , srcSpanStartCol = 5
                    , srcSpanEndLine = 3
                    , srcSpanEndCol = 9
                    }

wwhileProg :: String
wwhileProg = unlines [ "let (x,y) = (\"5\", 5);;"
                     , "let rec wwhile (f,b) ="
                     , "  let f b = (x, y) in "
                     , "  if y = true "
                     , "  then wwhile (f, x)"
                     , "  else x;;"
                     , "wwhile ((fun x -> x), 1);;"
                     ]
wwhileTarget = SrcSpan { srcSpanStartLine = 3
                       , srcSpanStartCol = 14
                       , srcSpanEndLine = 3
                       , srcSpanEndCol = 18
                       }

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
                  , "f [1];;"
                  ]
badTarget =  SrcSpan { srcSpanStartLine = 6
                     , srcSpanStartCol = 7
                     , srcSpanEndLine = 6
                     , srcSpanEndCol = 9
                     }

ignoredMLs :: [String]
ignoredMLs = [ "prog0012.ml" -- accidental use of ! (deref)
             , "prog0503.ml" -- uses Array.of_list
             , "prog0504.ml" -- uses Array.of_list
             , "prog0505.ml" -- uses Array.of_list
             , "prog0506.ml" -- uses Array.of_list
             , "prog0507.ml" -- uses Array.of_list
             , "prog0508.ml" -- uses Array.of_list
             , "prog0509.ml" -- uses Array.of_list
             , "prog0510.ml" -- uses Array.of_list
             , "prog0511.ml" -- uses Array.of_list
             , "prog0512.ml" -- uses Array.of_list
             , "prog0513.ml" -- uses Array.of_list
             , "prog0514.ml" -- uses Array.of_list
             , "prog0515.ml" -- uses Array.of_list
             , "prog0516.ml" -- uses Array.of_list
             , "prog0517.ml" -- uses Array.of_list
             , "prog0518.ml" -- uses Array.of_list
             , "prog0519.ml" -- uses Array.of_list
             , "prog0520.ml" -- uses Array.of_list
             , "prog0521.ml" -- uses Array.of_list
             , "prog0522.ml" -- uses Array.of_list
             , "prog0523.ml" -- uses ref
             , "prog0582.ml" -- uses ?
             , "prog0583.ml" -- uses ?
             , "prog0584.ml" -- uses ?
             , "prog1123.ml" -- uses try
             , "prog1126.ml" -- blackhole
             , "prog1127.ml" -- blackhole
             , "prog1131.ml" -- uses incr (ref)
             , "prog1261.ml" -- uses n..m range operator
             , "prog1265.ml" -- Array.of_list
             , "prog1267.ml" -- Array.of_list
             , "prog1268.ml" -- Array.of_list
             , "prog1269.ml" -- Array.of_list
             , "prog2256.ml" -- uses List.iter (side-effects)
             , "prog2261.ml" -- uses incr (ref)
             , "prog2279.ml" -- uses List.iter (side-effects)
             , "prog2298.ml" -- uses % ??
             , "prog2310.ml" -- uses incr (ref)
             , "prog2472.ml" -- uses for
             , "prog2559.ml" -- Array.of_list
             , "prog2916.ml" -- uses list.rev (record selector)
             , "prog2918.ml" -- uses list.rev (record selector)
             , "prog2924.ml" -- uses for
             , "prog2925.ml" -- uses for
             , "prog2926.ml" -- uses for
             , "prog2927.ml" -- uses for
             , "prog2928.ml" -- uses for
             , "prog2929.ml" -- uses for
             , "prog2930.ml" -- uses for
             , "prog2931.ml" -- uses for
             , "prog2932.ml" -- uses for
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
             , "prog3985.ml" -- uses ref
             , "prog3986.ml" -- uses ref
             , "prog3987.ml" -- uses ref
             , "prog3988.ml" -- uses ref
             , "prog3989.ml" -- uses ref
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
             , "prog4022.ml" -- uses Array.of_list
             , "prog4073.ml" -- uses Array.of_list
             , "prog4074.ml" -- uses Array.of_list
             , "prog4163.ml" -- uses Array.of_list
             , "prog4164.ml" -- uses Array.of_list
             , "prog4165.ml" -- uses Array.of_list
             , "prog4166.ml" -- uses Array.of_list
             , "prog4232.ml" -- uses Array.of_list
             , "prog4233.ml" -- uses Array.of_list
             , "prog4234.ml" -- uses Array.of_list
             , "prog4250.ml" -- uses Array.of_list
             , "prog4258.ml" -- uses Array.of_list
             , "prog4259.ml" -- uses Array.of_list
             , "prog4260.ml" -- uses Array.of_list
             , "prog4261.ml" -- uses Array.of_list
             , "prog4279.ml" -- uses Array.of_list
             , "prog4305.ml" -- uses Array.of_list
             , "prog4316.ml" -- uses Array.of_list
             , "prog4317.ml" -- uses Array.of_list
             , "prog4320.ml" -- uses Array.of_list
             , "prog4321.ml" -- uses Array.of_list
             , "prog4328.ml" -- uses Array.of_list
             , "prog4355.ml" -- uses Array.of_list
             , "prog4357.ml" -- uses Array.of_list
             , "prog4382.ml" -- uses Array.of_list
             , "prog4421.ml" -- uses Array.of_list
             , "prog4422.ml" -- uses Array.of_list
             , "prog4423.ml" -- uses Array.of_list
             , "prog4424.ml" -- uses Array.of_list
             , "prog4425.ml" -- uses Array.of_list
             , "prog4502.ml" -- uses Array.of_list
             , "prog4503.ml" -- uses Array.of_list
             , "prog4504.ml" -- uses Array.of_list
             , "prog4508.ml" -- uses Array.of_list
             , "prog4509.ml" -- uses Array.of_list
             , "prog4615.ml" -- uses Array.of_list
             , "prog4654.ml" -- uses Array.of_list
             , "prog4655.ml" -- uses Array.of_list
             , "prog0071.ml" -- uses printf
             , "prog0072.ml" -- uses printf
             , "prog0073.ml" -- uses printf
             , "prog0074.ml" -- uses printf
             , "prog0507.ml" -- uses printf
             , "prog0591.ml" -- uses printf
             , "prog0622.ml" -- uses printf
             , "prog1133.ml" -- uses printf
             , "prog1270.ml" -- uses printf
             , "prog1806.ml" -- uses printf
             , "prog1807.ml" -- uses printf
             , "prog1808.ml" -- uses printf
             , "prog1809.ml" -- uses printf
             , "prog1810.ml" -- uses printf
             , "prog1811.ml" -- uses printf
             , "prog1812.ml" -- uses printf
             , "prog1813.ml" -- uses printf
             , "prog1814.ml" -- uses printf
             , "prog1815.ml" -- uses printf
             , "prog1816.ml" -- uses printf
             , "prog1817.ml" -- uses printf
             , "prog1818.ml" -- uses printf
             , "prog1819.ml" -- uses printf
             , "prog1820.ml" -- uses printf
             , "prog1821.ml" -- uses printf
             , "prog1823.ml" -- uses printf
             , "prog1824.ml" -- uses printf
             , "prog1825.ml" -- uses printf
             , "prog2256.ml" -- uses printf
             , "prog2279.ml" -- uses printf
             , "prog2559.ml" -- uses printf
             , "prog2595.ml" -- uses printf
             , "prog3810.ml" -- uses printf
             , "prog3811.ml" -- uses printf
             , "prog4000.ml" -- uses printf
             , "prog4128.ml" -- uses printf
             , "prog4149.ml" -- uses printf
             , "prog4150.ml" -- uses printf
             , "prog4156.ml" -- uses printf
             , "prog4160.ml" -- uses printf
             , "prog4163.ml" -- uses printf
             , "prog4163.ml" -- uses printf
             , "prog4164.ml" -- uses printf
             , "prog4164.ml" -- uses printf
             , "prog4165.ml" -- uses printf
             , "prog4165.ml" -- uses printf
             , "prog4166.ml" -- uses printf
             , "prog4166.ml" -- uses printf
             , "prog4167.ml" -- uses printf
             , "prog4169.ml" -- uses printf
             , "prog4170.ml" -- uses printf
             , "prog4171.ml" -- uses printf
             , "prog4172.ml" -- uses printf
             , "prog4232.ml" -- uses printf
             , "prog4232.ml" -- uses printf
             , "prog4233.ml" -- uses printf
             , "prog4233.ml" -- uses printf
             , "prog4234.ml" -- uses printf
             , "prog4234.ml" -- uses printf
             , "prog4290.ml" -- uses printf
             , "prog4357.ml" -- uses printf
             , "prog4362.ml" -- uses printf
             , "prog4363.ml" -- uses printf
             , "prog4378.ml" -- uses printf
             , "prog4379.ml" -- uses printf
             , "prog4414.ml" -- uses printf
             , "prog4421.ml" -- uses printf
             , "prog4422.ml" -- uses printf
             , "prog4423.ml" -- uses printf
             , "prog4424.ml" -- uses printf
             , "prog4425.ml" -- uses printf
             , "prog4502.ml" -- uses printf
             , "prog4503.ml" -- uses printf
             , "prog4504.ml" -- uses printf
             , "prog4508.ml" -- uses printf
             , "prog4509.ml" -- uses printf
             , "prog4536.ml" -- uses printf
             , "prog4537.ml" -- uses printf
             , "prog4538.ml" -- uses printf
             , "prog4539.ml" -- uses printf
             , "prog4540.ml" -- uses printf
             , "prog4541.ml" -- uses printf
             , "prog4542.ml" -- uses printf
             , "prog4543.ml" -- uses printf
             , "prog4544.ml" -- uses printf
             , "prog4545.ml" -- uses printf
             , "prog4546.ml" -- uses printf
             , "prog4654.ml" -- uses printf
             , "prog4655.ml" -- uses printf
             , "prog4662.ml" -- uses printf
             , "prog4669.ml" -- uses printf
             , "prog4670.ml" -- uses printf
             , "prog4673.ml" -- uses printf
             , "prog4674.ml" -- uses printf
             , "prog4715.ml" -- uses printf
             , "prog4751.ml" -- uses printf
             , "prog4752.ml" -- uses printf
             , "prog4753.ml" -- uses printf
             , "prog4754.ml" -- uses printf
             , "prog4755.ml" -- uses printf
             , "prog4756.ml" -- uses printf
             , "prog4757.ml" -- uses printf
             , "prog4758.ml" -- uses printf
             , "prog4766.ml" -- uses printf
             , "prog4774.ml" -- uses printf
             , "prog4775.ml" -- uses printf
             , "prog4776.ml" -- uses printf
             , "prog4778.ml" -- uses printf
             , "prog4779.ml" -- uses printf
             , "prog4780.ml" -- uses printf
             , "prog4781.ml" -- uses printf
             , "prog4782.ml" -- uses printf
             , "prog4783.ml" -- uses printf
             , "prog4784.ml" -- uses printf
             , "prog4785.ml" -- uses printf
             , "prog4786.ml" -- uses printf
             , "prog4787.ml" -- uses printf
             , "prog4788.ml" -- uses printf
             , "prog4789.ml" -- uses printf
             , "prog4790.ml" -- uses printf
             , "prog4791.ml" -- uses printf
             , "prog4792.ml" -- uses printf
             , "prog4793.ml" -- uses printf
             , "prog4794.ml" -- uses printf
             , "prog4795.ml" -- uses printf
             , "prog4796.ml" -- uses printf
             , "prog4797.ml" -- uses printf
             , "prog4798.ml" -- uses printf
             , "prog4799.ml" -- uses printf
             , "prog4800.ml" -- uses printf
             , "prog4801.ml" -- uses printf
             , "prog4802.ml" -- uses printf
             , "prog4803.ml" -- uses printf
             , "prog4807.ml" -- uses printf
             , "prog4808.ml" -- uses printf
             , "prog4812.ml" -- uses printf
             , "prog4819.ml" -- uses printf
             , "prog4820.ml" -- uses printf
             , "prog4821.ml" -- uses printf
             , "prog4822.ml" -- uses printf
             , "prog4823.ml" -- uses printf
             , "prog4824.ml" -- uses printf
             , "prog4825.ml" -- uses printf
             , "prog4830.ml" -- uses printf
             , "prog4832.ml" -- uses printf
             , "prog4834.ml" -- uses printf
             , "prog4835.ml" -- uses printf
             , "prog4836.ml" -- uses printf
             , "prog4837.ml" -- uses printf
             , "prog4839.ml" -- uses printf
             , "20060302-21:24:02-246ce61683ae0484e1606c781c19f80f.seminal.ml" -- uses instance variable assignment
             , "20060322-01:15:12-8f2c701fedc5409bb06ec8282652a352.seminal.ml" -- memory leak??
             ]

type Err = String

parseAllIn :: FilePath -> IO [(FilePath, Maybe Err, Prog)]
parseAllIn dir = do
--  let dir = "../yunounderstand/data/sp14/prog/unify"
  mls <- filter (`notElem` ignoredMLs) . filter (".ml" `isSuffixOf`)
          <$> getDirectoryContents dir
  parseAll dir mls

parseAll dir [] = return []
parseAll dir (ml:mls) = do
    r <- parseTopForm <$> readFileStrict (dir </> ml)
    case r of
      Right p -> do
        b <- doesFileExist (dir </> ml <.> "err")
        err <- if b
               then Just <$> readFileStrict (dir </> ml <.> "err")
               else return Nothing
        mls <- parseAll dir mls
        return $ (ml, err, p) : mls
      Left _ -> print ml >> print r >> parseAll dir mls

parseFile :: FilePath -> IO Prog
parseFile f = do
  r <- parseTopForm <$> readFileStrict f
  case r of
   Right p -> return p
   Left e  -> error (show e)

readFileStrict :: FilePath -> IO String
readFileStrict = fmap T.unpack . TIO.readFile

concatMapM :: Monad m => (a -> m [b]) -> [a] -> m [b]
concatMapM f xs = liftM concat (mapM f xs)

findM :: Monad m => (a -> m Bool) -> [a] -> m (Maybe a)
findM p [] = return Nothing
findM p (x:xs) = ifM (p x) (return $ Just x) (findM p xs)

ifM :: Monad m => m Bool -> m a -> m a -> m a
ifM b t f = do b <- b; if b then t else f
