module Logic exposing(newCardGen)

import Array exposing (..)
import Random exposing (..)

import Models exposing (..)

newCardFromIndices : Array Figure -> Array Colour -> Int -> Int -> Maybe Card
newCardFromIndices figArray colArray figI colI =
    let
        maybeF = Array.get figI figArray
        maybeC = Array.get colI colArray
    in
        Maybe.map2 Card maybeF maybeC

newCardGen : Array Figure -> Array Colour -> Generator (Maybe Card)
newCardGen figArray colArray =
    let
        figSize = Array.length figArray - 1
        colSize = Array.length colArray - 1
    in map2 (newCardFromIndices figArray colArray) (Random.int 0 figSize) (Random.int 0 colSize)
