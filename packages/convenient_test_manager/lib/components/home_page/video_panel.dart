import 'dart:io';

import 'package:convenient_test_manager/components/misc/video_player.dart';
import 'package:convenient_test_manager/stores/video_player_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageVideoPanel extends StatelessWidget {
  const HomePageVideoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPlayerStore = GetIt.I.get<VideoPlayerStore>();

    return Observer(builder: (_) {
      final displayVideoPath = videoPlayerStore.activeVideo?.path;
      if (displayVideoPath == null) {
        return const Center(
          child: Text(
            'No selected video or still recording.\n'
            'Please tap the "play video" button of a test in the left panel.\n'
            // https://github.com/fzyzcjy/flutter_convenient_test/issues/217#issuecomment-1133922630
            'Remark: If your (toy) tests are too short, videos may not be recorded.',
          ),
        );
      } else if (Platform.isMacOS) {
        return const Center(
          child: Text('MacOS does not yet support video playback'),
        );
      }

      return VideoPlayer(
        videoPath: displayVideoPath,
        startTime: videoPlayerStore.displayRange.item1,
        stopTime: videoPlayerStore.displayRange.item2,
        controller: videoPlayerStore.mainPlayerController,
      );
    });
  }
}
