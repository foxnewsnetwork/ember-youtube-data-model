`import DS from 'ember-data'`

ThumbnailsTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized

  serialize: (deserialized) ->
    deserialized

`export default ThumbnailsTransform`
