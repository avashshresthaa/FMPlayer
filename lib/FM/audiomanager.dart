import 'package:just_audio/just_audio.dart';

// class AudioPlayerManager {
//   static final AudioPlayerManager _instance = AudioPlayerManager._internal();

//   factory AudioPlayerManager() {
//     return _instance;
//   }

//   final AudioPlayer _audioPlayer = AudioPlayer();

//   AudioPlayer get audioPlayer => _audioPlayer;

//   AudioPlayerManager._internal();
// }

class AudioPlayerManager {
  static final AudioPlayerManager _instance = AudioPlayerManager._internal();

  factory AudioPlayerManager() {
    return _instance;
  }

  AudioPlayer? _audioPlayer;

  AudioPlayer get audioPlayer {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayer();
    }
    return _audioPlayer!;
  }

  void dispose() {
    _audioPlayer?.dispose();
    _audioPlayer = null;
  }

  AudioPlayerManager._internal();
}
