module Main exposing (..)

import Html exposing ( Html, button, div, text, br )
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid

main =
    Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model = Int

model : Model
model = 0

-- UPDATE

type Msg = Increment | Decrement | Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment -> model + 1
    Decrement -> model - 1
    Reset -> 0

-- VIEW

mainContent : Model -> Html Msg
mainContent model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        , br [] []
        , button [ onClick Reset ] [ text "Reset" ]
        ]

navbar : Model -> Html Msg
navbar model =
    div 
        [ style
            [ ("backgroundColor", "azure")
            , ("text-align", "center")
            ]
        ] [
            text (toString model)
        ]

view : Model -> Html Msg
view model =
    Grid.container []         -- Responsive fixed width container
        [ CDN.stylesheet      -- Inlined Bootstrap CSS for use with reactor
        , navbar model        -- Interactive and responsive menu
        , mainContent model
        ]

