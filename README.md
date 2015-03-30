# Ember-youtube-data-model

Very, very, very light and minimal feature wrapper over youtube api/v3 (which I would *not* pay to use).

Ships with the following 3 models and associated adapters, serializers, and transform:

```coffee
# youtube/channel
YoutubeChannel = DS.Model.extend
  title: DS.attr "string"
  description: DS.attr "string"
  thumbnails: DS.attr "thumbnails"
  publishedAt: DS.attr "date"  
  uploadId: DS.attr "string"
  uploads: Ember.computed "uploadId", -> # your upload playlist
    return if Ember.isBlank @get "uploadId"
    @store.find "youtube/playlist", @get("uploadId")
```
TODO: add more generalized playlists to channel


```coffee
# youtube/playlist

YoutubePlaylist = DS.Model.extend
  videos: DS.hasMany "youtube/video", embedded: true
```

```coffee
# youtube/video
YoutubeVideo = DS.Model.extend
  title: DS.attr "string"
  description: DS.attr "string"
  thumbnails: DS.attr "thumbnails"
  position: DS.attr "number"
  publishedAt: DS.attr "date"
```

You'll need to setup your own API key onto the YoutubeAdapter, I will probably provide a blueprint installer to do this sometime in future, but I'm already sick and tired of working on youtube's horseshit api, so will put that off for another day. For now, probably write your own initializer and reopen the YoutubeAdapter to include something like:

```coffee
YoutubeAdapter.reopen
  key: 'ajfslasjdfoajsdlfjalsdkfjlkasdf'
```

After that, things should work, and you should be able to do things like:

```coffee
chan = store.find "youtube/channel", "teamcoco" # finds you Conan O'Brien's channel
chan.get("uploads.videos") # gets you the videos 
```

TODO: add pagination to hasMany to get more than 5 videos (lol)

## Installation

* `git clone` this repository
* `npm install`
* `bower install`

## Running

* `ember server`
* Visit your app at http://localhost:4200.

## Running Tests

* `ember test`
* `ember test --server`

## Building

* `ember build`

For more information on using ember-cli, visit [http://www.ember-cli.com/](http://www.ember-cli.com/).
