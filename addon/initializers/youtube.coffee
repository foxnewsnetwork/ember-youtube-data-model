# Takes two parameters: container and app
`import YoutubeAdapter from '../adapters/youtube'`
`import YoutubeSerializer from '../serializers/youtube'`
`import DS from 'ember-data'`

initialize = (ctn, app) ->
  app.register('adapter:-youtube', YoutubeAdapter)
  app.register('serializer:-youtube', YoutubeSerializer)
  DS.YoutubeAdapter = YoutubeAdapter
  DS.YoutubeSerializer = YoutubeSerializer

YoutubeInitializer =
  name: 'youtube'
  before: 'ember-data'
  initialize: initialize

`export {initialize}`
`export default YoutubeInitializer`
