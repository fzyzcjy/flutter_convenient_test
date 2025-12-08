import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

typedef ImageDecoderBuilder<Tag> =
    Widget Function(BuildContext context, TaggedImageInfo<Tag>? info);

class ImageDecoderWidget<Tag> extends StatefulWidget {
  const ImageDecoderWidget({
    super.key,
    required this.imageProvider,
    required this.builder,
    this.onError,
    this.onUiImage,
  });

  // ignore: unnecessary-nullable
  static Widget maybe<Tag>({
    required TaggedImageProvider<Tag>? imageProvider,
    required ImageDecoderBuilder<Tag> builder,
    ImageErrorListener? onError,
  }) => Builder(
    builder: (context) => imageProvider == null
        ? builder(context, null)
        : ImageDecoderWidget(
            imageProvider: imageProvider,
            onError: onError,
            builder: builder,
          ),
  );

  // NOTE XXX
  final TaggedImageProvider<Tag> imageProvider;

  final ImageDecoderBuilder<Tag> builder;

  // NOTE XXX add
  final ImageErrorListener? onError;

  // NOTE XXX add
  final void Function(ui.Image? image)? onUiImage;

  @override
  State<ImageDecoderWidget<Tag>> createState() =>
      _ImageDecoderWidgetState<Tag>();
}

class _ImageDecoderWidgetState<Tag> extends State<ImageDecoderWidget<Tag>> {
  _ImageStreamWithListener? _imageStreamWithListener; // NOTE XXX 同时保存listener
  TaggedImageInfo<Tag>? _imageInfo; // NOTE XXX 同时保存tag

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We call _getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    _getImage();
  }

  @override
  void didUpdateWidget(ImageDecoderWidget<Tag> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) {
      _getImage();
    }
  }

  void _getImage() {
    final interestImageProvider = widget.imageProvider;
    final oldImageStreamWithListener = _imageStreamWithListener;
    _imageStreamWithListener = _ImageStreamWithListener(
      interestImageProvider.inner.resolve(
        createLocalImageConfiguration(context),
      ),
      ImageStreamListener(
        (imageInfo, synchronousCall) => _updateImage(
          imageInfo,
          synchronousCall,
          imageProviderTag: interestImageProvider.tag,
        ),
        // NOTE XXX add
        onError: widget.onError,
      ),
    );

    if (oldImageStreamWithListener != null) {
      oldImageStreamWithListener.inner.removeListener(
        oldImageStreamWithListener.listener,
      );
    }
    _imageStreamWithListener!.inner.addListener(
      _imageStreamWithListener!.listener,
    );

    // NOTE XXX edit
    // if (_imageStream!.key != oldImageStream?.key) {
    //   // If the keys are the same, then we got the same image back, and so we don't
    //   // need to update the listeners. If the key changed, though, we must make sure
    //   // to switch our listeners to the new image stream.
    //   final ImageStreamListener listener = ImageStreamListener(_updateImage);
    //   oldImageStream?.removeListener(listener);
    //   _imageStream!.addListener(listener);
    // }
  }

  void _updateImage(
    ImageInfo imageInfo,
    bool synchronousCall, {
    required Tag imageProviderTag,
  }) {
    // print('hi _updateImage imageInfo=$imageInfo');
    setState(() {
      // Trigger a build whenever the image changes.
      // NOTE MODIFIED 推迟dispose #5256
      // _imageInfo?.inner.dispose();
      final oldImageInfo = _imageInfo;
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => oldImageInfo?.inner.dispose(),
      );
      _imageInfo = TaggedImageInfo(
        imageInfo,
        imageProviderTag: imageProviderTag,
      );
      widget.onUiImage?.call(_imageInfo?.inner.image); // NOTE XXX add
    });
  }

  @override
  void dispose() {
    // _imageStream?.removeListener(ImageStreamListener(_updateImage)); // NOTE XXX
    if (_imageStreamWithListener != null) {
      _imageStreamWithListener!.inner.removeListener(
        _imageStreamWithListener!.listener,
      );
    }
    _imageInfo?.inner.dispose();
    _imageInfo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _imageInfo);
  }
}

// NOTE XXX add
@immutable
class TaggedImageInfo<Tag> {
  final ImageInfo inner;
  final Tag imageProviderTag;

  const TaggedImageInfo(this.inner, {required this.imageProviderTag});

  @override
  String toString() =>
      'TaggedImageInfo(inner: $inner, imageProviderTag: $imageProviderTag)';
}

@immutable
class TaggedImageProvider<Tag> {
  final ImageProvider inner;
  final Tag tag;

  const TaggedImageProvider(this.inner, {required this.tag});

  static TaggedImageProvider<Tag>? maybe<Tag>(
    ImageProvider? inner, {
    required Tag tag,
  }) => inner == null ? null : TaggedImageProvider(inner, tag: tag);

  static TaggedImageProvider<Object?> noTag(ImageProvider inner) =>
      TaggedImageProvider(inner, tag: null);
}

@immutable
class _ImageStreamWithListener {
  final ImageStream inner;
  final ImageStreamListener listener;

  const _ImageStreamWithListener(this.inner, this.listener);
}
