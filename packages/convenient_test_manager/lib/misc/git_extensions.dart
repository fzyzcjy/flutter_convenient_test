import 'dart:convert';
import 'dart:io';

class SimpleGit {
  final String directory;

  SimpleGit(this.directory);

  Future<List<String>> getDiff() async {
    final pr = await myRunGit(
      ['diff', '--name-only'],
      processWorkingDir: directory,
    );

    return (pr.stdout as String).split('\n').where((row) => row.isNotEmpty).toList();
  }

  Future<List<int>> show({required String ref, required String filePath}) async {
    final pr = await myRunGit(
      ['show', '$ref:$filePath'],
      processWorkingDir: directory,
    );

    return pr.stdout as List<int>;
  }
}

// NOTE MODIFIED from [runGit]
Future<ProcessResult> myRunGit(
  List<String> args, {
  bool throwOnError = true,
  String? processWorkingDir,
  Encoding? stdoutEncoding = systemEncoding,
  Encoding? stderrEncoding = systemEncoding,
}) async {
  final pr = await Process.run(
    'git',
    args,
    workingDirectory: processWorkingDir,
    runInShell: true,
    stdoutEncoding: stdoutEncoding,
    stderrEncoding: stderrEncoding,
  );

  if (throwOnError) {
    _throwIfProcessFailed(pr, 'git', args);
  }
  return pr;
}

void _throwIfProcessFailed(ProcessResult pr, String process, List<String> args) {
  if (pr.exitCode != 0) {
    final values = {'Standard out': pr.stdout.toString().trim(), 'Standard error': pr.stderr.toString().trim()}
      ..removeWhere((k, v) => v.isEmpty);

    String message;
    if (values.isEmpty) {
      message = 'Unknown error';
    } else if (values.length == 1) {
      message = values.values.single;
    } else {
      message = values.entries.map((e) => '${e.key}\n${e.value}').join('\n');
    }

    throw ProcessException(process, args, message, pr.exitCode);
  }
}
