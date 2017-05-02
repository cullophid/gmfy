module View.Gravatar exposing (gravatar)
import MD5
import Bulma.Elements exposing (image)

gravatarUrl email =
  "https://www.gravatar.com/avatar/" ++ (MD5.hex email)

gravatar classes email =
  image ("image-round " ++ classes) <| gravatarUrl email
