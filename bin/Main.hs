{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Control.Monad
import Control.Monad.IO.Class
import Lucid
import Web.Scotty

import NanoML
import NanoML.Misc


main = scotty 9000 $ do
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

  post "/" $ do
    prog :: String <- param "prog"
    var :: String <- param "var"
    liftIO $ print (var, prog)
    res <- liftIO (checkDecl var (fromRight (parseTopForm prog)))
    case res of
      Success n -> html . renderText . doctypehtml_ $ do
        title_ "NanoML"
        body_ $ do
          "Could not find a counter-example after "
          toHtml (show n)
          "tests.."
      Failure {..} -> html . renderText . doctypehtml_ $ do
        title_ "NanoML"
        body_ $ do
          h2_ "Program"
          div_ [ style_ "font-family: monospace;" ] $
            code_ $ pre_ $ toHtml prog
          h2_ "Counter-example"
          div_ [ style_ "font-family: monospace;" ] (toHtml (show counterExample))
          h2_ "Interesting paths"
          div_ [ style_ "font-family: monospace;" ] $ forM pathSlices $ \p -> do
            div_ [ style_ "float:left; margin:0; width:33%;" ] $
              code_ $ pre_ $ toHtml (show p)
            

    -- html . renderText . doctypehtml_ $ do
    --   title_ "NanoML"
    --   body_ $ do
    --     form_ $ do
    --       textarea_ [placeholder_ "Bad code here", rows_ "10", cols_ "50"] ""
    --       button_ [type_ "submit"] "Submit"
