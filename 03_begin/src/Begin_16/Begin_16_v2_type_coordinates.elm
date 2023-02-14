module Begin_16.Begin_16_v2_type_coordinates exposing (..)

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
    = Change_x1 String
    | Change_x2 String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change_x1 new_x1 ->
            { model | x1 = Maybe.withDefault 0 (String.toFloat new_x1) }

        Change_x2 new_x2 ->
            { model | x2 = Maybe.withDefault 0 (String.toFloat new_x2) }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Значение координаты x1: " ]
        , input
            [ placeholder "x1 = "
            , value (String.fromFloat model.x1)
            , onInput Change_x1
            ]
            []
        , div [] [ text "Значение координаты x2: " ]
        , input
            [ placeholder "x2 = "
            , value (String.fromFloat model.x2)
            , onInput Change_x2
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
