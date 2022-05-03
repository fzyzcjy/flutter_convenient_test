set -eux

# NOTE: need to install Dart plugin first. See https://pub.dev/packages/protoc_plugin
protoc --proto_path=. --dart_out=grpc:../lib/src/protobuf ./test_tool.proto

