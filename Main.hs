{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty as WSC
import System.Environment
import Control.Monad
import Data.Monoid
import Data.Aeson
import Data.Map

data Person = Person {
    name :: String,
    job  :: String
  } deriving Show

instance ToJSON Person where
  toJSON (Person name job) =
    object [ "name" .= name, "job" .= job]

main :: IO ()
main = do
  port <- liftM read $ getEnv "PORT"
  scotty port $ do
    get "/" $ do
      html "Hello World!"
  
    get "/me" $ do
      WSC.json (Person "junsumida" "software engineer")
  
    get "/word/:word" $ do
      beam <- param "word"
      html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
  
    notFound $ do
      text "there is no such route."
