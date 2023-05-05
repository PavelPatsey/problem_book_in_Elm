module Integer_01 exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { content : String
  , distance : Int
  }


init : Model
init =
  { content = "" 
  , distance = 0}



-- UPDATE


type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent , distance = Maybe.withDefault 0 (String.toInt newContent)
      }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "Введите значения расстояния L в сантиметрах: " ]
    , input [ placeholder "Значение L в сантиметрах", value model.content, onInput Change ] []
    , div [] [ text ("Значение L в сантиметрах:") ]
    , div [] [ text (String.fromInt model.distance) ]
    , div [] [ text ("Количество полных метров в L:") ]
    , div [] [ text (String.fromInt (getAnswer model.distance)) ]
    ]

getAnswer: Int -> Int
getAnswer distance = 
  distance // 1000

    
-- Integer1. Дано расстояние L в сантиметрах. Используя операцию деления
-- нацело, найти количество полных метров в нем (1 метр = 100 см).