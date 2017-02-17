module Utils exposing (cardToString)

import Models exposing (..)

colourToString : Colour -> String
colourToString col =
  case col of
      Hearts -> "hearts"
      Clubs -> "clubs"
      Diamonds -> "diamonds"
      Spades -> "spades"

figureToString : Figure -> String
figureToString fig = toString fig

cardToString : Card -> String
cardToString card =
  case card of
      Card fig col ->
          let
            figAsString = figureToString fig
            colAsString = colourToString col
          in figAsString ++ " of " ++ colAsString