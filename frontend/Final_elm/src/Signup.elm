module Signup exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Browser
import Html.Events exposing(onInput)

type alias User =
    { name : String
    , email : String
    , username : String
    , password : String
    , passwordAgain : String
    , loggedIn : Bool
    }

-- MODEL

initialModel : User
initialModel =
    { name = ""
    , email = ""
    , username = ""
    , password = ""
    , passwordAgain = ""
    , loggedIn = False
    }

-- UPDATE

type Msg
    = Name String
    | Email String
    | Username String
    | Password String
    | PasswordAgain String
    --| LoggedIn Bool

update : Msg -> User -> User
update msg model = 
    case msg of 
        Name name ->
            { model | name = name}

        Email email ->
            { model | email = email}

        Username username ->
            { model | username = username}

        Password password ->
            { model | password = password}

        PasswordAgain password ->
            { model | passwordAgain = password}

-- VIEW

view : User -> Html Msg
view model =
    div []
        [ h1 [] [ text "Sign up" ]
        , Html.form []
            [ div []
                [ text "Name"
                , input [ id "name", type_ "text" ] []
                ]
            , div []
                [ text "Email"
                , input [ id "email", type_ "email" ] []
                ]
            , div []
                [ text "Username"
                , input [ id "username", type_ "text" ] []
                ]
            , div []
                [ text "Password"
                , input [ id "password", type_ "password" ] []
                ]
            , div []
                [ text "Re-enter Password"
                , input [ id "passwordAgain", type_ "password" ] []
                ]
            , div []
                [ button [ type_ "submit" ]
                    [ text "Create my account" ]
                ]
            ]
        ]

--main : Html msg
main =
    Browser.sandbox 
    {
        init = initialModel
        ,view = view
        ,update = update
    }