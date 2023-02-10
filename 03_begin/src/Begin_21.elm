module Begin_21 exposing (..)

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
    { point1 : Point
    , point2 : Point
    , point3 : Point
    }


init : Model
init =
    { point1 = { x = 0, y = 0 }
    , point2 = { x = 0, y = 0 }
    , point3 = { x = 0, y = 0 }
    }



-- UPDATE


type Msg
    = ChangeX1 String
    | ChangeY1 String
    | ChangeX2 String
    | ChangeY2 String
    | ChangeX3 String
    | ChangeY3 String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeX1 newX ->
            { model
                | point1 =
                    { x = Maybe.withDefault 0 (String.toFloat newX)
                    , y = model.point1.y
                    }
            }

        ChangeY1 newY ->
            { model
                | point1 =
                    { x = model.point1.x
                    , y = Maybe.withDefault 0 (String.toFloat newY)
                    }
            }

        ChangeX2 newX ->
            { model
                | point2 =
                    { x = Maybe.withDefault 0 (String.toFloat newX)
                    , y = model.point2.y
                    }
            }

        ChangeY2 newY ->
            { model
                | point2 =
                    { x = model.point2.x
                    , y = Maybe.withDefault 0 (String.toFloat newY)
                    }
            }

        ChangeX3 newX ->
            { model
                | point3 =
                    { x = Maybe.withDefault 0 (String.toFloat newX)
                    , y = model.point3.y
                    }
            }

        ChangeY3 newY ->
            { model
                | point3 =
                    { x = model.point3.x
                    , y = Maybe.withDefault 0 (String.toFloat newY)
                    }
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Значение координаты x1: " ]
        , input
            [ placeholder "x1 = "
            , value (String.fromFloat model.point1.x)
            , onInput ChangeX1
            ]
            []
        , div [] [ text "Значение координаты y1: " ]
        , input
            [ placeholder "y1 = "
            , value (String.fromFloat model.point1.y)
            , onInput ChangeY1
            ]
            []
        , div [] [ text "Значение координаты x2: " ]
        , input
            [ placeholder "x2 = "
            , value (String.fromFloat model.point2.x)
            , onInput ChangeX2
            ]
            []
        , div [] [ text "Значение координаты y2: " ]
        , input
            [ placeholder "y2 = "
            , value (String.fromFloat model.point2.y)
            , onInput ChangeY2
            ]
            []
        , div [] [ text "Значение координаты x3: " ]
        , input
            [ placeholder "x3 = "
            , value (String.fromFloat model.point3.x)
            , onInput ChangeX3
            ]
            []
        , div [] [ text "Значение координаты y3: " ]
        , input
            [ placeholder "y3 = "
            , value (String.fromFloat model.point3.y)
            , onInput ChangeY3
            ]
            []
        , div [] [ text "Периметр треугольника с координатами вершин (x1, y1), (x2, y2) и (x3, y3) = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculatePrimeter
                        ( model.point1
                        , model.point2
                        , model.point3
                        )
                    )
                )
            ]
        , div [] [ text "Площадь треугольника с координатами вершин (x1, y1), (x2, y2) и (x3, y3) = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculateArea
                        ( model.point1
                        , model.point2
                        , model.point3
                        )
                    )
                )
            ]
        ]


calculateDistance : ( Point, Point ) -> Float
calculateDistance ( point1, point2 ) =
    sqrt ((point2.x - point1.x) ^ 2 + (point2.y - point1.y) ^ 2)


calculatePrimeter : ( Point, Point, Point ) -> Float
calculatePrimeter ( point1, point2, point3 ) =
    let
        a =
            calculateDistance ( point1, point2 )

        b =
            calculateDistance ( point1, point3 )

        c =
            calculateDistance ( point2, point3 )
    in
    a + b + c


calculateArea : ( Point, Point, Point ) -> Float
calculateArea ( point1, point2, point3 ) =
    let
        a =
            calculateDistance ( point1, point2 )

        b =
            calculateDistance ( point1, point3 )

        c =
            calculateDistance ( point2, point3 )

        p =
            (a + b + c) / 2
    in
    sqrt (p * (p - a) * (p - b) * (p - c))



-- Begin21. Даны координаты трех вершин треугольника: (x1, y1), (x2, y2), (x3, y3).
-- Найти его периметр и площадь, используя формулу для расстояния между двумя точками на плоскости (см. задание Begin20). Для нахождения
-- площади треугольника со сторонами a, b, c использовать формулу Герона:
-- S = √p·(p − a)·(p − b)·(p − c),
-- где p = (a + b + c)/2 — полупериметр
