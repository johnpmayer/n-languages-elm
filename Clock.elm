
module Clock where

hand : Color -> Float -> Float -> Form
hand clr len time =
  let angle = degrees (90 - 6 * inSeconds time)
  in  segment (0,0) (fromPolar (len,angle)) |> traced (solid clr)

clock : Float -> Element
clock t = collage 400 400 [ filled    lightGrey   (ngon 12 110)
                          , outlined (solid grey) (ngon 12 110)
                          , hand orange   100  t
                          , hand charcoal 100 (t/60)
                          , hand charcoal 60  (t/720) ]

main : Element
main = clock 2384645624656
