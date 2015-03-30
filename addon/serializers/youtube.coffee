`import Ember from 'ember'`
`import DS from 'ember-data'`

YoutubeSerializer = DS.JSONSerializer.extend
  extractMeta: (store, type, payload) ->
    return unless payload?
    if payload.pageInfo?
      meta =
        totalResults: payload.pageInfo.totalResults
        resultsPerPage: payload.pageInfo.resultsPerPage
        nextPageToken: payload.nextPageToken
        prevPageToken: payload.prevPageToken
      store.setMetadataFor type, meta
      delete payload.pageInfo
      delete payload.nextPageToken
      delete payload.prevPageToken

  extractSingle: (store, type, {items: [payload,...]}, id, requestType) ->
    @_super store, type, payload, id, requestType

  extractArray: (store, type, {items: payloads}, id, requestType) ->
    @_super store, type, payloads, id, requestType

`export default YoutubeSerializer`
