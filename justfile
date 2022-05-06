pub-get:
    cd packages/convenient_test && flutter pub get
    cd packages/convenient_test/example && flutter pub get
    cd packages/convenient_test_common && flutter pub get
    cd packages/convenient_test_dev && flutter pub get
    cd packages/convenient_test_manager && flutter pub get

build-runner:
    cd packages/convenient_test_manager && flutter pub run build_runner build --delete-conflicting-outputs

format:
    cd packages/convenient_test && flutter format . --line-length 120
    cd packages/convenient_test/example && flutter format . --line-length 120
    cd packages/convenient_test_common && flutter format . --line-length 120
    cd packages/convenient_test_dev && flutter format . --line-length 120
    cd packages/convenient_test_manager && flutter format . --line-length 120

analyze:
    cd packages/convenient_test && flutter analyze
    cd packages/convenient_test/example && flutter analyze
    cd packages/convenient_test_common && flutter analyze
    cd packages/convenient_test_dev && flutter analyze
    cd packages/convenient_test_manager && flutter analyze

generate-gif:
    ffmpeg -y -i doc/videos/a_action_history.mov -r 24 doc/gif/a_action_history.gif
    ffmpeg -y -i doc/videos/b_time_travel_screenshot.mov -r 24 doc/gif/b_time_travel_screenshot.gif
    ffmpeg -y -i doc/videos/c_rapid_execute.mov -r 24 doc/gif/c_rapid_execute.gif
    ffmpeg -y -i doc/videos/d_video_record.mov -r 24 doc/gif/d_video_record.gif
    ffmpeg -y -i doc/videos/e_interactive.mov -r 24 doc/gif/e_interactive.gif

all: pub-get build-runner format analyze
