module Integer_05 exposing (..)

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
    , inputB : String
    , numberA : Int
    , numberB : Int
    }


init : Model
init =
    { inputA = ""
    , inputB = ""
    , numberA = 1
    , numberB = 1
    }



-- UPDATE


type Msg
    = ChangeA String
    | ChangeB String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeA newA ->
            { model
                | inputA = newA
                , numberA = Maybe.withDefault 0 (String.toInt newA)
            }

        ChangeB newB ->
            { model
                | inputB = newB
                , numberB = Maybe.withDefault 0 (String.toInt newB)
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "A и B - целые положительные числа, при этом A > B: " ]
        , div [] [ text "Введите значение числа А" ]
        , input [ placeholder "", value model.inputA, onInput ChangeA ] []
        , div [] [ text "Введите значение числа B" ]
        , input [ placeholder "", value model.inputB, onInput ChangeB ] []
        , div [] [ text "Значение числа A:" ]
        , div [] [ text (String.fromInt model.numberA) ]
        , div [] [ text "Значение числа B:" ]
        , div [] [ text (String.fromInt model.numberB) ]
        , div [] [ text "Длина незанятой части отрезка A:" ]
        , div [] [ text (String.fromInt (modBy model.numberB model.numberA)) ]
        ]



-- Integer5. Даны целые положительные числа A и B (A > B). На отрезке длины A
-- размещено максимально возможное количество отрезков длины B (без на-
-- ложений). Используя операцию взятия остатка от деления нацело, найти
-- длину незанятой части отрезка A.
