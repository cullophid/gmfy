module.exports = (url) ->
  switch url
    when '' then '#/'
    when '#' then '#/'
    when _ then url
