module Main where

import Add
import Ask
import Remove
import System.Environment

prelude = "Usage: memkeep <command>\n\
\Commands:\n\
\ \n\
\   add   Add a question to the question bank\n\
\   ask   Ask a question from the question bank\n\
\   rem   Remove a question from the question bank\n\
\ \n\
\ \n"

main :: IO ()
main = do
  args <- getArgs
  
  if  args == [] then putStr prelude 
                 else let firstArg =  head args
                 in (case firstArg of 
                     "add" -> addQuestion 
                     "ask" -> askQuestion
                     "rem" -> remQuestion)
