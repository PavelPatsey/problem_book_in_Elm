module Begin_02 exposing (..)

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { content : String
    }


init : Model
init =
    { content = "" }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Сторона квадрата а = " ]
        , input [ placeholder "Text to reverse", value model.content, onInput Change ] []
        , div [] [ text "Площадь квадрата S = " ]
        , div [] [ text (String.fromInt (begin_02 (Maybe.withDefault 0 (String.toInt model.content)))) ]
        ]


begin_02 : Int -> Int
begin_02 a =
    a ^ 2
