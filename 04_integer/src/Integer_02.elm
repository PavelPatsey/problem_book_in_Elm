module Integer_02 exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { content : String
    , mass : Int
    }


init : Model
init =
    { content = ""
    , mass = 0
    }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model
                | content = newContent
                , mass = Maybe.withDefault 0 (String.toInt newContent)
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Введите значение массы M в килограммах: " ]
        , input [ placeholder "Значение массы M в килограммах", value model.content, onInput Change ] []
        , div [] [ text "Значение массы M в килограммах:" ]
        , div [] [ text (String.fromInt model.mass) ]
        , div [] [ text "Количество полных тонн в M:" ]
        , div [] [ text (String.fromInt (model.mass // 1000)) ]
        ]



-- Integer2. Дана масса M в килограммах. Используя операцию деления нацело,
-- найти количество полных тонн в ней (1 тонна = 1000 кг).
