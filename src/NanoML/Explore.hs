module NanoML.Explore where

import Control.Monad
import Control.Monad.IO.Class
import qualified Data.Graph.Inductive as Graph
import qualified Data.List as List
import Data.Maybe (isJust, mapMaybe)
import Data.Monoid
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
  root = backback gr stuck
  getLab = fromJust . Graph.lab gr

  -- prettyGraph = Graph.nmap pretty

  -- go :: Graph -> IO ()
  go path = do
    let p = Graph.topsort path
    liftIO $ mypprint p
    liftIO $ printf "Choose an expression "
    node <- (p!!) . pred . read . fromJust <$> getInputLine "> "
    liftIO $ printf "[f]orward, [s]kip forward, [b]ackward, [S]kip backward, [z]oom "
    act <- fromJust <$> getInputChar "> "
    case act of
      'f' -> smallForward path node
      's' -> bigForward path node
      'b' -> smallBackward path node
      'S' -> bigBackward path node
      'z' -> zoom path node

  smallForward p n  = case forwardstep steps n of
                        Just x  -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        Nothing -> liftIO (printf "Can't step forward!\n") >> go p
  bigForward p n    = case forwardjump steps n of
                        Just x  -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        Nothing -> liftIO (printf "Can't jump forward!\n") >> go p
  smallBackward p n = case backwardstep steps n of
                        Just x  -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        Nothing -> liftIO (printf "Can't step backward!\n") >> go p
  bigBackward p n   = case backjump steps n of
                        Just x  -> go (collapse steps ((x, getLab x) : Graph.labNodes p))
                        Nothing -> liftIO (printf "Can't jump backward!\n") >> go p
  zoom p n = case filter q (subterms gr n) of
               []  -> liftIO (printf "No zoom candidates") >> go p
               [x] -> go (collapse steps [(x, getLab x), (z, getLab z)])
                      where z = forwardforward steps x
               _ -> error "explore.zoom: impossible: more than 1 candidate"
    where q x = isJust $ List.find (== StepsTo CallStep) (map snd $ Graph.lsuc gr x)

  mypprint p = forM_ (zip [1..] p) $ \(i,n) -> do
    let idx = printf "%02d: " (i :: Int)
    let doc = text idx <> pretty (getLab n)
    print doc

  

onlySteps = filter (isStepsTo . snd)

-- collapseEdges :: [Graph.LEdge b] -> Graph.Gr a b -> Graph.Gr a b
-- collapseEdges es gr = Graph.delNodes oldN . Graph.delEdges oldE . -- Graph.delNodes oldN .
--                       Graph.insEdges newE $ gr
--   where
--   newE = [ (x,v2,l) | (v1,v2,_) <- es
--                     , (x, l) <- Graph.lpre gr v1 ]
--   oldE = [ (v1,v2)  | (v1,v2,_) <- es ]
--   oldN = [ v1       | (v1,_ ,_) <- es ]


collapseBadEdges :: Eq a => Graph.Gr a b -> Graph.Gr a b
collapseBadEdges gr
  = case badEdges gr of
      []  -> gr
      e:_ -> collapseBadEdges (collapseEdge e gr)
  where
  badEdges gr = filter (\(v1,v2,el) -> Graph.lab gr v1 == Graph.lab gr v2) (Graph.labEdges gr)

collapseEdge :: Graph.LEdge b -> Graph.Gr a b -> Graph.Gr a b
collapseEdge (v1,v2,_) gr =
  Graph.delEdge (v1,v2) . Graph.delNode v1 . Graph.insEdges es $ gr
  where
  es = [ (x,v2,l) | (x, l) <- Graph.lpre gr v1 ]

-- | Collapse a graph to a subset of the nodes.
--
-- Differs from Graph.filter in that paths between nodes are preserved.

collapse :: Eq a => Graph.Gr a EdgeKind -> [Graph.LNode a] -> Graph.Gr a EdgeKind
collapse gr ns = Graph.mkGraph ns es
  where
  es = mapMaybe f . List.nub . map (take 2) $ List.permutations ns
  -- disjoint x y = Set.null (Set.difference x y)
  sns = Set.fromList (map fst ns)
  f [x,y] = let sp = Set.fromList (Graph.esp (fst x) (fst y) gr)
            in if Set.null sp || (Set.intersection sp sns /= Set.fromList [fst x, fst y])
               then Nothing
               else Just (fst x, fst y, StepsTo BoringStep)


test = do
  let (_, st, _) = runEvalFull stdOpts (stepAllProg =<< mapM refreshDecl (fromRight (parseTopForm facProg)))
  gr <- buildGraph (stEdges st)
  stuck <- findRoot gr (stCurrentExpr st)
  -- explore gr stuck
  return (gr, stuck)
