module Ask where

import System.IO
import System.Directory
import System.Random
import Data.Typeable

appendFileLine :: FilePath -> String -> IO ()
appendFileLine file line = appendFile file $ line ++ ['\n']

askQuestion :: IO ()
askQuestion = do
  let file = "qa.db"
  fileExist <- doesFileExist file
  if (not fileExist) then  (putStrLn "No File with Questions") 
                     else do 
                            h <- openFile file ReadMode
                            s <- hGetContents h
                            let fileLines = lines s
                            let numLines = length fileLines
                            randomRow <- getStdRandom $ randomR $ (0, (numLines `div` 2) - 1)
                            putStrLn $ "The number of Lines : " ++ show numLines
                            putStrLn $ fileLines !! (randomRow * 2)
                            userAnswer <- getLine
                            let actualAnswer = fileLines !! (randomRow * 2 + 1)
                            if actualAnswer == userAnswer then putStrLn "Correct!"
                                                          else putStrLn $ "Wrong! the answer is : " ++ actualAnswer


