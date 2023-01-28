module Begin_01 exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
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
    , div [] [ text "Периметр p = " ]
    , div [] [ text (String.fromInt (begin_1 (Maybe.withDefault 0 ( String.toInt model.content)))) ]
    ]

begin_1 : Int -> Int
begin_1 a =
  a * 4
