-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/random.html

import Html exposing (..)
import Html.Events exposing (..)
import Random exposing(..)

import Models exposing (figures, colours, Card)
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
-- Describes the model of the application: there can be a card (or not if it hasn't been drawn for the first time)
type alias Model =
  { card : Maybe Card
  }
  
init : (Model, Cmd Msg)
init = (Model Nothing, Cmd.none)


-- UPDATE
-- The different types of Msg that can be produced
type Msg = Pick | NewCard (Maybe Card)

-- Each time a Msg is produced (e.g. an 'onclick') the update function is called by Elm and it produces a new Model
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Pick ->
      (model, generate NewCard (newCardGen figures colours))
    NewCard newCard ->
      (Model newCard, Cmd.none)


-- SUBSCRIPTIONS
-- Other sources of Msg (e.g. web sockets)
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- VIEW
-- How the HTML/Js has to be rendered based on the Model state
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (cardToString model.card) ]
    , button [ onClick Pick ] [ text "Pick a new card" ]
    ]

