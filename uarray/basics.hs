module Main where
import Data.Array.Unboxed as U

type Table = U.UArray (Int,Int) Int
type Index = (Int,Int)
type Value = Int

---------------------
-- Creating arrays

-- U.listArray :: (IArray a e, Ix i) => (i, i) -> [e] -> a i e
-- U.listArray (lowbound, upbound) [elements]
table = U.listArray ((0,0), (1,1)) [0..] :: Table
-- |
-- >>> table
-- array ((0,0),(1,1)) [((0,0),0),((0,1),1),((1,0),2),((1,1),3)]

-- U.array :: (IArray a e, Ix i) => (i, i) -> [(i, e)] -> a i e
table' = U.array ((0,0),(1,1)) [((0,1),3), ((1,1),-5)] :: Table
-- | specifying each items
-- >>> table'
-- array ((0,0),(1,1)) [((0,0),0),((0,1),3),((1,0),0),((1,1),-5)]

-- U.accumArray :: (IArray a e, Ix i) =>
--                  (e -> e' -> e) -> e -> (i, i) -> [(i, e')] -> a i e
accL = [((1,1),5), ((1,0),2), ((1,1),2)] :: [(Index,Value)]
table'' = U.accumArray (\acc e -> acc+e) 0 ((0,0),(1,1)) accL :: Table
-- | Note accL has two elements with index (1,1).
-- >>> table''
-- array ((0,0),(1,1)) [((0,0),0),((0,1),0),((1,0),2),((1,1),7)]


---------------------
--- Accessing Arrays

-- | Accessing an element
-- >>> table ! (1,0)
-- 2

-- | What are the bounds of the index?
-- >>> bounds table
-- ((0,0),(1,1))

-- | list the elements
-- >>> elems table
-- [0,1,2,3]

-- | association list
-- >>> assocs table
-- [((0,0),0),((0,1),1),((1,0),2),((1,1),3)]

-- Updating Tables
-- | Updating to specific values
-- >>> table // [((0,0), 99), ((1,1),23)]
-- array ((0,0),(1,1)) [((0,0),99),((0,1),1),((1,0),2),((1,1),23)]
--
-- >>> accum (*) table [((0,1),2), ((0,0),100), ((0,1),3)]
-- array ((0,0),(1,1)) [((0,0),0),((0,1),6),((1,0),2),((1,1),3)]

main = do
    print $ table
    print $ table // [((0,0), 99), ((1,1),23)]
    print $ table'
    print $ table''
    print $ table ! (1,0)
    print $ bounds table
    print $ indices table
    print $ elems table
    print $ assocs table
