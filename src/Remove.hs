module Remove where

import System.IO
import System.Directory

remQuestion :: IO ()
remQuestion = do
  let file = "qa.db"
  h <- openFile file ReadMode
  s <- hGetContents h
  let fileLines = lines s
  let f = (\(a, b) -> let val = if (a `mod` 2 == 1) 
                                then show ((a `div` 2) + 1)
                                else "  " 
                      in val ++ " " ++ b)
  let fileLinesWithNumbers = map f $ zip [1.. (length fileLines)] fileLines
  putStr $ unlines fileLinesWithNumbers
  putStrLn "Which Question would you like to delete"
  userInputLine <- getLine
  let lineToDelete = read userInputLine
  if 0 < lineToDelete && lineToDelete <= length fileLines
  then writeFile file $ unlines $ concat [take ((lineToDelete - 1) * 2) fileLines, drop 2 $ drop ((lineToDelete -1)* 2) fileLines]
  else pure()



