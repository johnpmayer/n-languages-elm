
module Fibonacci where

{- Comment -}
-- Comment

{- Yes, this is inefficient -}

fib : Int -> Int
fib n = case n of
  1 -> 1
  2 -> 1
  _ -> fib (n-1) + fib (n-2)

{- Some 'magic' to display the result -}

main : Element
main = asText (fib 100)

-- Questions?