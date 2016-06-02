{log} = require '../util'
export set = (key, value) -->
  localStorage.setItem key, JSON.stringify value

export get = (key) ->
  try
    JSON.parse (log 'storage') localStorage.getItem key
  catch
    {}
