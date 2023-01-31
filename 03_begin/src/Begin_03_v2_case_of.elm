-- Begin3°. Даны стороны прямоугольника a и b. Найти его площадь S = a·b и
-- периметр P = 2·(a + b).


module Begin_03_v2_case_of exposing (..)

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
    }


init : Model
init =
    { a = ""
    , b = ""
    }



-- UPDATE


type Msg
    = Change_a String
    | Change_b String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change_a new_a ->
            { model | a = new_a }

        Change_b new_b ->
            { model | b = new_b }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Сторона прямоугольника а = " ]
        , input [ placeholder "а = ", value model.a, onInput Change_a ] []
        , div [] [ text "Сторона прямоугольника b = " ]
        , input [ placeholder "b = ", value model.b, onInput Change_b ] []
        , div [] [ text "Площадь прямоугольника S = " ]
        , div []
            [ text
                (String.fromInt
                    (begin_03
                        ( Maybe.withDefault 0 (String.toInt model.a)
                        , Maybe.withDefault 0 (String.toInt model.b)
                        , "area"
                        )
                    )
                )
            ]
        , div [] [ text "Периметр прямоугольника p = " ]
        , div []
            [ text
                (String.fromInt
                    (begin_03
                        ( Maybe.withDefault 0 (String.toInt model.a)
                        , Maybe.withDefault 0 (String.toInt model.b)
                        , "perimeter"
                        )
                    )
                )
            ]
        ]


begin_03 : ( Int, Int, String ) -> Int
begin_03 ( a, b, flag ) =
    case flag of
        "perimeter" ->
            2 * (a + b)

        "area" ->
            a * b

        _ ->
            0
