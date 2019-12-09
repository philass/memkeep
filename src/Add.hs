module Add where

import System.IO
import System.Directory

appendFileLine :: FilePath -> String -> IO ()
appendFileLine file line = appendFile file $ line ++ ['\n']

addQuestion :: IO ()
addQuestion = do
  let file = "qa.db"
  fileExist <- doesFileExist file
  if (not fileExist) then  (putStrLn "qa.db was created") 
                     else pure()
  putStrLn "What is the question?"
  question <- getLine
  putStrLn "What is the answer?"
  answer <- getLine
  appendFileLine file question
  appendFileLine file answer
  putStrLn "Question Added"


