import YoutubeAdapter from './adapters/youtube';
import YoutubeChannelAdapter from './adapters/youtube/channel';
import YoutubePlaylistAdapter from './adapters/youtube/playlist';
import YoutubeSerializer from './serializers/youtube';
import YoutubeChannelSerializer from './serializers/youtube/channel';
import YoutubePlaylistSerializer from './serializers/youtube/playlist';
import YoutubeVideoSerializer from './serializers/youtube/video';
import YoutubeChannel from './models/youtube/channel';
import YoutubePlaylist from './models/youtube/playlist';
import YoutubeVideo from './models/youtube/video';
import ThumbnailsTransform from './transforms/thumbnails';

var EYDM = {
  YoutubeAdapter: YoutubeAdapter,
  YoutubeChannelAdapter: YoutubeChannelAdapter,
  YoutubePlaylistAdapter: YoutubePlaylistAdapter,
  YoutubeSerializer: YoutubeSerializer,
  YoutubeChannelSerializer: YoutubeChannelSerializer,
  YoutubePlaylistSerializer: YoutubePlaylistSerializer,
  YoutubeVideoSerializer: YoutubeVideoSerializer,
  YoutubeChannel: YoutubeChannel,
  YoutubePlaylist: YoutubePlaylist,
  YoutubeVideo: YoutubeVideo,
  ThumbnailsTransform: ThumbnailsTransform
};

export default EYDM;
export {
  EYDM,
  YoutubeAdapter,
  YoutubeChannelAdapter,
  YoutubePlaylistAdapter,
  YoutubeSerializer,
  YoutubeChannelSerializer,
  YoutubePlaylistSerializer,
  YoutubeVideoSerializer,
  YoutubeChannel,
  YoutubePlaylist,
  YoutubeVideo,
  ThumbnailsTransform
};