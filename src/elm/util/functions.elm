module Util.Functions where

composeAll fs = (List.foldl (<<) (\a -> a)) << List.map (\r -> r fs)
