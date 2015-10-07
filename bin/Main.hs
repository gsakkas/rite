{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Control.Applicative
import Control.Monad
import Control.Monad.IO.Class
import Data.Aeson (object, (.=))
import Data.Default
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import qualified Data.Graph.Inductive.Dot as Graph
import qualified Data.Graph.Inductive.Graph as Graph
import qualified Data.Set as Set
import Data.Text (Text)
import Lucid
import Web.Scotty
import Network.Wai.Middleware.RequestLogger

import NanoML
import NanoML.Explore
import NanoML.Misc
import NanoML.Pretty


main = do
 log <- mkRequestLogger def { outputFormat = Detailed False }
 scotty 8091 $ do
  middleware log
  get "/" $ do
    prog <- lookup "prog" <$> params
    html . renderText . doctypehtml_ $ do
      head_ $ do
        title_ "NanoMaLy"
        link_ [ href_ "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css", rel_ "stylesheet", type_ "text/css" ]
        script_ [ src_ "//code.jquery.com/jquery-2.1.4.min.js", type_ "text/javascript" ] ("" :: Text)
        script_ [ src_ "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js", type_ "text/javascript" ] ("" :: Text)
        script_ [ src_ "/zepto.min.js", type_ "text/javascript" ] ("" :: Text)
        link_ [ href_ "/vis.css", rel_ "stylesheet", type_ "text/css" ]
        script_ [ src_ "/vis.js", type_ "text/javascript" ] ("" :: Text)
        script_ [ src_ "/codemirror-min.js", type_ "text/javascript" ] ("" :: Text)
        link_ [ href_ "/codemirror.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "/dialog.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "/lint.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "/nanoml.css", rel_ "stylesheet", type_ "text/css" ]
        script_ [ src_ "/nanoml.js", type_ "text/javascript" ] ("" :: Text)
      body_ [class_ "container-fluid", onload_ "setup()"] $ do
        nav_ [class_ "navbar navbar-default"] $ do
          div_ [class_ "container-fluid"] $ do
            div_ [class_ "navbar-header"] $ do
              a_ [class_ "navbar-brand", href_ "#"] "NanoMaLy"
            ul_ [class_ "nav navbar-nav"] $ do
              li_ [class_ "dropdown"] $ do
                button_ [ class_ "btn btn-default navbar-btn dropdown-toggle"
                        , type_ "button"
                        , id_ "loadMenu", data_ "toggle" "dropdown" ] $ do
                  "Demo "
                  span_ [class_ "caret"] ""
                ul_ [class_ "dropdown-menu"] $ do
                  li_ $ a_ [onclick_ "loadDemo('factorial')"] "factorial"
                  li_ $ a_ [onclick_ "loadDemo('wwhile')"] "wwhile"
                  li_ $ a_ [onclick_ "loadDemo('loop')"] "loop"
                  li_ $ a_ [onclick_ "loadDemo('palindrome')"] "palindrome"
            form_ [class_ "navbar-form navbar-left"] $ do
              div_ [class_ "form-group"] $ do
                input_ [ id_ "var-input", name_ "var"
                       , placeholder_ "check this function"
                       , type_ "text", class_ "form-control"
                       , style_ "font-family: monospace;"
                       ]
                button_ [id_ "check-btn", class_ "btn btn-default", type_ "submit"]
                  "Check!"
            form_ [class_ "navbar-form navbar-right"] $ do
              div_ [ class_ "form-group" ] $ do
                button_ [ type_ "button", class_ "btn btn-default", disabled_ "disabled"
                        , id_ "undo",  onclick_ "stepUndo()" ]
                  "Undo"
                button_ [ type_ "button", class_ "btn btn-default", disabled_ "disabled"
                        , id_ "step-forward",  onclick_ "stepForward()" ]
                  "Step forward"
                button_ [ type_ "button", class_ "btn btn-default", disabled_ "disabled"
                        , id_ "step-backward", onclick_ "stepBackward()" ]
                  "Step backward"
                button_ [ type_ "button", class_ "btn btn-default", disabled_ "disabled"
                        , id_ "jump-forward",  onclick_ "jumpForward()"  ]
                  "Jump forward"
                button_ [ type_ "button", class_ "btn btn-default", disabled_ "disabled"
                        , id_ "jump-backward", onclick_ "jumpBackward()" ]
                  "Jump backward"
                button_ [ type_ "button", class_ "btn btn-default", disabled_ "disabled"
                        , id_ "step-into", onclick_ "stepInto()" ]
                  "Step into"

        div_ [class_ "mybody row"] $ do
          div_ [class_ "mybody col-md-6"] $ do
            -- form_ [id_ "form", action_ "/", method_ "POST"] $ do
            --   div_ [class_ "row"] $
            --     div_ [class_ "input-group"] $ do
            --       span_ [class_ "input-group-btn"] $
            --         button_ [class_ "btn btn-default", type_ "submit"] "Check!"
            --   div_ [class_ "row"] $
            textarea_ [ id_ "prog", name_ "prog"
                        -- , rows_ "10", cols_ "50"
                        -- , style_ "font-family: monospace;"
                      ] (toHtml $ fromMaybe "" prog)
          div_ [class_ "mybody col-md-6"] $ do
            div_ [ id_ "safe-banner", class_ "alert alert-info"
                 , style_ "display: none;" ] $ do
              "Couldn't find a type error.."
            div_ [ id_ "unsafe-banner", class_ "alert alert-warning"
                 , style_ "display: none;" ] $ do
              "Your program contains a type error!"
            div_ [ id_ "vis", class_ "mybody", style_ "border: 1px solid lightgray;"
                 ] ""

  get "/zepto.min.js"  $ file "bin/dist/zepto.min.js"
  get "/vis.css" $ file "bin/dist/vis.css"
  get "/vis.js"  $ file "bin/dist/vis.js"
  get "/codemirror-min.js"  $ file "bin/dist/codemirror-min.js"
  get "/codemirror.css"  $ file "bin/dist/codemirror.css"
  get "/dialog.css" $ file "bin/dist/dialog.css"
  get "/lint.css" $ file "bin/dist/lint.css"
  get "/nanoml.css"  $ file "bin/nanoml.css"
  get "/nanoml.js"  $ file "bin/nanoml.js"

  post "/check" $ do
    prog <- param "prog"
    var  <- param "var" <|> return ""
    -- liftIO $ print (var, prog)
    let p = fromRight (parseTopForm prog)
    case parseTopForm prog of
      Right p -> run p var
      Left  e -> json $ object [ "result" .= ("parse-error" :: String)
                               , "error"  .= e
                               ]



run p var = do
    -- liftIO $ print (prettyProg p)
    res <- liftIO $ if null var
                    then fromJust <$> check Nothing p
                    else checkDecl var p
    let mkSpan s = object [ "startLine" .= srcSpanStartLine s
                          , "startCol" .= srcSpanStartCol s
                          , "endLine" .= srcSpanEndLine s
                          , "endCol" .= srcSpanEndCol s
                          ]
    let mkNode st (n, l) = object [ "id" .= n, "label" .= show (pretty (fillHoles st l))
                                  , "span" .= fmap mkSpan (getSrcSpanExprMaybe l)
                                  ]
    let mkEdge (x, y, l) = object [ "arrows" .= ("to" :: String)
                                  , "from" .= x, "to" .= y
                                  , "label" .= show l]
    -- liftIO $ print res
    case res of
      Success n finalState v -> do
        -- liftIO $ print v
        gr <- liftIO $ buildGraph (stEdges finalState)
        st <- liftIO $ findRoot gr v -- (stCurrentExpr finalState)
        let gr' = Graph.nmap (show . pretty . fillHoles finalState) gr
        let badEdges = filter (\(v1,v2,el) -> Graph.lab gr' v1 == Graph.lab gr' v2) (Graph.labEdges gr')
        -- liftIO $ print badEdges
        let gr'' = collapseEdges badEdges gr
        -- let nodes = Set.toList (Set.difference (Set.fromList (Graph.labNodes gr'))
        --                                        (Set.fromList (map (Graph.labNode' . Graph.context gr' . fst3) badEdges)))
        -- liftIO $ print nodes
        -- let gr'' = collapse gr' nodes
        let nodes = Graph.labNodes gr''
        let edges = Graph.labEdges gr''
        let root = backback gr'' st
        let value = st
        -- liftIO $ writeFile "tmp.dot" $ Graph.showDot (Graph.fglToDotGeneric gr'' id show id)
        json $ object [ -- ("dot" :: String, dot)
                        "nodes"  .= map (mkNode finalState) nodes
                      , "edges"  .= map mkEdge edges
                      , "root"   .= root
                      , "value"  .= value
                      , "result" .= ("value" :: String)
                      ]

        -- html . renderText . doctypehtml_ $ do
        -- title_ "NanoML"
        -- body_ $ do
        --   "Could not find a counter-example after "
        --   toHtml (show n)
        --   "tests.."
      Failure {..} -> do
        -- FIXME: handle programs that time out!!!
        liftIO $ print $ pretty errorMsg
        liftIO $ print counterExample
        case errorMsg of
          TimeoutError -> json $ object [ "result" .= ("timeout" :: String)
                                        , "root" .= show counterExample
                                        ]
          _ -> do
            gr <- liftIO $ buildGraph (stEdges finalState)
            bad <- liftIO $ findRoot gr (stCurrentExpr finalState)
            let st = ancestor gr bad
            let gr' = Graph.nmap (show . pretty . fillHoles finalState) gr
            let badEdges = filter (\(v1,v2,el) -> Graph.lab gr' v1 == Graph.lab gr' v2) (Graph.labEdges gr')
            -- let nodes = Set.toList (Set.difference (Set.fromList (Graph.labNodes gr'))
            --                                        (Set.fromList (map (Graph.labNode' . Graph.context gr' . fst3) badEdges)))
            let gr'' = collapseEdges badEdges gr
            let nodes = Graph.labNodes gr''
            let edges = Graph.labEdges gr''
            let root = backback gr'' st
            let stuck = st
            -- let dot = Graph.showDot (Graph.fglToDotGeneric gr'' id show id)
            -- liftIO $ writeFile "tmp.dot" dot
            json $ object [ -- ("dot" :: String, dot)
                            "nodes"  .= map (mkNode finalState) nodes
                          , "edges"  .= map mkEdge edges
                          , "root"   .= root
                          , "stuck"  .= stuck
                          , "bad"    .= bad
                          , "result" .= ("stuck" :: String)
                          , "reason" .= show (pretty errorMsg)
                          ]
        -- html . renderText . doctypehtml_ $ do
        --   head_ $ do
        --     title_ "NanoML"
        --     link_ [ href_ "/vis.css", rel_ "stylesheet", type_ "text/css" ]
        --     script_ [ src_ "/vis.js", type_ "text/javascript" ] ("" :: Text)
        --     script_ [ src_ "/codemirror-min.js", type_ "text/javascript" ] ("" :: Text)
        --     link_ [ href_ "/dialog.css", rel_ "stylesheet", type_ "text/css" ]
        --     script_ [ id_ "reduction-graph", type_ "text/dot" ] dot
        --     script_ [ id_ "root-node" ] (show (backback gr st))
        --     script_ [ id_ "stuck-node" ] (show st)
        --     script_ [ src_ "/nanoml.js", type_ "text/javascript" ] ("" :: Text)
        --   body_ [ onload_ "draw()" ] $ do
        --     h2_ "Program"
        --     div_ [ style_ "font-family: monospace;" ] $
        --       code_ $ pre_ $ toHtml prog
        --     h2_ "Trace"
        --     div_ $ do
        --       div_ [ id_ "menu" ] $ ul_ $ do
        --         li_ $
        --           button_ [ disabled_ "true", id_ "step-forward",  onclick_ "stepForward()" ]
        --             "Step forward"
        --         li_ $
        --           button_ [ disabled_ "true", id_ "step-backward", onclick_ "stepBackward()" ]
        --             "Step backward"
        --         li_ $
        --           button_ [ disabled_ "true", id_ "jump-forward",  onclick_ "jumpForward()"  ]
        --             "Jump forward"
        --         li_ $
        --           button_ [ disabled_ "true", id_ "jump-backward", onclick_ "jumpBackward()" ]
        --             "Jump backward"
        --       div_ [ id_ "vis", style_ "width: 50%; border: 1px solid lightgray;" ] ""
            -- h2_ "Counter-example"
            -- div_ [ style_ "font-family: monospace;" ] (toHtml (show counterExample))
            -- h2_ "Interesting paths"
            -- div_ [ style_ "font-family: monospace;" ] $ forM pathSlices $ \p -> do
            --   div_ [ style_ "float:left; margin:0; width:33%;" ] $
            --     code_ $ pre_ $ toHtml (show p)


    -- html . renderText . doctypehtml_ $ do
    --   title_ "NanoML"
    --   body_ $ do
    --     form_ $ do
    --       textarea_ [placeholder_ "Bad code here", rows_ "10", cols_ "50"] ""
    --       button_ [type_ "submit"] "Submit"
