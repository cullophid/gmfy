module View.GamesList exposing (render)

import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (href, class)
import View.NewGame as NewGame

render {games, location, gameForm} =
  div [] [
    div [class "col-md-6 col-md-offset-3"] [
      div [class "row"] [
        div [class "list-group anim-list-stagger"]
          <| List.map listItem <| Debug.log "GAMES" games
      ]
    ],
    NewGame.render {location = location, gameForm = gameForm}
 ]


listItem : Game -> Html Msg
listItem {name, description, id} =
  div [class "list-group-item anim-from-left"] [
    a [href ("#/games/" ++ id ++ "/activities")] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-circle-o fa-3x"] []
        ],
        div [class "media-body"] [
          h3 [] [text name],
          p [] [text description]
        ]
      ]
    ]
  ]
