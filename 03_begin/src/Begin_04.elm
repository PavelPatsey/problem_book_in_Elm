module Begin_04 exposing (..)

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
    { d : String
    }


init : Model
init =
    { d = ""
    }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change new_d ->
            { model | d = new_d }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Диаметр окружности d = " ]
        , input [ placeholder "d = ", value model.d, onInput Change ] []
        , div [] [ text "Длина окружности L = π·d = " ]
        , div []
            [ text
                (String.fromFloat
                    (calculate_circumference
                        (Maybe.withDefault 0
                            (String.toFloat model.d)
                        )
                    )
                )
            ]
        ]


calculate_circumference : Float -> Float
calculate_circumference d =
    3.14 * d



-- Begin4. Дан диаметр окружности d. Найти ее длину L = π·d.
-- В качестве значения π использовать 3.14.
