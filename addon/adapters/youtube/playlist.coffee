`import YoutubeAdapter from '../youtube'`

YoutubePlaylistAdapter = YoutubeAdapter.extend
  generateQueryParams: (type, id, snapshot) ->
    $.param 
      playlistId: id
      part: @partsForType type
      fields: @fieldsForType type
      key: @key

  prepareType: (type) ->
    "playlistItems"

`export default YoutubePlaylistAdapter`
