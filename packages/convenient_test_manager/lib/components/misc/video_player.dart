import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String videoPath;

  const VideoPlayer({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
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
    super.dispose();
  }

  void _init() {
    TODO;
  }

  void _deInit() {
    TODO;
  }

  @override
  Widget build(BuildContext context) {
    return TODO;
  }
}
