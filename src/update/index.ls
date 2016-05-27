init =
  title: 'Hello World'
  location: '#'

module.exports = (state = init, [type, payload]) -->
  switch type
    when 'SET_TITLE' then {...state, title: payload}
    when 'SET_LOCATION' then {...state, location: payload}
    when _ then state
