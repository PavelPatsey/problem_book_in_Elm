module Begin_22.Begin_22_v2_ChangeAB_from_initial_values exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { a : Float
    , b : Float
    }


type alias Booster =
    { a : String
    , b : String
    }


init : Model
init =
    { a = 0
    , b = 0
    }



-- UPDATE


type Msg
    = ChangeAB
    | ChangeA String
    | ChangeB String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeAB ->
            { model | a = model.b, b = model.a }

        ChangeA newA ->
            { model | a = Maybe.withDefault 0 (String.toFloat newA) }

        ChangeB newB ->
            { model | b = Maybe.withDefault 0 (String.toFloat newB) }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input
                [ placeholder "A = ", value (String.fromFloat model.a) ]
                []
            ]
        , div []
            [ input [ placeholder "B = ", value (String.fromFloat model.b) ] []
            ]
        , button [ onClick Change ] [ text "Поменять местами содержимое переменных A и B" ]
        , div [] [ text ("A = " ++ String.fromFloat model.a) ]
        , div [] [ text ("B = " ++ String.fromFloat model.b) ]
        ]
view : Model -> Html Msg
view model =
    div []
        [ viewInput "text" "A = " model.a a
        , viewInput "text" "B = " model.b a
        , button [ onClick Change ] [ text "Поменять местами содержимое переменных A и B" ]
        , div [] [ text ("A = " ++ String.fromFloat model.a) ]
        , div [] [ text ("B = " ++ String.fromFloat model.b) ]
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []



-- Begin22. Поменять местами содержимое переменных A и B и вывести новые
-- значения A и B.
