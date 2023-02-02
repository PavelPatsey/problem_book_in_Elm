module Begin_09 exposing (..)

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
        [ div [] [ text "Неотрицательное число a : " ]
        , input [ placeholder "a = ", value model.a, onInput Change_a ] []
        , div [] [ text "Неотрицательное число b : " ]
        , input [ placeholder "b = ", value model.b, onInput Change_b ] []
        , div [] [ text "Корень из их произведения = " ]
        , div []
            [ text
                (String.fromFloat
                    (sqrt
                        (Maybe.withDefault 0 (String.toFloat model.a)
                            * Maybe.withDefault 0 (String.toFloat model.b)
                        )
                    )
                )
            ]
        ]



-- Begin9. Даны два неотрицательных числа a и b. Найти их среднее геометриче-
-- ское, то есть квадратный корень из их произведения: корень(a ⋅ b) .
