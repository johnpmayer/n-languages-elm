
module Cat where

-- Union types, Alegebraic types, Sum types, Enumerated Types
-- This line defines a new type for a given name

data FurColor = Black | Brown | Orange | Grey | White

-- Record types
-- This line defines a new name, or synonym, for a given name

type Cat = { name : String, furColor : FurColor }

tom = { name = "Tom", furColor = Grey }

main = asText tom

-- Questions?