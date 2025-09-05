import Data.Char

main = do
   putStrLn("... Programa de mensaje secreto")
   putStrLn("\n... Dame la cadena ...")
   cadena <- getLine 
   let secreto = map chr (map (1+)(map ord cadena))
   putStrLn("\n... Mensaje Encriptado ...")
   putStrLn(secreto)

   putStrLn("... Mensaje Desencriptado ..."
   let revelacion = map chr (map (-1)(map ord cadena))
   putStrLn(revelacion)	

