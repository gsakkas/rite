{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Control.Monad
import Control.Monad.IO.Class
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
      title_ "NanoML"
      body_ $ do
        form_ [action_ "/", method_ "POST"] $ do
          textarea_ [ name_ "prog", placeholder_ "Bad code here"
                    , rows_ "10", cols_ "50"
                    , style_ "font-family: monospace;"] ""
          br_ []
          input_ [ name_ "var", placeholder_ "check this function"
                 , style_ "font-family: monospace;" ]
          button_ [type_ "submit"] "Submit"

  get "/vis.css" $ file "bin/dist/vis.css"
  get "/vis.js"  $ file "bin/dist/vis.js"
  get "/nanoml.js"  $ file "bin/nanoml.js"  

  post "/" $ do
    prog <- param "prog"
    var  <- param "var"
    liftIO $ print (var, prog)
    let p = fromRight (parseTopForm prog)
    res <- liftIO $ if null var
                    then fromJust <$> check Nothing p
                    else checkDecl var p
    case res of
      Success n -> html . renderText . doctypehtml_ $ do
        title_ "NanoML"
        body_ $ do
          "Could not find a counter-example after "
          toHtml (show n)
          "tests.."
      Failure {..} -> do
        gr <- liftIO $ buildGraph (stEdges finalState)
        st <- fmap (ancestor gr) $ liftIO $ findRoot gr (stCurrentExpr finalState)
        let gr' = Graph.nmap (fillHoles finalState) gr
        let dot = Graph.showDot (Graph.fglToDotGeneric gr' (show.pretty) show id)
        liftIO $ writeFile "tmp.dot" dot
        html . renderText . doctypehtml_ $ do
          head_ $ do
            title_ "NanoML"
            link_ [ href_ "/vis.css", rel_ "stylesheet", type_ "text/css" ]
            script_ [ src_ "/vis.js", type_ "text/javascript" ] ("" :: Text)
            script_ [ id_ "reduction-graph", type_ "text/dot" ] dot
            script_ [ id_ "root-node" ] (show (backback gr st))
            script_ [ id_ "stuck-node" ] (show st)
            script_ [ src_ "/nanoml.js", type_ "text/javascript" ] ("" :: Text)
          body_ [ onload_ "draw()" ] $ do
            h2_ "Program"
            div_ [ style_ "font-family: monospace;" ] $
              code_ $ pre_ $ toHtml prog
            h2_ "Trace"
            div_ $ do
              div_ [ id_ "menu", style_ "float: left;" ] $ ul_ $ do
                li_ $
                  button_ [ disabled_ "true", id_ "step-forward",  onclick_ "stepForward()" ]
                    "Step forward"
                li_ $
                  button_ [ disabled_ "true", id_ "step-backward", onclick_ "stepBackward()" ]
                    "Step backward"
                li_ $
                  button_ [ disabled_ "true", id_ "jump-forward",  onclick_ "jumpForward()"  ]
                    "Jump forward"
                li_ $
                  button_ [ disabled_ "true", id_ "jump-backward", onclick_ "jumpBackward()" ]
                    "Jump backward"
              div_ [ id_ "vis", style_ "float: left; width: 800px; height: 800px; border: 1px solid lightgray;" ] ""
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
