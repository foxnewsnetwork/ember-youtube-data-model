`import DS from 'ember-data'`

YoutubePlaylist = DS.Model.extend
  videos: DS.hasMany "youtube/video", embedded: true

`export default YoutubePlaylist`
