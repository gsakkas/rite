{-# LANGUAGE LambdaCase #-}

module NanoML.Instantiate where

import           Control.Monad.State
import qualified Data.Set as Set
import           Data.Maybe

import           NanoML.Types

-- state holding number of
--   {variable names, function names, ctor names}
-- seen so far
-- data ExprState = ExprState { stVar :: Int
--                           , stFun :: Int
--                           , stCtr :: Int }
-- incVar, incFun, incCtr :: State ExprState ()
-- incVar = modify $ \e -> e {stVar = 1 + stVar e}
-- incFun = modify $ \e -> e {stFun = 1 + stFun e}
-- incCtr = modify $ \e -> e {stCtr = 1 + stCtr e}

-- var, fun, ctr :: State ExprState String
-- var    = incVar >> gets (('x':) . show . stVar)
-- fun    = incFun >> gets (('f':) . show . stFun)
-- ctr    = incCtr >> gets (('c':) . show . stCtr)

-- varpat  = VarPat Nothing <$> var
-- tvar    = TVar "TODO"
-- typevar = pure Nothing

-- instantiateExpr' :: ExprGeneric -> State ExprState Expr
-- instantiateExpr' = \case
--  EmptyG              -> pure $ Hole Nothing (-1) Nothing
--  VarG                -> Var Nothing <$> var
--  LamG e              -> Lam Nothing <$> varpat <*> instantiateExpr' e <*> typevar
--  AppG se             -> App Nothing <$> (Var Nothing <$> fun) <*> mapM instantiateExpr' (Set.toList se)
--  BopG e1 e2          -> Bop Nothing And <$> instantiateExpr' e1 <*> instantiateExpr' e2
--  UopG e              -> Uop Nothing Neg <$> instantiateExpr' e
--  LitG                -> pure $ Lit Nothing (LS "Literal")
--  -- LetG !RecFlag !(Set ExprGeneric) !ExprGeneric
--  -- Let !MSrcSpan !RecFlag [(Pat,Expr)] !Expr
--  LetG recFlag se e   -> let wrap :: ExprGeneric -> State ExprState (Pat, Expr)
--                             wrap e = (,) <$> varpat <*> instantiateExpr' e
--                         in Let Nothing recFlag <$> mapM wrap (Set.toList se) <*> instantiateExpr' e
--  IteG e1 e2 e3       -> Ite Nothing <$> instantiateExpr' e1 <*> instantiateExpr' e2 <*> instantiateExpr' e3
--  SeqG e1 e2          -> Seq Nothing <$> instantiateExpr' e1 <*> instantiateExpr' e2
--  -- CaseG !ExprGeneric !(Set (Maybe ExprGeneric, ExprGeneric))
--  --   (Maybe ExprGeneric, ExprGeneric) is just (Guard, Expr) but with ExprGeneric
--  -- Case !MSrcSpan !Expr [Alt]
--  CaseG e cases       -> let wrap :: (Maybe ExprGeneric, ExprGeneric) -> State ExprState (Pat, Guard, Expr)
--                             wrap (g, e) = (,,) <$> varpat <*> mapM instantiateExpr' g <*> instantiateExpr' e
--                         in Case Nothing <$> instantiateExpr' e <*> mapM wrap (Set.toList cases)
--  TupleG se           -> Tuple Nothing <$> mapM instantiateExpr' (Set.toList se)
--  -- ConApp !MSrcSpan !DCon (Maybe Expr) (Maybe Type)
--  -- ConAppG !(Maybe ExprGeneric)
--  ConAppG me          -> ConApp Nothing <$> ctr <*> mapM instantiateExpr' me <*> pure (Just tvar)
--  -- Record !MSrcSpan [(String, Expr)] (Maybe Type)
--  -- RecordG ![(String, ExprGeneric)]
--  RecordG xs          -> let wrap :: Functor f => f ExprGeneric -> State ExprState (f Expr)
--                             wrap = mapM instantiateExpr'
--                         in Record Nothing <$> mapM wrap xs <*> typevar
--  FieldG e s          -> Field Nothing <$> instantiateExpr' e <*> pure s
--  SetFieldG e1 s e2   -> SetField Nothing <$> instantiateExpr' e1 <*> pure s <*> instantiateExpr' e2
--  ArrayG se           -> Array Nothing <$> mapM instantiateExpr' (Set.toList se) <*> typevar
--  -- List !MSrcSpan [Expr] (Maybe Type)
--  -- ListG !ExprGeneric
--  ListG e             -> List Nothing <$> ((\x -> [x]) <$> instantiateExpr' e) <*> typevar

-- instantiateExpr :: ExprGeneric -> Expr
-- instantiateExpr = evalStateT instantiateExpr' (ExprState 0 0 0)

instantiateExpr :: ExprGeneric -> Expr
instantiateExpr = \case
    EmptyG            -> Var Nothing "..."
    VarG              -> Var Nothing "_"
    LamG p e          -> Lam Nothing (instantiatePat p) (instantiateExpr e) Nothing
    AppG se           -> App Nothing (Var Nothing "foo") $ map instantiateExpr (Set.toList se)
    BopG e1 e2        -> Bop Nothing Times (instantiateExpr e1) (instantiateExpr e2)
    UopG e            -> Uop Nothing Neg $ instantiateExpr e
    LitG              -> Lit Nothing (LS "Lit")
    LetG recFlag se e -> let wrap :: (PatGeneric, ExprGeneric) -> (Pat, Expr)
                             wrap (p, e) = (instantiatePat p, instantiateExpr e)
                         in Let Nothing recFlag (map wrap (Set.toList se)) (instantiateExpr e)
    IteG e1 e2 e3     -> Ite Nothing (instantiateExpr e1) (instantiateExpr e2) (instantiateExpr e3)
    SeqG e1 e2        -> Seq Nothing (instantiateExpr e1) (instantiateExpr e2)
    CaseG cases       -> let wrap :: (PatGeneric, Maybe ExprGeneric, ExprGeneric) -> (Pat, Guard, Expr)
                             wrap (p, g, e) = (instantiatePat p, instantiateExpr <$> g, instantiateExpr e)
                         in Case Nothing (instantiateExpr VarG) (map wrap (Set.toList cases))
    TupleG se         -> Tuple Nothing (map instantiateExpr (Set.toList se))
    ConAppG me        -> ConApp Nothing "con" (instantiateExpr <$> me) Nothing
    ListG e           -> List Nothing (map instantiateExpr (Set.toList e)) Nothing

instantiatePat :: PatGeneric -> Pat
instantiatePat = \case
    EmptyPatG        -> VarPat Nothing "..."
    VarPatG          -> VarPat Nothing "_"
    LitPatG          -> LitPat Nothing (LS "LitPat")
    IntervalPatG     -> IntervalPat Nothing (LS "x") (LS "y")
    ConsPatG p1 p2   -> ConsPat Nothing (instantiatePat p1) (instantiatePat p2)
    ConPatG Nothing  -> ConPat Nothing "con" Nothing
    ConPatG (Just p) -> ConPat Nothing "con" (Just $ instantiatePat p)
    ListPatG ps      -> ListPat Nothing (map instantiatePat (Set.toList ps))
    TuplePatG ps     -> TuplePat Nothing (map instantiatePat (Set.toList ps))
    WildPatG         -> WildPat Nothing
    OrPatG p1 p2     -> OrPat Nothing (instantiatePat p1) (instantiatePat p2)
    AsPatG p         -> AsPat Nothing (instantiatePat p) "_"
    ConstrPatG p t   -> ConstraintPat Nothing (instantiatePat p) t
