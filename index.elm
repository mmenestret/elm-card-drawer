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

type alias Model =
  { card : Maybe Card
  }
  
init : (Model, Cmd Msg)
init = (Model Nothing, Cmd.none)


-- UPDATE

type Msg = Pick | NewCard (Maybe Card)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Pick ->
      (model, generate NewCard (newCardGen figures colours))
    NewCard newCard ->
      (Model newCard, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (cardToString model.card) ]
    , button [ onClick Pick ] [ text "Pick a new card" ]
    ]

