module Begin_06 exposing (..)

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
    { a : String
    , b : String
    , c : String
    }


init : Model
init =
    { a = ""
    , b = ""
    , c = ""
    }



-- UPDATE


type Msg
    = Change_a String
    | Change_b String
    | Change_c String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change_a new_a ->
            { model | a = new_a }

        Change_b new_b ->
            { model | b = new_b }

        Change_c new_c ->
            { model | c = new_c }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Прямоугольный параллелепипед: " ]
        , div [] [ text "Длина ребра a = " ]
        , input [ placeholder "a = ", value model.a, onInput Change_a ] []
        , div [] [ text "Длина ребра b = " ]
        , input [ placeholder "b = ", value model.b, onInput Change_b ] []
        , div [] [ text "Длина ребра c = " ]
        , input [ placeholder "c = ", value model.c, onInput Change_c ] []
        , div [] [ text "Объем V = a·b·c = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculate_volume
                        ( Maybe.withDefault 0 (String.toFloat model.a)
                        , Maybe.withDefault 0 (String.toFloat model.b)
                        , Maybe.withDefault 0 (String.toFloat model.c)
                        )
                    )
                )
            ]
        , div [] [ text "Площадь поверхности S = 2·(a·b + b·c + a·c) = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculate_surface_area
                        ( Maybe.withDefault 0 (String.toFloat model.a)
                        , Maybe.withDefault 0 (String.toFloat model.b)
                        , Maybe.withDefault 0 (String.toFloat model.c)
                        )
                    )
                )
            ]
        ]


calculate_volume : ( Float, Float, Float ) -> Float
calculate_volume ( a, b, c ) =
    a * b * c


calculate_surface_area : ( Float, Float, Float ) -> Float
calculate_surface_area ( a, b, c ) =
    2 * (a * b + b * c + a * c)



-- Begin6. Даны длины ребер a, b, c прямоугольного параллелепипеда. Найти
-- его объем V = a·b·c и площадь поверхности S = 2·(a·b + b·c + a·c).
