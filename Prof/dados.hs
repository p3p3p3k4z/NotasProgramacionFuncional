-- Visualizador de permutaciones en 3D usando OpenGL y GLUT
import Graphics.UI.GLUT
import System.Random (newStdGen, randomRs)
import Data.IORef
import Data.List (permutations)

type Position = (GLfloat, GLfloat, GLfloat)

numCubes :: Int
numCubes = 5

-- Genera posiciones en línea
initialPositions :: [Position]
initialPositions = [ (fromIntegral i * 2 - 4, 0, 0) | i <- [0..(numCubes - 1)] ]

-- Dibuja un cubo en una posición dada
drawCubeAt :: Position -> IO ()
drawCubeAt (x, y, z) = preservingMatrix $ do
    translate $ Vector3 x y z
    color $ Color3 0.3 0.6 (0.9 :: GLfloat)
    cube 1

-- Genera una permutación aleatoria de las posiciones
randomPermutation :: IO [a] -> IO [a]
randomPermutation getList = do
    list <- getList
    gen <- newStdGen
    return $ map snd $ zip (randomRs (0 :: Int, 1000) gen) list
                >>= \x -> return x
                & sortOn fst
                & map snd

-- Actualiza las posiciones según una permutación aleatoria
permutePositions :: IORef [Position] -> IO ()
permutePositions posRef = do
    pos <- readIORef posRef
    newPos <- randomPermutation (return pos)
    writeIORef posRef newPos
    postRedisplay Nothing

-- Dibuja la escena completa
display :: IORef [Position] -> DisplayCallback
display posRef = do
    clear [ColorBuffer, DepthBuffer]
    loadIdentity
    translate $ Vector3 0 0 (-15 :: GLfloat)
    positions <- readIORef posRef
    mapM_ drawCubeAt positions
    flush
    swapBuffers

-- Reshape callback para ajustar el viewport
reshape :: ReshapeCallback
reshape size@(Size w h) = do
    viewport $= (Position 0 0, size)
    postRedisplay Nothing

-- Teclado: con espacio, aplica una nueva permutación
keyboardMouse :: IORef [Position] -> KeyboardMouseCallback
keyboardMouse posRef key Down _ _ = case key of
    (Char ' ') -> permutePositions posRef
    (Char 'q') -> leaveMainLoop
    _          -> return ()
keyboardMouse _ _ _ _ _ = return ()

-- Configura la escena
initGL :: IO ()
initGL = do
    clearColor $= Color4 0 0 0 1
    depthFunc  $= Just Less
    lighting   $= Disabled
    shadeModel $= Smooth

-- Main
main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    initialDisplayMode $= [DoubleBuffered, RGBAMode, WithDepthBuffer]
    createWindow "Permutaciones con Cubos 3D (Haskell + OpenGL)"
    reshapeCallback $= Just reshape
    initGL
    positionsRef <- newIORef initialPositions
    displayCallback $= display positionsRef
    keyboardMouseCallback $= Just (keyboardMouse positionsRef)
    mainLoop
