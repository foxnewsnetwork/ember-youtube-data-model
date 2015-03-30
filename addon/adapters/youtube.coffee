`import Ember from 'ember'`
`import DS from 'ember-data'`

map = Ember.EnumerableUtils.map

stringifyHashes = (possiblyHash) ->
  return possiblyHash if typeof possiblyHash is "string"
  map possiblyHash, (array, key) -> "#{key}=(#{array.join ','})"
  .join ","
encodeURIFields = (fields) ->
  encodeURIParts fields.map(stringifyHashes).join(",")
encodeURIParts = (parts) ->
  return parts if typeof parts is "string"
  encodeURIComponent parts.join ","

YoutubeAdapter = DS.RESTAdapter.extend
  key: "AIzaSyBtlHwEEjyr02QjWEHwXk9u4r_ANRRrlOk"
  host: "https://www.googleapis.com"
  namespace: "youtube/v3"
  defaultSerializer: '-youtube'

  prepareType: (type) ->
    Ember.String.pluralize type.replace("youtube/", "")

  buildURL: (type, id, snapshot) ->
    url = [@host, @namespace, @prepareType type].join "/"
    queryparams = @generateQueryParams type, id, snapshot
    [url, queryparams].join "?"
  
  generateQueryParams: (type, id, snapshot) ->
    $.param switch type
      when "youtube/channel"
        forUsername: id
        part: @partsForType type
        fields: @fieldsForType type
        key: @key
      when "youtube/playlist"
        playlistId: id
        part: @partsForType type
        fields: @fieldsForType type
        key: @key
      else throw new Error "I don't know how to handle #{type}"

  createRecord: (store, type, snapshot) ->
    throw new Error "not implemented"

  fieldsForType: (type) ->
    encodeURIFields switch type
      when "youtube/channel"
        [
          item: ["contentDetails", "id", "snippet"]
          "nextPageToken"
          "pageInfo"
          "prevPageToken"
          "tokenPagination"
        ]
      when "youtube/playlist"
        [
          item: ["contentDetails", "id", "snippet"]
          "nextPageToken"
          "pageInfo"
          "prevPageToken"
          "tokenPagination"
        ]
      else throw new Error "I don't know the fields for #{type}"

  partsForType: (type) ->
    encodeURIParts switch type
      when "youtube/channel" then ["id", "snippet", "contentDetails"]
      when "youtube/playlist" then ["id", "snippet", "contentDetails"]
      else throw new Error "I don't know what the parts are for #{type}"

`export default YoutubeAdapter`
