import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class StaticSectionListViewAdapter {
  List<StaticSection> get sections => _sections;
  final _sections = <StaticSection>[];

  StaticSectionListViewAdapter();

  void add(StaticSection section) => _sections.add(section);

  void addAll(Iterable<StaticSection> sections) => _sections.addAll(sections);

  int get itemCount => _countedSectionArrayView.length();

  Widget itemBuilder(BuildContext context, int index) {
    final info =
        _countedSectionArrayView.absoluteToRelativeIndex(absoluteIndex: index);
    return info.item1.builder(context, info.item2);
  }

  CountedArrayView<StaticSection> get _countedSectionArrayView =>
      CountedArrayView(arr: _sections, getCount: (s) => s.count);
}

class StaticSection {
  final int count;
  final IndexedWidgetBuilder builder;
  final Object? metadata;

  StaticSection({required this.count, required this.builder, this.metadata});

  StaticSection.single({required Widget child})
      : this(count: 1, builder: (context, index) => child);
}

typedef SeparatedSectionBuilder<T extends Enum> = Widget Function(
    BuildContext context, int relativeIndex, T sectionId);

class SeparatedSectionListViewAdapter<T extends Enum> {
  final List<T> sectionIds;
  final int Function(T sectionId) countGetter;

  SeparatedSectionListViewAdapter({
    required this.sectionIds,
    required this.countGetter,
  });

  int relativeToAbsoluteIndex(T sectionId, {required int relativeIndex}) {
    return _countedSectionArrayView.relativeToAbsoluteIndex(sectionId,
        relativeIndex: relativeIndex);
  }

  int get itemCount => _countedSectionArrayView.length();

  IndexedWidgetBuilder createItemBuilder(SeparatedSectionBuilder<T> builder) {
    return (context, index) {
      final info = _countedSectionArrayView.absoluteToRelativeIndex(
          absoluteIndex: index);
      return builder(context, info.item2, info.item1);
    };
  }

  CountedArrayView<T> get _countedSectionArrayView =>
      CountedArrayView(arr: sectionIds, getCount: countGetter);
}

@visibleForTesting
class CountedArrayView<T> {
  final List<T> arr;
  final int Function(T) getCount;

  CountedArrayView({required this.arr, required this.getCount});

  Tuple2<T, int> absoluteToRelativeIndex({required int absoluteIndex}) {
    var currSectionBeginIndex = 0;
    for (var i = 0; i < arr.length; ++i) {
      if (currSectionBeginIndex <= absoluteIndex &&
          currSectionBeginIndex + getCount(arr[i]) > absoluteIndex) {
        return Tuple2(arr[i], absoluteIndex - currSectionBeginIndex);
      }
      currSectionBeginIndex += getCount(arr[i]);
    }
    throw Exception(
        'indexCountedList see invalid index=$absoluteIndex (itemCount=${length()})');
  }

  int relativeToAbsoluteIndex(T section, {required int relativeIndex}) =>
      sectionStartIndex(section) + relativeIndex;

  int sectionStartIndex(T targetSection) {
    var currSectionBeginIndex = 0;
    for (final section in arr) {
      if (section == targetSection) return currSectionBeginIndex;
      currSectionBeginIndex += getCount(section);
    }
    throw Exception(
        'sectionStartIndex fail to find targetSection=$targetSection');
  }

  int length() => arr.map(getCount).fold(0, (a, b) => a + b);
}

abstract class StaticSectionBuilder {
  const StaticSectionBuilder();

  Iterable<StaticSection> build();
}
