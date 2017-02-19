module Logic exposing(newCardGen)

import Array exposing (..)
import Random exposing (..)

import Models exposing (..)

-- Takes the Array of possible figures / colour and produces a Card Generator
newCardGen : Array Figure -> Array Colour -> Generator Card
newCardGen figArray colArray =
    let
        figSize = Array.length figArray - 1
        colSize = Array.length colArray - 1
    in map2 (newCardFromIndices figArray colArray) (Random.int 0 figSize) (Random.int 0 colSize)

{-
    Takes the Array of possible figures / colour and produces a function that takes 2 indices and may produce a Card
    This function is gonna be needed for the map2 that combine the 2 int Generators
-}
newCardFromIndices : Array Figure -> Array Colour -> Int -> Int -> Card
newCardFromIndices figArray colArray figI colI =
    let
        f = Maybe.withDefault Ace (Array.get figI figArray)
        c = Maybe.withDefault Spades (Array.get colI colArray)
    in Card f c