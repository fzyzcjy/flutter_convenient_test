import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/video_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

class HomePageVideoPanel extends StatelessWidget {
  const HomePageVideoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoStore = GetIt.I.get<VideoStore>();

    return Observer(builder: (_) {
      final displayVideoPath = videoStore.displayVideoPath;
      if (displayVideoPath == null) {
        return const Center(
          child: Text('No video'),
        );
      }

      return _WrappedVideoPlayer(
        videoPath: displayVideoPath,
      );
    });
  }
}

class _WrappedVideoPlayer extends StatefulWidget {
  final String videoPath;

  const _WrappedVideoPlayer({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  @override
  _WrappedVideoPlayerState createState() => _WrappedVideoPlayerState();
}

class _WrappedVideoPlayerState extends State<_WrappedVideoPlayer> {
  static const _kTag = 'WrappedVideoPlayer';

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(_WrappedVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath) {
      _deInit();
      _init();
    }
  }

  @override
  void dispose() {
    _deInit();
    super.dispose();
  }

  Future<void> _init() async {
    final controller = VideoPlayerController.file(File(widget.videoPath));
    setState(() => _videoPlayerController = controller);

    await _videoPlayerController!.initialize();

    final aspectRatio = _videoPlayerController!.value.aspectRatio;
    Log.i(_kTag, 'aspectRatio=$aspectRatio');

    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        // NOTE aspectRatio
        aspectRatio: aspectRatio,
        autoPlay: false,
        looping: false,
        // 注意 CreateMetaDiscussionPage 的预览会用到本widget，所以要注意那边的UX
        showControlsOnInitialize: true,
        customControls: const MaterialControls(),
      );
    });
  }

  void _deInit() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();

    _chewieController = null;
    _videoPlayerController = null;
  }

  @override
  Widget build(BuildContext context) {
    const kPlaceholderHeight = 200.0;

    final videoPlayerController = _videoPlayerController;
    if (videoPlayerController == null || !videoPlayerController.value.isInitialized) {
      return Container(
        height: kPlaceholderHeight,
        color: Colors.grey.shade200,
      );
    }

    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: AspectRatio(
          aspectRatio: max(videoPlayerController.value.aspectRatio, 1 / 1),
          child: Chewie(
            controller: _chewieController!,
          ),
        ),
      ),
    );
  }
}
