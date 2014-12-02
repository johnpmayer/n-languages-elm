
module Demo where

import Graphics.Input (Input, input, button)
import Text

data PresControl = Top | Next | Prev | Last

presControl : Input PresControl
presControl = input Top

goto : PresControl -> Int -> Int
goto control page = 
  case control of
    Top -> 0
    Prev -> page - 1
    Next -> page + 1
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

{- Content goes here -}

content : [[String]]
content = [
  ["N Languages in N months NYC","Functional Fall: Elm","John P Mayer"],
  ["A bit about me...","- Live in NYC","- Software Developer at Bridgewater Associates","- Contributor/Participant in Elm since 2012"],
  ["Elm Programming Language"],
  ["What is it?","- Functional","- Reactive","- For interactive applications"],
  ["Functional","- 'ML' Family:","- Static Typing with Inference","- Pure Functions, Immutable Data","Live Code: Fibonacci"],
  ["Types and Values","- Data","- Records","Live Code: Model the Cat!"],
  ["Graphics","- The 'Element' Type","- Understood by the graphic runtime","- Declarative","- Constructive"]
  ]