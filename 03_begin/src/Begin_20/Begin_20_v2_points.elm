module Begin_20.Begin_20_v2_points exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Point =
    { x : Float
    , y : Float
    }


type alias Model =
    { point_1 : Point
    , point_2 : Point
    }


init : Model
init =
    { point_1 = { x = 0, y = 0 }
    , point_2 = { x = 0, y = 0 }
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
        Change_x1 new_x ->
            { model
                | point_1 =
                    { x = Maybe.withDefault 0 (String.toFloat new_x)
                    , y = model.point_1.y
                    }
            }

        Change_y1 new_y ->
            { model
                | point_1 =
                    { x = model.point_1.x
                    , y = Maybe.withDefault 0 (String.toFloat new_y)
                    }
            }

        Change_x2 new_x ->
            { model
                | point_2 =
                    { x = Maybe.withDefault 0 (String.toFloat new_x)
                    , y = model.point_2.y
                    }
            }

        Change_y2 new_y ->
            { model
                | point_2 =
                    { x = model.point_2.x
                    , y = Maybe.withDefault 0 (String.toFloat new_y)
                    }
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Значение координаты x1: " ]
        , input
            [ placeholder "x1 = "
            , value (String.fromFloat model.point_1.x)
            , onInput Change_x1
            ]
            []
        , div [] [ text "Значение координаты y1: " ]
        , input
            [ placeholder "y1 = "
            , value (String.fromFloat model.point_1.y)
            , onInput Change_y1
            ]
            []
        , div [] [ text "Значение координаты x2: " ]
        , input
            [ placeholder "x2 = "
            , value (String.fromFloat model.point_2.x)
            , onInput Change_x2
            ]
            []
        , div [] [ text "Значение координаты y2: " ]
        , input
            [ placeholder "y2 = "
            , value (String.fromFloat model.point_2.y)
            , onInput Change_y2
            ]
            []
        , div [] [ text "Расстояние между двумя точками (x1, y1) и (x2, y2) = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculate_distance
                        ( model.point_1
                        , model.point_2
                        )
                    )
                )
            ]
        ]


calculate_distance : ( Point, Point ) -> Float
calculate_distance ( point_1, point_2 ) =
    sqrt ((point_2.x - point_1.x) ^ 2 + (point_2.y - point_1.y) ^ 2)



-- Begin20. Найти расстояние между двумя точками с заданными координатами
-- (x1, y1) и (x2, y2) на плоскости. Расстояние вычисляется по формуле
