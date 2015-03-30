`import DS from 'ember-data'`
`import Ember from 'ember'`

YoutubeChannel = DS.Model.extend
  title: DS.attr "string"
  description: DS.attr "string"
  thumbnails: DS.attr "thumbnails"
  publishedAt: DS.attr "date"  
  uploadId: DS.attr "string"
  uploads: Ember.computed "uploadId", ->
    return if Ember.isBlank @get "uploadId"
    @store.find "youtube/playlist", @get("uploadId")



`export default YoutubeChannel`
