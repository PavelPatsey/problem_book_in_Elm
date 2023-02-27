module Begin_22.Begin_22_v3_ChangeAB_from_onInput exposing (..)

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


init : Model
init =
    { a = 0
    , b = 0
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
            { model | a = Maybe.withDefault 0 (String.toFloat newA) }

        ChangeB newB ->
            { model | b = Maybe.withDefault 0 (String.toFloat newB) }

        ChangeAB ->
            { model | a = model.b, b = model.a }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text "A = "
        , input
            [ placeholder "A = "
            , value (String.fromFloat model.a)
            , onInput ChangeA
            ]
            []
        , div [] []
        , text "B = "
        , input
            [ placeholder "B = "
            , value (String.fromFloat model.b)
            , onInput ChangeB
            ]
            []
        , div [] []
        , button [ onClick ChangeAB ] [ text "Поменять местами содержимое переменных A и B" ]
        , div [] [ text ("A = " ++ String.fromFloat model.a) ]
        , div [] [ text ("B = " ++ String.fromFloat model.b) ]
        ]



-- Begin22. Поменять местами содержимое переменных A и B и вывести новые
-- значения A и B.
