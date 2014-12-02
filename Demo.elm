
module Demo where

import Graphics.Input (Input, input, button)
import Text

data PresControl = Top | Next | Prev | Last

presControl : Input PresControl
presControl = input Top

goto : PresControl -> Int -> Int
goto control curpage = 
  case control of
    Top -> 0
    Prev -> curpage - 1
    Next -> curpage + 1
    Last -> length content - 1

header : Int -> Element
header page = flow right [
  button presControl.handle Prev "Previous",
  button presControl.handle Top "Top",
  button presControl.handle Last "Last",
  button presControl.handle Next "Next",
  asText page
  ]

display : Int -> Element
display page = flow down [
  header page,
  container 700 500 middle <| flow down <| map (centered << Text.height 24 << toText) <| case drop page content of
    [] -> ["End of presentation"]
    (slide::_) -> slide
  ]
 
currentPage : Signal Int
currentPage = foldp goto 0 presControl.signal

main : Signal Element
main = lift display currentPage

-- Questions?

{- Content goes here -}

content : [[String]]
content = [
  ["N Languages in N months NYC","Functional Fall: Elm","John P Mayer"],
  ["A bit about me...","- Live in NYC","- Software Developer at Bridgewater Associates","- Contributor/Participant in Elm since 2012"],
  ["Elm Programming Language"],
  ["What is Elm?","- Functional","- Graphics","- Reactive"],
  ["Functional"],
  ["Functional","- 'ML' Family:","- Static Typing with Inference","- Pure Functions, Immutable Data","Live Code: Fibonacci"],
  ["Types and Values","- Data","- Records","Live Code: Model the Cat!"],
  ["Graphics"],
  ["Graphics","- The 'Element' Type","- Understood by the graphic runtime","- Declarative","- Constructive","Live Code: Broken Clock"],
  ["Graphics Further Examples","WebGL","- https://github.com/evancz/first-person-elm","-  https://evancz.github.io/first-person-elm/","Virtual DOM","- https://github.com/rtfeldman/dreamwriter","- https://dreamwriter.io/"],
  ["Reactive"],
  ["Reactive","- The 'Signal' Type","- Values that change over time","- Program against the current value"],
  ["Mouse.position : Signal (Int,Int)"],
  ["Reactive","Transforming Signals"],
  ["Signal.lift : (a -> b) -> Signal a -> Signal b",
  "...",
  "This is going to be called Signal.map very soon"],
  ["Live Code: Follow the mouse"],
  ["Reactive","Remembering State"],
  ["Signal.foldp : (a -> b -> b) -> b -> Signal a -> Signal b"],
  ["Live Code: Counter"],
  ["Reactive","Native Inputs","- The 'Input' and 'Handle' Types"],
  ["Graphics.Input.input : a -> Input a","Graphics.Input.button : Handle a -> a -> String -> Element"],
  ["Live Code: I N C E P T I O N"],
  ["Live Code: 'Mechanical' Turing Machine"]
  ]