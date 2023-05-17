module Integer_25 exposing (..)

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
        [ div [] [ text "Введите целое число K, лежащее в диапазоне 1–365:" ]
        , input [ placeholder "", value model.inputA, onInput ChangeA ] []
        , validateAndGetAnswer model
        ]


validateAndGetAnswer : Model -> Html Msg
validateAndGetAnswer model =
    if 1 <= model.numberA && model.numberA <= 365 then
        div []
            [ div [ style "color" "green" ] [ text "номер дня недели для K-го дня года, если известно, что в этом году 1 января было четвергом:" ]
            , div [ style "color" "green" ] [ text (String.fromInt (modBy 7 (model.numberA + 3))) ]
            ]

    else
        div [ style "color" "red" ] [ text "Введите трехзначное в диапазоне 1–365!" ]



-- Integer25. Дни недели пронумерованы следующим образом: 0 — воскресенье,
-- 1 — понедельник, 2 — вторник, . . . , 6 — суббота. Дано целое число K,
-- лежащее в диапазоне 1–365. Определить номер дня недели для K-го дня
-- года, если известно, что в этом году 1 января было четвергом
