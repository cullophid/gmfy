module View.IconPicker exposing (render)

import Html exposing (Html, text)
import Bulma exposing (div)
import Bulma.Components exposing (modal, card, cardContent, modalWithClose)
import Bulma.Layout exposing (section, heading)
import Bulma.Elements exposing (button, image, title)
import Bulma.Grid exposing(columns, column)
import Icons

icon onSelect url=
  column "" [
    button "is-image" (onSelect url) [
      image "is-48x48" url
    ]
  ]


iconSection onSelect {category, icons} =
  section "" [
    heading "" [
      title "is-4" [text category]
    ],
      columns "is-multiline is-mobile" <| List.map (icon onSelect) icons
    ]


render : (String -> msg) -> Html msg
render onSelect =
  modal "" [
    card "" [
      cardContent "" <| List.map (iconSection onSelect) Icons.categories
    ]
  ]
