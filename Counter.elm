
module Counter where

import Mouse

increment : a -> Int -> Int
increment _ n = n + 5

counter : Signal Int
counter = foldp increment 100 Mouse.clicks

main : Signal Element
main = lift asText counter

-- Questions?