
module Cat where

-- Union types, Algebraic types, Sum types, Enumerated Types
-- This line defines a new type for a given name

data FurColor = Black | Brown | Orange | Grey | White

data Foo = Bar Int | Baz (String,[Bool])

-- Record types
-- This line defines a new name, or synonym, for a given name

type Cat = { name : String, furColor : FurColor }

tom : Cat
tom = { name = "Tom", furColor = Grey }

main = asText foo

magnitude : { a | x : Int, y : Int } -> Int
magnitude r = r.x + r.y

foo = magnitude { x = 1, y = 2 }

-- Questions?