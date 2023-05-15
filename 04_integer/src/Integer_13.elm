module Integer_13 exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (slice)



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
    if 1 <= model.numberA // 100 && model.numberA // 100 <= 9 then
        div [] [ text ("Ответ: " ++ slice 1 3 model.inputA ++ slice 0 1 model.inputA) ]

    else
        div [ style "color" "red" ] [ text "Введите трехзначное число!" ]



-- Integer13. Дано трехзначное число. В нем зачеркнули первую слева цифру и
-- приписали ее справа. Вывести полученное число.
