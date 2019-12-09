module Main where

import Add
import Ask
import Remove
import System.Environment


main :: IO ()
main = do
  args <- getArgs
  let firstArg =  head args
  case firstArg of "add" -> addQuestion
                   "ask" -> askQuestion
                   "rem" -> remQuestion
