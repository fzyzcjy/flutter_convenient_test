// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_config_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalConfigNullableImpl _$$GlobalConfigNullableImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalConfigNullableImpl(
      isolationMode: json['isolationMode'] as bool?,
      enableReportSaver: json['enableReportSaver'] as bool?,
      goldenDiffGitRepo: json['goldenDiffGitRepo'] as String?,
      runOnly: json['runOnly'] as String?,
      reportSavePath: json['reportSavePath'] as String?,
    );

Map<String, dynamic> _$$GlobalConfigNullableImplToJson(
        _$GlobalConfigNullableImpl instance) =>
    <String, dynamic>{
      'isolationMode': instance.isolationMode,
      'enableReportSaver': instance.enableReportSaver,
      'goldenDiffGitRepo': instance.goldenDiffGitRepo,
      'runOnly': instance.runOnly,
      'reportSavePath': instance.reportSavePath,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalConfig on _GlobalConfig, Store {
  late final _$isolationModeAtom =
      Atom(name: '_GlobalConfig.isolationMode', context: context);

  @override
  bool get isolationMode {
    _$isolationModeAtom.reportRead();
    return super.isolationMode;
  }

  @override
  set isolationMode(bool value) {
    _$isolationModeAtom.reportWrite(value, super.isolationMode, () {
      super.isolationMode = value;
    });
  }

  late final _$enableReportSaverAtom =
      Atom(name: '_GlobalConfig.enableReportSaver', context: context);

  @override
  bool get enableReportSaver {
    _$enableReportSaverAtom.reportRead();
    return super.enableReportSaver;
  }

  @override
  set enableReportSaver(bool value) {
    _$enableReportSaverAtom.reportWrite(value, super.enableReportSaver, () {
      super.enableReportSaver = value;
    });
  }

  late final _$goldenDiffGitRepoAtom =
      Atom(name: '_GlobalConfig.goldenDiffGitRepo', context: context);

  @override
  String? get goldenDiffGitRepo {
    _$goldenDiffGitRepoAtom.reportRead();
    return super.goldenDiffGitRepo;
  }

  @override
  set goldenDiffGitRepo(String? value) {
    _$goldenDiffGitRepoAtom.reportWrite(value, super.goldenDiffGitRepo, () {
      super.goldenDiffGitRepo = value;
    });
  }

  late final _$runOnlyAtom =
      Atom(name: '_GlobalConfig.runOnly', context: context);

  @override
  String? get runOnly {
    _$runOnlyAtom.reportRead();
    return super.runOnly;
  }

  @override
  set runOnly(String? value) {
    _$runOnlyAtom.reportWrite(value, super.runOnly, () {
      super.runOnly = value;
    });
  }

  late final _$reportSavePathAtom =
      Atom(name: '_GlobalConfig.reportSavePath', context: context);

  @override
  String? get reportSavePath {
    _$reportSavePathAtom.reportRead();
    return super.reportSavePath;
  }

  @override
  set reportSavePath(String? value) {
    _$reportSavePathAtom.reportWrite(value, super.reportSavePath, () {
      super.reportSavePath = value;
    });
  }

  @override
  String toString() {
    return '''
isolationMode: ${isolationMode},
enableReportSaver: ${enableReportSaver},
goldenDiffGitRepo: ${goldenDiffGitRepo},
runOnly: ${runOnly},
reportSavePath: ${reportSavePath}
    ''';
  }
}
