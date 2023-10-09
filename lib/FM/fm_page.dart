import 'dart:io' show Platform;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../Shared Preference/user_preference.dart';
import '../button.dart';
import '../custom_text.dart';
import 'audiomanager.dart';

class FMPage extends StatefulWidget {
  const FMPage({super.key});

  @override
  State<FMPage> createState() => _FMPageState();
}

class _FMPageState extends State<FMPage> {
  final AudioPlayerManager _audioPlayerManager = AudioPlayerManager();
  int? previousIndex;

  @override
  void initState() {
    super.initState();
    url = UserSimplePreferences.getFMURL() ?? "";

    print(' avsh$url');
  }

  List staticFmLink = [
    "https://dcs.megaphone.fm/LI9282413157.mp3?key=4f7c3d2b0c8b784721161ee127927ecc&request_event_id=4cf0e5fe-e715-44c0-ac43-70807bcc82f9",
    "http://old.rbn.org.np/public/admin/plugin/kcfinder/upload/files/Sadak%20surukshya%202079-03-05%281%29.mp3",
    "https://stream1.radionepal.gov.np/live/",
    "https://radio-broadcast.ekantipur.com/stream/",
  ];

  List staticFmName = [
    "Mega",
    "Old Run",
    "Radio Nepal",
    "eKantipur",
  ];
  var url;
  bool isNew = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          leading: GestureDetector(
              onTap: () {
                if (_audioPlayerManager.audioPlayer.playing) {
                  Get.dialog(
                    FMDialog(
                      onNoTap: () {
                        _audioPlayerManager.audioPlayer.stop();
                        _audioPlayerManager.dispose();
                        UserSimplePreferences.removeFM();
                        Get.back();
                        Get.back();
                      },
                      onOkTap: () {
                        Get.back();
                        Get.back();
                      },
                    ),
                    barrierDismissible: false,
                    barrierColor: Colors.black.withOpacity(0.7),
                  );
                } else {
                  Get.back();
                  _audioPlayerManager.dispose();
                  UserSimplePreferences.removeFM();
                }
              },
              child: Icon(
                Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              )),
          centerTitle: true,
          elevation: 0,
          title: GestureDetector(
            onTap: () {
              var npe = _audioPlayerManager.audioPlayer.playing;
              print(npe);
            },
            child: CustomText(
              text: "FM Station",
              color: Colors.white,
              weight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (_audioPlayerManager.audioPlayer.playing) {
              Get.dialog(
                FMDialog(
                  onNoTap: () {
                    _audioPlayerManager.audioPlayer.stop();
                    _audioPlayerManager.dispose();
                    UserSimplePreferences.removeFM();
                    Get.back();
                    Get.back();
                  },
                  onOkTap: () {
                    Get.back();
                    Get.back();
                  },
                ),
                barrierDismissible: false,
                barrierColor: Colors.black.withOpacity(0.7),
              );
            } else {
              Get.back();
              _audioPlayerManager.dispose();
              UserSimplePreferences.removeFM();
            }
            return false;
          },
          child: Column(
            children: [
              ListView.builder(
                  itemCount: staticFmLink.length,
                  shrinkWrap: true,
                  //state.staticFmLink!.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        ListTile(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          visualDensity: const VisualDensity(vertical: -2),
                          contentPadding: const EdgeInsets.only(
                              top: 12, right: 20, left: 20, bottom: 12),
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 0),
                                  color: Colors.blue,
                                  child: Icon(
                                      Icons.playlist_add_check_circle_sharp))),
                          title: CustomText(
                            //text: 'Nepal Police',
                            text: staticFmName[index],
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 14,
                          ),
                          trailing: StreamBuilder<PlayerState>(
                              stream: _audioPlayerManager
                                  .audioPlayer.playerStateStream,
                              builder: (context, snapshot) {
                                final playerState = snapshot.data;
                                // final processingState =
                                //     playerState?.processingState;
                                final playing = playerState?.playing;
                                return GestureDetector(
                                  onTap: () {
                                    previousIndex = index;
                                    setState(() {});
                                    if ((playing ?? false)) {
                                      if (url != staticFmLink[index]) {
                                        _audioPlayerManager.audioPlayer
                                            .setAudioSource(AudioSource.uri(
                                                Uri.parse(staticFmLink[index]),
                                                tag: MediaItem(
                                                  id: index.toString(),

                                                  title: staticFmName[index],

                                                  // title: 'Nepal Police',
                                                )));
                                        url = staticFmLink[index];
                                        _audioPlayerManager.audioPlayer.play();
                                        isNew = true;
                                        UserSimplePreferences.setFMURL(url);
                                      } else {
                                        print('kav');
                                        _audioPlayerManager.audioPlayer.pause();
                                        isNew = true;
                                      }
                                    } else if (_audioPlayerManager
                                            .audioPlayer.playing ==
                                        false) {
                                      if (url != staticFmLink[index]) {
                                        _audioPlayerManager.audioPlayer
                                            .setAudioSource(AudioSource.uri(
                                                Uri.parse(staticFmLink[index]),
                                                tag: MediaItem(
                                                  id: index.toString(),

                                                  title: staticFmName[index],
                                                  //title: 'Nepal Police',
                                                )));
                                        url = staticFmLink[index];
                                        _audioPlayerManager.audioPlayer.play();
                                        UserSimplePreferences.setFMURL(url);
                                        isNew = true;
                                        print('A');
                                      } else if (url == staticFmLink[index]) {
                                        _audioPlayerManager.audioPlayer.play();
                                        print('NC');
                                      } else if (url == "" || isNew == false) {
                                        _audioPlayerManager.audioPlayer
                                            .setAudioSource(AudioSource.uri(
                                                Uri.parse(staticFmLink[index]),
                                                tag: MediaItem(
                                                  id: index.toString(),
                                                  title: staticFmName[index],
                                                  // title: 'Nepal Police',
                                                )));
                                        url = staticFmLink[index];
                                        _audioPlayerManager.audioPlayer.play();
                                        UserSimplePreferences.setFMURL(url);
                                        isNew = true;
                                        print('B');
                                      } else {
                                        _audioPlayerManager.audioPlayer.play();
                                        print('C');
                                      }
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      url == staticFmLink[index]
                                          ? playing == true
                                              ? Icons.pause
                                              : Icons.play_arrow
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}

class FMDialog extends StatelessWidget {
  const FMDialog({
    super.key,
    required this.onOkTap,
    required this.onNoTap,
  });

  final onOkTap;
  final onNoTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 1.5),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_sharp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomText(
                          text: 'Do you wish to keep playing FM on background?',
                          color: Colors.grey,
                          weight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CustomText(
                    text:
                        'Note: Playing FM on background may reduce the battery.',
                    color: Colors.grey,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SignUpButton(
                        title: 'No',
                        onPress: onNoTap,
                      )),
                      SizedBox(width: 8),
                      Expanded(
                          child: LoginButton(
                        text: 'Yes',
                        color: Colors.blue,
                        onPress: onOkTap,
                      )),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
