module Main where

import Prelude

import HTTPurple (ServerM, response', serve)
import HTTPurple as HTTPurple.ResponseHeaders

main :: ServerM
main = do
  serve { port: 8755 } { route: pure "/"
    , router:
      \_ ->
        response' 200 HTTPurple.ResponseHeaders.empty "Hello, World!"
    }
