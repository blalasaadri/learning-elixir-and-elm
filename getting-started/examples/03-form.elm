module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Form.Input as Input


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL

type alias Model =
    { initial : Bool
    , tmp_name : String
    , tmp_password : String
    , tmp_passwordAgain : String
    , tmp_age : String
    , name : String
    , password : String
    , passwordAgain : String
    , age : String
    }


model : Model
model =
    Model True "" "" "" "" "" "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Age String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | tmp_name = name }

        Password password ->
            { model | tmp_password = password }

        PasswordAgain password ->
            { model | tmp_passwordAgain = password }

        Age age ->
            { model | tmp_age = age }

        Submit ->
            { model | initial = False, name = model.tmp_name, password = model.tmp_password, passwordAgain = model.tmp_passwordAgain, age = model.tmp_age }


-- VIEWS


view : Model -> Html Msg
view model =
    Grid.container []
        [ CDN.stylesheet -- creates an inline style node with the Bootstrap CSS
        , Grid.row []
            [ Grid.col []
                [ Input.text [ type_ "text", placeholder "Name", onInput Name ] []
                , Input.password [ type_ "password", placeholder "Password", onInput Password ] []
                ]
            ]

        ]
    {- div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Re-Enter Password", onInput PasswordAgain ] []
        , input [ type_ "text", placeholder "Age", onInput Age ] []
        , button [ onClick Submit ] [ text "Submit" ]
        , viewValidation model
        ] -}

type ValidationResult
 = Valid
 | Error String
 | Empty

viewValidation : Model -> Html msg
viewValidation model =
    let
        ( color, message ) =
            case validateInput model of
                Empty -> ("red", "")
                Valid -> ("green", "OK")
                Error error -> ("red", error)
    in
        div [ style [ ( "color", color ) ] ] [ text message ]

validateInput : Model -> ValidationResult
validateInput model =
    if model.initial then
        Empty
    else if model.password /= model.passwordAgain then
        Error "Passwords do not match!"
    else if String.length model.password <= 8 then
        Error "Passwords must have at least 9 characters"
    else
        case String.toInt model.age of
            Result.Ok age -> Valid
            Err error -> Error ("'" ++ model.age ++ "' is not a valid age")
