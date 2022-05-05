import 'dart:io';
import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String videoPath;

  const VideoPlayer({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final player = Player(id: Random().nextInt(100000000));

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath) {
      _deInit();
      _init();
    }
  }

  @override
  void dispose() {
    _deInit();
    player.dispose();
    super.dispose();
  }

  void _init() {
    player.open(Media.file(File(widget.videoPath)));
  }

  void _deInit() {
    // nothing yet
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Video(
        player: player,
        playlistLength: 1,
      ),
    );
  }
}
