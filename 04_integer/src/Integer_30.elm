module Integer_30 exposing (..)

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
        [ div [] [ text "Введите номер некоторого года (целое положительное число):" ]
        , input [ placeholder "", value model.inputA, onInput ChangeA ] []
        , validateAndGetAnswer model
        ]


validateAndGetAnswer : Model -> Html Msg
validateAndGetAnswer model =
    if model.numberA > 0 && modBy 1 model.numberA == 0 then
        div []
            [ div [ style "color" "green" ] [ text "Cоответствующее этому году номер столетия:" ]
            , div [ style "color" "green" ] [ text (String.fromInt ((model.numberA - 1) // 100 + 1)) ]
            ]

    else
        div [ style "color" "red" ] [ text "Введите целое положительное число!" ]



-- Integer30. Дан номер некоторого года (целое положительное число). Опре-
-- делить соответствующий ему номер столетия, учитывая, что, к примеру,
-- началом 20 столетия был 1901 год.
