module Begin_22 exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



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


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeA newA ->
            { model | a = Maybe.withDefault 0 (String.toFloat newA) }

        ChangeB newB ->
            { model | b = Maybe.withDefault 0 (String.toFloat newB) }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input
            [ placeholder "A = "
            , value (String.fromFloat model.a)
            , onInput ChangeA
            ]
            []
        , div []
            [ input [ placeholder "B = ", value (String.fromFloat model.b), onInput ChangeB ] []
            ]
        , div [] [ text (String.fromFloat model.b) ]
        , div [] [ text (String.fromFloat model.a) ]
        ]



-- Begin22. Поменять местами содержимое переменных A и B и вывести новые
-- значения A и B.
