`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'adapter:youtube', 'YoutubeAdapter', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  adapter = @subject()
  assert.ok adapter

test '#buildURL', (assert) ->
  adapter = @subject()
  url = adapter.buildURL "youtube/channel", "teamcoco"
  expected = "https://www.googleapis.com/youtube/v3/channels?forUsername=teamcoco&part=id%252Csnippet%252CcontentDetails&fields=%2CnextPageToken%2CpageInfo%2CprevPageToken%2CtokenPagination&key=AIzaSyBtlHwEEjyr02QjWEHwXk9u4r_ANRRrlOk"
  window.assert = assert
  assert.equal url, expected

