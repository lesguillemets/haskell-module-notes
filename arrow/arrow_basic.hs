import Control.Arrow

main = do
    print $ first show (2,3)
    print $ second show (2,3)
    -- (***) :: a b c -> a b' c' -> a (b, b') (c, c') 
    print $ (succ *** show) (2,3)
    -- (&&&) :: a b c -> a b c' -> a b (c, c')
    -- here it is (Int -> Int) -> (Int -> String) -> Int -> (Int, String)
    print $ (succ &&& show) (3::Int)
    print $ (arr succ &&& show) (3::Int)
    --        ^ (Int -> Int) -> Int -> Int
