{Task} = require '../lib/monads'
noop = Task.of void

api = require './api'

module.exports = {
  ...api,
  noop
}
