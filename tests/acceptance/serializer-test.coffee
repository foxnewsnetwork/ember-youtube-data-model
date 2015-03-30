`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`
`import Response from '../helpers/channel-response'`

application = null
container = null
module 'Acceptance: Serializer',
  beforeEach: ->
    application = startApp()
    container = application.__container__
    ###
    Don't return as Ember.Application.then is deprecated.
    Newer version of QUnit uses the return value's .then
    function to wait for promises if it exists.
    ###
    return

  afterEach: ->
    Ember.run application, 'destroy'

test 'lookup', (assert) ->
  serializer = container.lookup("serializer:-youtube")
  store = container.lookup("store:main")
  assert.ok store
  assert.ok serializer

test 'Response', (assert) ->
  assert.ok Response

test '#extractSingle', (assert) ->
  serializer = container.lookup("serializer:-youtube")
  store = container.lookup("store:main")
  type = container.lookupFactory("model:youtube/channel")
  id = "teamcoco"
  requestType = "single"
  object = serializer.extract store, type, Response, id, requestType
  assert.ok object
  assert.ok object.id