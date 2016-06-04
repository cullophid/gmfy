module Util where
import String

addId : {a | title : String, id: String} -> {a | title : String, id: String}
addId r =
  {r | id = makeId r.title}

makeId : String -> String
makeId string =
  String.join "-" <| String.split " " <| String.toLower string
