pub-get:
    cd packages/convenient_test && flutter pub get
    cd packages/convenient_test_common && flutter pub get
    cd packages/convenient_test_dev && flutter pub get
    cd packages/convenient_test_manager && flutter pub get

build-runner:
    cd packages/convenient_test && flutter pub run build_runner watch --delete-conflicting-outputs
    cd packages/convenient_test_common && flutter pub run build_runner watch --delete-conflicting-outputs
    cd packages/convenient_test_dev && flutter pub run build_runner watch --delete-conflicting-outputs
    cd packages/convenient_test_manager && flutter pub run build_runner watch --delete-conflicting-outputs

format:
    cd packages/convenient_test && flutter format . --line-length 120
    cd packages/convenient_test_common && flutter format . --line-length 120
    cd packages/convenient_test_dev && flutter format . --line-length 120
    cd packages/convenient_test_manager && flutter format . --line-length 120

all: pub-get build-runner format
