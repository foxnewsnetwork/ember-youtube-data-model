`import YoutubeAdapter from '../youtube'`

YoutubeChannelAdapter = YoutubeAdapter.extend
  generateQueryParams: (type, id, snapshot) ->
    hash = @_super arguments...
    hash.forUsername = id
    hash
    

`export default YoutubeChannelAdapter`
