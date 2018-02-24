module World.Tile.Tile exposing (
    Tile
  , create
  , view
  , move
  )

import Maybe exposing (withDefault)

import Svg exposing (Svg, rect)
import Svg.Attributes exposing (fill, height, width, x, y)

import World.Position exposing (Coord(..))

type alias Tile_ =
  { color : Maybe String
  , position : Coord
  , height : Int
  , width : Int
  }

type Tile = Tile Tile_

create : Maybe String -> Int -> Int -> Int -> Int -> Tile
create color x y height width = Tile <| Tile_ color (Coord x y) height width

move : Int -> Int -> Tile -> Tile
move x y tile =
  let
    newPosition oldPos = case oldPos of
      Coord xPos yPos -> Coord (xPos + x) (yPos + y)
  in
    case tile of
      Tile t -> Tile { t | position = newPosition t.position }

view : Tile -> Svg a
view tile =
  case tile of
    Tile t -> render t

render : Tile_ -> Svg a
render tile =
  let
    (xPos, yPos) = case tile.position of
      Coord x y -> (x, y)
    color = withDefault "#FFF" tile.color
    toPct s = s |> toString |> (\v -> v ++ "%")
  in
    rect [
      tile.height |> toPct |> height,
      tile.width |> toPct |> width,
      xPos |> toPct |> x,
      yPos |> toPct |> y,
      fill color
    ] []
