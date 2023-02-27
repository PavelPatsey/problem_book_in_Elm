module Begin_22.Begin_22_v2_ChangeAB_from_initial_values exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { a : Float
    , b : Float
    }


init : Model
init =
    { a = 2
    , b = 5
    }



-- UPDATE


type Msg
    = ChangeAB


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeAB ->
            { model | a = model.b, b = model.a }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text ("A = " ++ String.fromFloat model.a) ]
        , div [] [ text ("B = " ++ String.fromFloat model.b) ]
        , button [ onClick ChangeAB ] [ text "Поменять местами содержимое переменных A и B" ]
        ]



-- Begin22. Поменять местами содержимое переменных A и B и вывести новые
-- значения A и B.
