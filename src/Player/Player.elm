module Player.Player exposing (..)

import Svg exposing (Svg)

import World.Tile.Tile as T exposing (Tile, view)

type alias Player = Tile

createPlayer : String -> Int -> Int -> Int -> Int -> Player
createPlayer =
  T.create << Just

view : Player -> Svg a
view = T.view
