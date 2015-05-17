`import DS from 'ember-data'`

YoutubeVideo = DS.Model.extend
  title: DS.attr "string"
  description: DS.attr "string"
  thumbnails: DS.attr "thumbnails"
  position: DS.attr "number"
  publishedAt: DS.attr "date"


`export default YoutubeVideo`
