module Main where

import Add
import System.Environment

main :: IO ()
main = do
  putStrLn "hello world"
  args <- getArgs
  let firstArg =  head args
  if (firstArg == "add") then addQuestion
                          else pure()

