import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as LBC
import NanoML

main :: IO ()
main = interact ocamltojson

ocamltojson :: String -> String
ocamltojson inp = case parseTopForm inp of
  Left e -> error e
  Right ds -> LBC.unpack (encode ds)
