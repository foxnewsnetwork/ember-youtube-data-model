`import Ember from 'ember'`
`import YoutubeAdapter from '../youtube'`

YoutubePlaylistAdapter = YoutubeAdapter.extend
  generateQueryParams: (type, id, snapshot) ->
    hash = @_super arguments...
    hash.playlistId = id
    hash.maxResults = 50
    hash

  prepareType: (type) ->
    "playlistItems"

`export default YoutubePlaylistAdapter`
