module Main where

import Add
import Ask
import System.Environment


main :: IO ()
main = do
  putStrLn "hello world"
  args <- getArgs
  let firstArg =  head args
  case firstArg of "add" -> addQuestion
                   "ask" -> askQuestion
