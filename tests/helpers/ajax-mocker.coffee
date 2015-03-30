`import Ember from 'ember'`
`import ChannelResponse from './channel-response'`
`import PlaylistResponse from './playlist-response'`

inferTarget = (url) ->
  return "channel" if Ember.isBlank url
  return "playlist" if url.match /v3\/playlistItems/
  return "channel" if url.match /v3\/channels/

fakejax = (url, type, options) ->
  new Ember.RSVP.Promise (resolve) =>
    switch inferTarget url
      when "channel"
        Ember.run null, resolve, ChannelResponse
      when "playlist"
        Ember.run null, resolve, PlaylistResponse
      else throw new Error "I don't know how to handle #{url}"

ajaxMocker = (Adapter) ->
  Adapter.reopen
    ajax: fakejax

`export default ajaxMocker`
