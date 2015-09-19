{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Control.Monad
import Control.Monad.IO.Class
import qualified Data.Map as Map
import qualified Data.Graph.Inductive.Dot as Graph
import qualified Data.Graph.Inductive.Graph as Graph
import Data.Text (Text)
import Lucid
import Web.Scotty

import NanoML
import NanoML.Misc
import NanoML.Pretty


main = scotty 8091 $ do
  get "/" $ do
    html . renderText . doctypehtml_ $ do
      head_ $ do
        title_ "NanoMaLy"
        link_ [ href_ "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css", rel_ "stylesheet", type_ "text/css" ]
        -- script_ [ src_ "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js", type_ "text/javascript" ] ("" :: Text)ext/css" ]
        script_ [ src_ "/zepto.min.js", type_ "text/javascript" ] ("" :: Text)
        link_ [ href_ "/vis.css", rel_ "stylesheet", type_ "text/css" ]
        script_ [ src_ "/vis.js", type_ "text/javascript" ] ("" :: Text)
        script_ [ src_ "/codemirror-min.js", type_ "text/javascript" ] ("" :: Text)
        link_ [ href_ "/codemirror.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "/dialog.css", rel_ "stylesheet", type_ "text/css" ]
        link_ [ href_ "/nanoml.css", rel_ "stylesheet", type_ "text/css" ]
        script_ [ src_ "/nanoml.js", type_ "text/javascript" ] ("" :: Text)
      body_ [class_ "container-fluid", onload_ "setup()"] $ do
        nav_ [class_ "navbar navbar-default"] $ do
          div_ [class_ "container-fluid"] $ do
            div_ [class_ "navbar-header"] $ do
              a_ [class_ "navbar-brand", href_ "#"] "NanoMaLy"
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
                      ] ""
          div_ [class_ "col-md-6"] $ do
            div_ [ id_ "vis" -- , style_ "height: 100%; border: 1px solid lightgray;"
                 ] ""

  get "/zepto.min.js"  $ file "bin/dist/zepto.min.js"
  get "/vis.css" $ file "bin/dist/vis.css"
  get "/vis.js"  $ file "bin/dist/vis.js"
  get "/codemirror-min.js"  $ file "bin/dist/codemirror-min.js"
  get "/codemirror.css"  $ file "bin/dist/codemirror.css"
  get "/dialog.css" $ file "bin/dist/dialog.css"
  get "/nanoml.css"  $ file "bin/nanoml.css"
  get "/nanoml.js"  $ file "bin/nanoml.js"

  post "/check" $ do
    prog <- param "prog"
    var  <- param "var"
    liftIO $ print (var, prog)
    let p = fromRight (parseTopForm prog)
    -- liftIO $ print (prettyProg p)
    res <- liftIO $ if null var
                    then fromJust <$> check Nothing p
                    else checkDecl var p
    -- liftIO $ print res
    case res of
      Success n finalState -> do
        gr <- liftIO $ buildGraph (stEdges finalState)
        st <- fmap (ancestor gr) $ liftIO $ findRoot gr (stCurrentExpr finalState)
        let gr' = Graph.nmap (fillHoles finalState) gr
        let dot = Graph.showDot (Graph.fglToDotGeneric gr' (show.pretty) show id)
        let root = show (backback gr st)
        let stuck = show st
        liftIO $ writeFile "tmp.dot" dot
        json $ Map.fromList [ ("dot" :: String, dot)
                            , ("root", root)
                            , ("stuck", stuck)
                            ]

        -- html . renderText . doctypehtml_ $ do
        -- title_ "NanoML"
        -- body_ $ do
        --   "Could not find a counter-example after "
        --   toHtml (show n)
        --   "tests.."
      Failure {..} -> do
        gr <- liftIO $ buildGraph (stEdges finalState)
        st <- fmap (ancestor gr) $ liftIO $ findRoot gr (stCurrentExpr finalState)
        let gr' = Graph.nmap (fillHoles finalState) gr
        let dot = Graph.showDot (Graph.fglToDotGeneric gr' (show.pretty) show id)
        let root = show (backback gr st)
        let stuck = show st
        liftIO $ writeFile "tmp.dot" dot
        json $ Map.fromList [ ("dot" :: String, dot)
                            , ("root", root)
                            , ("stuck", stuck)
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
