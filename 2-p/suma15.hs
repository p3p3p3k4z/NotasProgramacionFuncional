suman15 :: [(Integer, Integer, Integer)]
suman15 = [(x, y, z) | x <- [1..10], y <- [1..10], z <- [1..10], x + y + z == 15]
