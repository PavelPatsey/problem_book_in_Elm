module Boolean_01 exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { inputA : String
    , numberA : Int
    }


init : Model
init =
    { inputA = ""
    , numberA = 0
    }



-- UPDATE


type Msg
    = ChangeA String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeA newA ->
            { model
                | inputA = newA
                , numberA = Maybe.withDefault 0 (String.toInt newA)
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Введите целое число A:" ]
        , input [ placeholder "", value model.inputA, onInput ChangeA ] []
        , div [] [ text ("Число " ++ String.fromInt model.numberA ++ " является положительным?") ]
        , validate model
        ]


validate : Model -> Html Msg
validate model =
    if model.numberA > 0 then
        div [ style "color" "green" ] [ text "Да!" ]

    else
        div [ style "color" "red" ] [ text "Нет!" ]



-- Boolean1. Дано целое число A. Проверить истинность высказывания: «Чис-
-- ло A является положительным»
