module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text, Attribute)
import Html.Attributes exposing (style, attribute, class)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg 
  = Increment 
  | Decrement 
  | BumpMeUp
  | ResetMe

buttonStyle: List (Attribute msg)
buttonStyle = [
  style "border" "3px solid green"
  , style "background-color" "transparent"
  , style "border-radius" "5px"
  , style "margin" "1rem"
  , style "color" "green"
  , style "padding" "5px 10px"
  , style "width" "150px"]

wrapperStyle: List (Attribute msg)
wrapperStyle = [
  style "display" "flex"
  , style "flex-direction" "column"
  , style "width" "600px"
  , style "justify-content" "center"
  , style "align-items" "center"]

textStyle: List (Attribute msg)
textStyle = [
  style "font-size" "2rem"
  , style "font-weight" "bold"
  , style "margin" "1rem"
  , style "color" "green"]

update msg number =
  case msg of
    Increment ->
      number + 1

    Decrement ->
      number - 1

    BumpMeUp -> 
      1000

    ResetMe ->
      0

view number =
  div wrapperStyle
    [ div textStyle [ text (String.fromInt number) ]
    , div [] [
      button ([onClick Decrement] ++ buttonStyle) [ text "Decrese me!" ]
      , button ([ onClick Increment ] ++ buttonStyle) [ text "Increase me!" ]
    ]
    , div [] [
        button ([onClick BumpMeUp] ++ buttonStyle) [ text "Bump me up!" ]
        , button ([onClick ResetMe] ++ buttonStyle) [ text "Reset me" ]
      ]
    ]