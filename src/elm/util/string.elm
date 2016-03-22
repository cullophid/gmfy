module Util.String where
import String

toInt : String -> Maybe Int
toInt str =
  case String.toInt str of
    Ok v -> Just v
    _ -> Nothing
