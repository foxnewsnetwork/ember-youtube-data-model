`import Ember from 'ember'`
`import DS from 'ember-data'`
`import { lll, merge } from '../utils/hash'`

YoutubeAdapter = DS.RESTAdapter.extend
  key: null
  host: "https://www.googleapis.com"
  namespace: "youtube/v3"
  defaultSerializer: '-youtube'

  find: (store, type, id, snapshot) ->
    data = @buildUrlOptions
      typeKey: type.typeKey
      id: id
      snapshot: snapshot
    uri = @buildURL type
    @ajax uri, 'GET', data: data

  findAll: (store, type, sinceToken) ->
    data = @buildUrlOptions
      typeKey: type.typeKey
      sinceToken: sinceToken
    uri = @buildURL type
    @ajax uri, 'GET', data: data

  findQuery: (store, type, query) ->
    data = @buildUrlOptions
      typeKey: type.typeKey
      hash: query
    uri = @buildURL type
    @ajax uri, 'GET', data: data

  prepareType: (type) ->
    Ember.String.pluralize type.replace("youtube/", "")

  buildURL: (type, id, snapshot) ->
    [@host, @namespace, @prepareType type.typeKey].join "/"

  buildUrlOptions: ({typeKey, id, snapshot, sinceToken, hash}) ->
    hash ?= {}
    merge @generateQueryParams typeKey, id, snapshot
    .into hash
  
  generateQueryParams: (type, id, snapshot) ->
    throw new Error "missing API key on YoutubeAdapter" unless @key
    part: @partsForType
    fields: @fieldsForType
    key: @key

  createRecord: (store, type, snapshot) ->
    throw new Error "not implemented"

  partsForType: ["id", "snippet", "contentDetails"].join ","
    
  fieldsForType: [
    "items(contentDetails,id,snippet)"
    "nextPageToken"
    "pageInfo"
    "prevPageToken"
    "tokenPagination"
  ].join ","

`export default YoutubeAdapter`
