module Login exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Browser
import Html.Events exposing(onInput)

type alias User =
    { username : String
    , password : String
    , loggedIn : Bool
    }

-- MODEL

initialModel : User
initialModel =
    { username = ""
    , password = ""
    , loggedIn = False
    }

-- UPDATE

type Msg
    = Username String
    | Password String
    --| LoggedIn Bool

update : Msg -> User -> User
update msg model = 
    case msg of 
        Username username ->
            { model | username = username}

        Password password ->
            { model | password = password}

-- VIEW

view : User -> Html Msg
view model =
    div []
        [ h1 [] [ text "Login" ]
        , Html.form []
            [ div []
                [ text "Username"
                , input [ id "username", type_ "text" ] []
                ]
            , div []
                [ text "Password"
                , input [ id "password", type_ "password" ] []
                ]
            , div []
                [ button [ type_ "submit" ]
                    [ text "Sign In" ]
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