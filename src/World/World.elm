module World.World exposing (
  Map
  , createMap
  , addWall
  , view
  )

import Svg exposing (Svg, rect, g)

import World.Tile.Tile as T exposing (..)

type alias Map =
  { floor : Tile
  , walls : List Tile
  }

createMap : Tile -> Map
createMap floor = Map floor []

addWall : Map -> Tile -> Map
addWall map wall = { map | walls = wall::map.walls }

view : Map -> Svg a
view { floor, walls } =
  g [] [
    T.view floor
    , g [] <| List.map T.view walls
  ]
