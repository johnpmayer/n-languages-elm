
module FollowMouse where

import Mouse

display : (Int,Int) -> Element
display (x,y) = flow right [
  color red (container x y middle (asText ("Mouse: " ++ show (x,y)))),
  color black <| container 100 100 middle empty
  ]

-- Mouse.position : Signal (Int,Int)

main : Signal Element
main = lift display Mouse.position

-- Questions?