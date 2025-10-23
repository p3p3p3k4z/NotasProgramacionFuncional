main = do
       putStrLn "Que onda? Hola. Cómo te llamas?"
       inputStr <- getLine
       putStrLn $ "Bienvenido al tequio de mañana, a la orilla"++
                " de la carretera, por si pasas por ahi (también el domingo), "
                ++ inputStr ++ "!"
-- mónada de acciones secuenciales....!!!!