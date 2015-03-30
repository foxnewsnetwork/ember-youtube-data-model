`import Ember from 'ember'`
`import DS from 'ember-data'`
`import YoutubeSerializer from '../youtube'`

map = Ember.EnumerableUtils.map

YoutubeVideoSerializer = YoutubeSerializer.extend
  normalizeId: (item) ->
    item.id = item.contentDetails.videoId
    delete item.contentDetails
    item

  normalizeAttributes: (type, item) ->
    item.title = item.snippet.title
    item.description = item.snippet.description
    item.thumbnails = item.snippet.thumbnails
    item.publishedAt = item.snippet.publishedAt
    item.position = item.snippet.position
    delete item.snippet
    item

  extractArray: (store, type, videos, id, requestType) ->
    map videos, (video) =>
      @extractSingle store, type, video, id, requestType

  extractSingle: (store, type, item, id, requestType) ->
    payload = @normalize type, item
    store.push(type.typeKey, payload)

    




`export default YoutubeVideoSerializer`
