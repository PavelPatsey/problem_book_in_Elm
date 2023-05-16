module Integer_17 exposing (..)

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
    , numberA = 1
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
        [ div [] [ text "Введите трехзначное число A:" ]
        , input [ placeholder "A =", value model.inputA, onInput ChangeA ] []
        , viewValidation model
        ]


viewValidation : Model -> Html Msg
viewValidation model =
    if model.numberA >= 999 then
        div [ style "color" "green" ] [ text ("Ответ: " ++ String.fromInt (modBy 10 (model.numberA // 100))) ]

    else
        div [ style "color" "red" ] [ text "Введите трехзначное число, большее 999!" ]



-- Integer17. Дано целое число, большее 999. Используя одну операцию деле-
-- ния нацело и одну операцию взятия остатка от деления, найти цифру,
-- соответствующую разряду сотен в записи этого числа.
--
-- Ввод
-- 1234
-- Вывод
-- 2
