`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`

application = null
container = null
adapter = null
store = null

module 'Acceptance: Channel + Playlist',
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

test 'Finding a channel', (assert) ->
  Ember.run ->
    store.find "channel", "teamcoco"
    .then (channel) ->
      assert.ok channel, "the channel should be found"
      assert.equal channel.get("title"), "Team Coco" 
      assert.equal channel.get("description"), "Conan O'Brien presents: the official YouTube channel for CONAN on TBS."
      assert.ok channel.get("thumbnails"), "thumbnails should be there"
      assert.equal channel.get("publishedAt"), "Sun Jun 22 2008 19:45:04 GMT-0700 (PDT)"
      assert.equal channel.get("uploadId"), "UUi7GJNg51C3jgmYTUwqoUXA"
    .catch (error) ->
      console.log error
      assert.ok false, "we should not get here"

test "Playlist", (assert) ->
  Ember.run ->
    store.find "playlist", "UUi7GJNg51C3jgmYTUwqoUXA"
    .then (playlist) ->
      console.log store.metadataFor "playlist"
      assert.ok playlist, "we should have a playlist"
      assert.equal playlist.get('videos.length'), 50, "we should have a bunch of videos"
    .catch (error) ->
      console.log error
      assert.ok false, "we should not get here"