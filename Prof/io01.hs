import Control.Monad  
import Data.Char  
      
main = forever $ do  
        putStr "dame una palabra: "  
        l <- getLine  
        putStrLn $ map toUpper l  