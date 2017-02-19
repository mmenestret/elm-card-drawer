module Models exposing (..)

import Array

type Card = Card Figure Colour
type Figure =
    Two   | Three | Four | Five | Six |
    Seven | Eight | Nine | Ten  |
    Jack  | Queen | King | Ace
type Colour =
    Hearts | Clubs | Spades | Diamonds

figures = Array.fromList [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
colours = Array.fromList [Hearts, Clubs, Spades, Diamonds]