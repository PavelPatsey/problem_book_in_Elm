module Begin_20.Begin_20_v1_record exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { x1 : String
    , y1 : String
    , x2 : String
    , y2 : String
    }


init : Model
init =
    { x1 = ""
    , y1 = ""
    , x2 = ""
    , y2 = ""
    }



-- UPDATE


type Msg
    = Change_x1 String
    | Change_y1 String
    | Change_x2 String
    | Change_y2 String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change_x1 new_x1 ->
            { model | x1 = new_x1 }

        Change_y1 new_y1 ->
            { model | y1 = new_y1 }

        Change_x2 new_x2 ->
            { model | x2 = new_x2 }

        Change_y2 new_y2 ->
            { model | y2 = new_y2 }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Значение координаты x1: " ]
        , input [ placeholder "x1 = ", value model.x1, onInput Change_x1 ] []
        , div [] [ text "Значение координаты y1: " ]
        , input [ placeholder "y1 = ", value model.y1, onInput Change_y1 ] []
        , div [] [ text "Значение координаты x2: " ]
        , input [ placeholder "x2 = ", value model.x2, onInput Change_x2 ] []
        , div [] [ text "Значение координаты y2: " ]
        , input [ placeholder "y2 = ", value model.y2, onInput Change_y2 ] []
        , div [] [ text "Расстояние между двумя точками (x1, y1) и (x2, y2) = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculate_distance
                        { x1 = Maybe.withDefault 0 (String.toFloat model.x1)
                        , y1 = Maybe.withDefault 0 (String.toFloat model.y1)
                        , x2 = Maybe.withDefault 0 (String.toFloat model.x2)
                        , y2 = Maybe.withDefault 0 (String.toFloat model.y2)
                        }
                    )
                )
            ]
        ]


calculate_distance : { x1 : Float, y1 : Float, x2 : Float, y2 : Float } -> Float
calculate_distance { x1, y1, x2, y2 } =
    sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)



-- Begin20. Найти расстояние между двумя точками с заданными координатами
-- (x1, y1) и (x2, y2) на плоскости. Расстояние вычисляется по формуле
