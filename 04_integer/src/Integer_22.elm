module Integer_22 exposing (..)

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
        [ div [] [ text "Введите целое число N, равное кол-ву секнуд прошедших с начала суток:" ]
        , input [ placeholder "", value model.inputA, onInput ChangeA ] []
        , div [] [ text "Количество секунд, прошедших с начала последнего часа:" ]
        , div [] [ text (String.fromInt (modBy 3600 model.numberA)) ]
        ]



-- Integer22◦. С начала суток прошло N секунд (N — целое). Найти количество
-- секунд, прошедших с начала последнего часа.
--
-- Ввод
-- 1234
-- Вывод
-- 2
