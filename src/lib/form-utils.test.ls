test = require 'tape'
sinon = require 'sinon'
{formOnInput} = require './form-utils'


test 'form-utils/formOnInput should dispatch a setFormField action', (t) ->
  t.plan 2
  dispatch = sinon.spy()
  formOnInput dispatch, 'form', 'field', target: value: 'value'
  t.equal dispatch.calledOnce, true
  expected = [
    [ 'SET_FORM_FIELD'
      {
        form: 'form'
        field: 'field'
        value: 'value'
      }
    ]
  ]
  t.deepEqual dispatch.args[0], expected

test 'form-utils/formOnInput should be curried', (t) ->
  t.plan 2
  dispatch = sinon.spy()
  formOnInput dispatch, 'form', 'field', target: value: 'value'
  t.equal dispatch.calledOnce, true
  expected = [
    [ 'SET_FORM_FIELD'
      {
        form: 'form'
        field: 'field'
        value: 'value'
      }
    ]
  ]
  t.deepEqual dispatch.args[0], expected
