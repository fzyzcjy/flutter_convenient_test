import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class VideoPlayerController with AttachableStateMixin<_VideoPlayerState> {
  static const _kTag = 'VideoPlayerController';

  Stream<Duration> get positionStream => _positionStreamController.stream;
  final _positionStreamController = StreamController<Duration>.broadcast();

  Future<void> seek(Duration position) async {
    Log.d(_kTag, 'seek position=$position');

    final state = states.singleOrNull;
    if (state == null) {
      Log.d(_kTag, 'seek skip since state==null');
      return;
    }

    state.player.seek(position);
  }

  void dispose() {
    _positionStreamController.close();
  }
}

class VideoPlayer extends StatefulWidget {
  final String videoPath;
  final Duration startTime;
  final Duration stopTime;
  final VideoPlayerController controller;

  const VideoPlayer({
    Key? key,
    required this.videoPath,
    required this.startTime,
    required this.stopTime,
    required this.controller,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  static const _kTag = 'VideoPlayerState';

  final player = Player(id: Random().nextInt(100000000));

  double get playbackRate => _kPlaybackRates[playbackRateIndex];
  var playbackRateIndex = 0;

  late final StreamSubscription<PositionState> _upstreamPositionListenerDisposer;

  static const _kPlaybackRates = [1.0, 0.2, 0.4];

  @override
  void initState() {
    super.initState();
    _init();

    _upstreamPositionListenerDisposer = player.positionStream.listen(_handleUpstreamPositionEvent);
  }

  void _handleUpstreamPositionEvent(PositionState e) {
    final position = e.position;
    if (position == null) {
      Log.d(_kTag, 'player.positionStream receive position==null thus do not forward to downstream');
      return;
    }

    widget.controller._positionStreamController.add(position);
  }

  @override
  void didUpdateWidget(covariant VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath) {
      _deInit();
      _init();
    }
    if (oldWidget.controller != widget.controller) {
      // should not happen
      throw Exception('Does not support change `controller` yet');
    }
  }

  @override
  void dispose() {
    _deInit();
    _upstreamPositionListenerDisposer.cancel();
    player.dispose();
    super.dispose();
  }

  void _init() {
    player.open(Media.file(
      File(widget.videoPath),
      startTime: widget.startTime,
      stopTime: widget.stopTime,
    ));
  }

  void _deInit() {
    // nothing yet
  }

  @override
  Widget build(BuildContext context) {
    return AttachableStateAttacherWidget(
      target: widget.controller,
      state: this,
      child: Padding(
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
        Expanded(child: Container()),
        TextButton(
          onPressed: _openExternally,
          child: const Text('Open Externally'),
        ),
      ],
    );
  }

  Future<void> _openExternally() async {
    // TODO add support for other platforms
    Log.i(_kTag, 'open externally start');
    final result = await Process.run('open', ['--reveal', widget.videoPath]);
    Log.i(_kTag, 'open externally end exitCode=${result.exitCode} stdout=${result.stdout} stderr=${result.stderr}');
  }

  Widget _buildPositionBar() {
    return StreamBuilder<PositionState>(
      stream: player.positionStream,
      builder: (_, positionSnapshot) {
        final position = positionSnapshot.data ?? PositionState();

        final sliderMax = position.duration?.inMicroseconds.toDouble() ?? 0;
        final sliderValue = (position.position?.inMicroseconds.toDouble() ?? 0).clamp(0.0, sliderMax);

        return Row(
          children: [
            Text(_formatDuration(position.position ?? Duration.zero)),
            Expanded(
              child: Slider(
                value: sliderValue,
                min: 0,
                max: sliderMax,
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
