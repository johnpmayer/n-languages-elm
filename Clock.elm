
module Clock where

import Mouse

hand : Color -> Float -> Float -> Form
hand clr len time =
  let angle = degrees (90 - 6 * inSeconds time)
  in  segment (0,0) (fromPolar (len,angle)) |> traced (solid clr)

--orangeHand : Float -> Float -> Form
orangeHand = hand orange
  
--clock : Float -> Element
clock t = collage 400 400 [ moveX 50 <| filled    lightGrey   (ngon 12 110)
                          , outlined (solid grey) (ngon 12 110)
                          , hand orange   100  t
              , hand charcoal 100 (t/60)
                          , hand charcoal 60  (t/720) ]

--main : Element
main = lift (\(x,y) -> clock (10000000 + toFloat x * 1000)) Mouse.position

-- Questions?

-- javascript does partially applied functions...