module Begin_16.Begin_16_v3 exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Coordinates =
    { x1 : Float
    , x2 : Float
    }


type alias Model =
    Coordinates


init : Model
init =
    { x1 = 0
    , x2 = 0
    }



-- UPDATE


type Msg
    = ChangeX1 String
    | ChangeX2 String


update : Msg -> Model -> Model
update msg model =
    let
        changeNewX newX =
            Maybe.withDefault 0 (String.toFloat newX)
    in
    case msg of
        ChangeX1 newX ->
            { model | x1 = changeNewX newX }

        ChangeX2 newX ->
            { model | x2 = changeNewX newX }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Значение координаты x1: " ]
        , input
            [ placeholder "x1 = "
            , value (String.fromFloat model.x1)
            , onInput ChangeX1
            ]
            []
        , div [] [ text "Значение координаты x2: " ]
        , input
            [ placeholder "x2 = "
            , value (String.fromFloat model.x2)
            , onInput ChangeX2
            ]
            []
        , div [] [ text "Расстояние между двумя точками x1 и x2 = " ]
        , div []
            [ text
                (String.fromFloat
                    (abs
                        (model.x1 - model.x2)
                    )
                )
            ]
        ]



-- Begin16. Найти расстояние между двумя точками с заданными координатами
-- x1 и x2 на числовой оси: |x2 – x1|.
-- !!!В модели Float, поэтому нельзя вводить в placeholder String.
-- !!! при этом тогда и нельзя вводить отрицательыне числа
