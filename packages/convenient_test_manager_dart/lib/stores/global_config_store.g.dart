// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_config_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GlobalConfigNullable _$$_GlobalConfigNullableFromJson(Map<String, dynamic> json) => _$_GlobalConfigNullable(
      isolationMode: json['isolationMode'] as bool?,
      enableReportSaver: json['enableReportSaver'] as bool?,
      goldenDiffGitRepo: json['goldenDiffGitRepo'] as String?,
    );

Map<String, dynamic> _$$_GlobalConfigNullableToJson(_$_GlobalConfigNullable instance) => <String, dynamic>{
      'isolationMode': instance.isolationMode,
      'enableReportSaver': instance.enableReportSaver,
      'goldenDiffGitRepo': instance.goldenDiffGitRepo,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalConfig on _GlobalConfig, Store {
  late final _$isolationModeAtom = Atom(name: '_GlobalConfig.isolationMode', context: context);

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

  late final _$enableReportSaverAtom = Atom(name: '_GlobalConfig.enableReportSaver', context: context);

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

  late final _$goldenDiffGitRepoAtom = Atom(name: '_GlobalConfig.goldenDiffGitRepo', context: context);

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

  @override
  String toString() {
    return '''
isolationMode: ${isolationMode},
enableReportSaver: ${enableReportSaver},
goldenDiffGitRepo: ${goldenDiffGitRepo}
    ''';
  }
}
