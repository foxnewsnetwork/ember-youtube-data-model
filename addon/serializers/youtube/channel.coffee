`import DS from 'ember-data'`
`import YoutubeSerializer from '../youtube'`
`import Ember from 'ember'`

YoutubeChannelSerializer = YoutubeSerializer.extend
  normalizeAttributes: (type, item) ->
    item.title = item.snippet.title
    item.description = item.snippet.description
    item.thumbnails = item.snippet.thumbnails
    item.publishedAt = item.snippet.publishedAt
    item.uploadId = item.contentDetails.relatedPlaylists.uploads
    delete item.snippet
    delete item.contentDetails
    item


`export default YoutubeChannelSerializer`
