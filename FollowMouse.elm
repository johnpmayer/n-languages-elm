
module FollowMouse where

import Mouse

display : (Int,Int) -> Element
display (x,y) = container x y middle <| asText <| "Mouse: " ++ show (x,y)

main : Signal Element
main = lift display Mouse.position