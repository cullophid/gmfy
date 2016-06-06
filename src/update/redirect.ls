module.exports = (url) ->
  switch url
    when '' then '#/games'
    when '#' then '#/games'
    when '#/' then '#/games'
    when _ then url
