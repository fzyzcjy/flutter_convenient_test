import 'package:convenient_test_manager/components/misc/video_player.dart';
import 'package:convenient_test_manager/stores/video_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageVideoPanel extends StatelessWidget {
  const HomePageVideoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoStore = GetIt.I.get<VideoStore>();

    return Observer(builder: (_) {
      final displayVideoPath = videoStore.displayVideoInfo?.path;
      if (displayVideoPath == null) {
        return const Center(
          child: Text('No video or still recording'),
        );
      }

      return VideoPlayer(
        videoPath: displayVideoPath,
      );
    });
  }
}
