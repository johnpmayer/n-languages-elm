
module Counter where

import Mouse

increment : a -> Int -> Int
increment _ n = n + 1

counter : Signal Int
counter = foldp increment 0 Mouse.clicks

main : Signal Element
main = lift asText counter

-- Questions?