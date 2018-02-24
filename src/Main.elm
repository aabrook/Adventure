module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Svg exposing (Svg, svg)
import Svg.Attributes exposing (height, width)

import World.Tile.Tile as T exposing (..)
import World.World as W exposing (..)
import Player.Player as P exposing (..)

---- Initial Play Stuff ----

defaultPlayer : P.Player
defaultPlayer =
  P.createPlayer "#d11" 5 5 2 2

worldView : Map
worldView =
  let
    base = W.createMap <| T.create (Just "#ddd") 0 0 100 100
    walls =
      [ T.create (Just "#999") 10 10 20 5
      , T.create (Just "#999") 10 50 40 5
      , T.create (Just "#999") 15 85 5 70
      , T.create (Just "#999") 80 15 70 5
      , T.create (Just "#999") 10 10 5 75
      ]
    withWalls =
      List.foldr (flip W.addWall) base walls
  in
    withWalls

---- MODEL ----


type alias Model =
  { player : Maybe Player
  }


init : ( Model, Cmd Msg )
init =
    ( { player = Just defaultPlayer }, Cmd.none )


---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----

view : Model -> Html Msg
view model =
  let
    player = Maybe.map (\p -> [P.view p]) model.player
      |> Maybe.withDefault []
  in
    div []
      [ h1 [] [ text "Your Elm App is working!" ]
      , svg [height "500", width "500"] <| [W.view worldView] ++ player
      ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
