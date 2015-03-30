`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`
`import ajaxMocker from '../helpers/ajax-mocker'`
`import YoutubeAdapter from 'ember-youtube-data-model/adapters/youtube'`

application = null
container = null
adapter = null
store = null

ajaxMocker YoutubeAdapter

module 'Acceptance: Adapter',
  beforeEach: ->
    application = startApp()
    container = application.__container__
    adapter = container.lookup("adapter:-youtube")
    store = container.lookup("store:main")
    ###
    Don't return as Ember.Application.then is deprecated.
    Newer version of QUnit uses the return value's .then
    function to wait for promises if it exists.
    ###
    return

  afterEach: ->
    Ember.run application, 'destroy'

test 'adapter.ajax', (assert) ->
  window.adapter = adapter
  adapter.ajax().then (response) ->
    assert.ok response
    assert.ok response.pageInfo
    assert.ok response.items

test 'proper registration', (assert) ->
  adp = store.adapterFor "youtube/channel"
  adp2 = container.lookup("adapter:youtube/channel")
  assert.equal adp.constructor, adp2.constructor

test "#find", (assert) ->
  Ember.run ->
    store.find "youtube/channel", "teamcoco"
    .then (channel) ->
      assert.ok channel
      assert.equal channel.get("title"), "Team Coco"
      assert.equal channel.get("description"), "Conan O'Brien presents: the official YouTube channel for CONAN on TBS."
      channel.get("uploads")
    .then (playlist) ->
      assert.ok playlist
      assert.ok playlist.get("videos")
      assert.equal playlist.get("videos.length"), 5
      