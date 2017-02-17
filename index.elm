-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/random.html

import Html exposing (..)
import Html.Events exposing (..)
import Random exposing(..)

import Models exposing (..)
import Logic exposing (newCardGen)
import Utils exposing (cardToString)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
-- Describes the model of the application (a simple Card here)
type alias Model = Card
  
init : (Model, Cmd Msg)
init = (Card Ace Spades, Cmd.none)


-- UPDATE
-- The different types of Msg that can be produced
type Msg = Pick | NewCard Card

-- Each time a Msg is produced (e.g. an 'onclick') the update function is called by Elm and it produces a new Model
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Pick ->
      (model, generate NewCard (newCardGen figures colours))
    NewCard newCard ->
      (newCard, Cmd.none)


-- SUBSCRIPTIONS
-- Other sources of Msg (e.g. web sockets)
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- VIEW
-- How the HTML/Js has to be rendered based on the Model state
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (cardToString model) ]
    , button [ onClick Pick ] [ text "Pick a new card" ]
    ]

