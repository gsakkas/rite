module NanoML.Explore where

import Control.Monad
import Control.Monad.IO.Class
import qualified Data.Graph.Inductive as Graph
import qualified Data.List as List
import Data.Maybe (mapMaybe)
import qualified Data.Set as Set
import System.Console.Haskeline
import Text.Printf

import NanoML.Eval
import NanoML.Misc
import NanoML.Parser
import NanoML.Pretty
import NanoML.Prim
import NanoML.Step
import NanoML.Types

import Debug.Trace

explore :: Graph -> Graph.Node -> IO ()
explore gr stuck = runInputT defaultSettings (go (collapse gr [(root, getLab root), (stuck, getLab stuck)]))
  where
  steps = Graph.efilter (isStepsTo . Graph.edgeLabel) gr
  root = fromJust (backjump gr stuck)
  getLab = fromJust . Graph.lab gr

  prettyGraph = Graph.nmap pretty

  -- go :: Graph -> IO ()
  go path = do
    liftIO $ Graph.prettyPrint (prettyGraph path)
    liftIO $ printf "Choose a node. "
    node <- read . fromJust <$> getInputLine "> "
    liftIO $ printf "[f]orward, [s]kip forward, [b]ackward, [S]kip backward "
    act <- fromJust <$> getInputChar "> "
    case act of
      'f' -> smallForward path node
      's' -> bigForward path node
      'b' -> smallBackward path node
      'S' -> bigBackward path node
    
  smallForward p n  = case onlySteps (Graph.lsuc steps n) of
                        [(x,_)] -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        [] -> liftIO (printf "Can't step forward!\n") >> go p
  bigForward p n    = case onlySteps (Graph.lsuc steps n) of
                        [(x,_)] -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        [] -> liftIO (printf "Can't jump forward!\n") >> go p
  smallBackward p n = case onlySteps (Graph.lpre steps n) of
                        [(x,_)] -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        [] -> liftIO (printf "Can't step backward!\n") >> go p
  bigBackward p n   = case onlySteps (Graph.lpre steps n) of
                        [(x,_)] -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        [] -> liftIO (printf "Can't jump backward!\n") >> go p


onlySteps = filter (isStepsTo . snd)

-- | Collapse a graph to a subset of the nodes.
--
-- Differs from Graph.filter in that paths between nodes are preserved.
collapse :: Graph -> [Node] -> Graph
collapse gr ns = Graph.mkGraph ns es
  where
  es = mapMaybe f . List.nub . map (take 2) $ List.permutations ns
  -- disjoint x y = Set.null (Set.difference x y)
  sns = Set.fromList (map fst ns)
  f [x,y] = let sp = Set.fromList (Graph.esp (fst x) (fst y) gr)
            in if Set.null sp || (Set.intersection sp sns /= Set.fromList [fst x, fst y])
               then Nothing
               else Just (fst x, fst y, StepsTo)


test = do
  let (_, st, _) = runEvalFull stdOpts (stepAllProg =<< mapM refreshDecl (fromRight (parseTopForm facProg)))
  gr <- buildGraph (stEdges st)
  stuck <- findRoot gr (stCurrentExpr st)
  explore gr stuck
  
