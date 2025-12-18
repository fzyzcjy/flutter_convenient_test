set -eux

# NOTE: need to install Dart plugin first. See https://pub.dev/packages/protoc_plugin
protoc --proto_path=. --dart_out=grpc:../lib/src/protobuf ./convenient_test.proto

dart format ../lib/src/protobuf --line-length 120