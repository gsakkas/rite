module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  ) where

import Control.Monad
import qualified Data.Map as Map
import Test.QuickCheck

import NanoML.Eval
import NanoML.Gen
import NanoML.Misc
import NanoML.Parser
import NanoML.Types


check :: [Decl] -> IO ()
check decls = do
  env <- foldM (flip evalDecl) baseEnv decls
  case last decls of
    DFun _ [(VarPat f, Lam {})]
      | Just t <- Map.lookup f knownFuncs
        -> do args <- mapM (generate . genExpr) (argTys t)
              eval (mkApps (Var f) args) env
              putStrLn "Done!"
    _ -> putStrLn "Done!"
