module Player.Player exposing (
  Player
  , Direction(..)
  , createPlayer
  , view
  , movePlayer
  )

import Svg exposing (Svg)

import World.Tile.Tile as T exposing (Tile, view)

type alias Player = Tile
type Direction = Up | Down | Left | Right

createPlayer : String -> Int -> Int -> Int -> Int -> Player
createPlayer =
  T.create << Just

view : Player -> Svg a
view = T.view

movePlayer : Direction -> Int -> Player -> Player
movePlayer direction distance player =
  case direction of
    Up -> T.move 0 -2 player
    Down -> T.move 0 2 player
    Left -> T.move -2 0 player
    Right -> T.move 2 0 player
