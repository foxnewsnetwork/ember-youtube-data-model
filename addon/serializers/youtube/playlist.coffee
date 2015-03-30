`import DS from 'ember-data'`
`import YoutubeSerializer from '../youtube'`
YoutubePlaylistSerializer = YoutubeSerializer.extend
  extractSingle: (store, type, payload, id, requestType) ->
    payload.id = id
    payload = @normalizePayload payload
    @handleEmbeddedVideos store, @normalize type, payload
    
  handleEmbeddedVideos: (store, payload)->
    type = store.modelFor "youtube/video"
    serializer = store.serializerFor type
    payload.videos = serializer.extractArray store, type, payload.videos
    payload

  extractArray: (store, type, {items: payloads}, id, requestType) ->
    throw new Error "not implemented"

  normalizeRelationships: (type, payload) ->
    payload.videos = payload.items
    delete payload.items
    payload
        

`export default YoutubePlaylistSerializer`
