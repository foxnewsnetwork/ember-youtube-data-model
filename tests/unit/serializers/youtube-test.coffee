`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'serializer:youtube', 'YoutubeSerializer', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  serializer = @subject()
  assert.ok serializer
