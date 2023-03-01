module Begin_22.Begin_22_v4_model_string exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


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
    = ChangeA String
    | ChangeB String
    | ChangeAB


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeA newA ->
            { model | a = newA }

        ChangeB newB ->
            { model | b = newB }

        ChangeAB ->
            { model | a = model.b, b = model.a }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text "A = "
        , input [ placeholder "A = ", value model.a, onInput ChangeA ] []
        , div [] []
        , text "B = "
        , input [ placeholder "B = ", value model.b, onInput ChangeB ] []
        , div [] []
        , button [ onClick ChangeAB ] [ text "Поменять местами содержимое переменных A и B" ]
        , div [] [ text ("A = " ++ model.a) ]
        , div [] [ text ("B = " ++ model.b) ]
        ]



-- Begin22. Поменять местами содержимое переменных A и B и вывести новые
-- значения A и B.
