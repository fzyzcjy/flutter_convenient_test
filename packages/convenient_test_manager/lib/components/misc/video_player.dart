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

  double get playbackRate => _kPlaybackRates[playbackRateIndex];
  var playbackRateIndex = 0;

  static const _kPlaybackRates = [1.0, 0.2, 0.4];

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 8),
          _buildControlRow(),
          const SizedBox(height: 8),
          Expanded(
            child: Center(
              child: Video(
                player: player,
                playlistLength: 1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildPositionBar(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildControlRow() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            setState(() => playbackRateIndex = (playbackRateIndex + 1) % _kPlaybackRates.length);
            player.setRate(playbackRate);
          },
          child: Text('Speed ${playbackRate.toStringAsFixed(1)}x'),
        ),
      ],
    );
  }

  Widget _buildPositionBar() {
    return StreamBuilder<PositionState>(
      stream: player.positionStream,
      builder: (_, positionSnapshot) {
        final position = positionSnapshot.data ?? PositionState();

        return Row(
          children: [
            Text(_formatDuration(position.position ?? Duration.zero)),
            Expanded(
              child: Slider(
                value: position.position?.inMicroseconds.toDouble() ?? 0,
                min: 0,
                max: position.duration?.inMicroseconds.toDouble() ?? 0,
                onChanged: (microseconds) => player.seek(Duration(microseconds: microseconds.round())),
              ),
            ),
            Text(_formatDuration(position.duration ?? Duration.zero)),
          ],
        );
      },
    );
  }
}

// ignore: prefer_interpolation_to_compose_strings
String _formatDuration(Duration d) => (d.inMilliseconds / 1000).toStringAsFixed(2) + 's';
