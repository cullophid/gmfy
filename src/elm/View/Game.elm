module View.Game exposing (render)
import Html exposing (div, a, h3, p, text)
import Html.Attributes exposing (class, href)


render {id, name, description} =
  div [ class "list-group-item anim-from-left"]
    [ a [href ("#/games/" ++ id)]
        [ div [class "media"]
            [ div [class "media-left"]
                [ div [class "fa fa-circle-o fa-x3"] []
                ]
            , div [class "media-body"]
                [ h3 [] [text name]
                , p [] [text description]
                ]
            ]
        ]
    ]
