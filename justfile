pub-get:
    cd packages/convenient_test && flutter pub get
    cd packages/convenient_test/example && flutter pub get
    cd packages/convenient_test_common && flutter pub get
    cd packages/convenient_test_common_dart && flutter pub get
    cd packages/convenient_test_dev && flutter pub get
    cd packages/convenient_test_manager && flutter pub get
    cd packages/convenient_test_manager_dart && flutter pub get

build-runner:
    cd packages/convenient_test_manager_dart && flutter pub run build_runner build --delete-conflicting-outputs
    cd packages/convenient_test_manager && flutter pub run build_runner build --delete-conflicting-outputs

format:
    dart format . --line-length 120

analyze:
    flutter analyze

generate_gif_args := '-vf "fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse"'

generate-gif:
    ffmpeg -y -i doc/videos/a_action_history.mov {{generate_gif_args}} doc/gif/a_action_history.gif
    ffmpeg -y -i doc/videos/b_time_travel_screenshot.mov {{generate_gif_args}} doc/gif/b_time_travel_screenshot.gif
    ffmpeg -y -i doc/videos/c_rapid_execute.mov {{generate_gif_args}} doc/gif/c_rapid_execute.gif
    ffmpeg -y -i doc/videos/d_video_record.mov {{generate_gif_args}} doc/gif/d_video_record.gif
    ffmpeg -y -i doc/videos/e_interactive.mov {{generate_gif_args}} doc/gif/e_interactive.gif

generate-4k:
     ffmpeg -i doc/videos/full_video.mov -vf scale=3018:2160 doc/videos/full_video_4k.mov

all: pub-get build-runner format analyze

publish_all:
    # NOTE: before publish, need to change some patches in README.md #15
    cp README.md README.md.bak
    sed -i '' 's,<!--README_VIDEO_REPLACEMENT_PLACEHOLDER_ONE-->,Click to watch it in [YouTube](https://www.youtube.com/watch?v=z-Hr_TSOpUQ):,g' README.md
    sed -i '' 's,<!--README_VIDEO_REPLACEMENT_PLACEHOLDER_TWO-->,[![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/images/youtube_screenshot.png)](https://www.youtube.com/watch?v=z-Hr_TSOpUQ),g' README.md
    (cd packages/convenient_test_common_dart && flutter pub publish --force --server=https://pub.dartlang.org)
    (cd packages/convenient_test_common && flutter pub publish --force --server=https://pub.dartlang.org)
    (cd packages/convenient_test && flutter pub publish --force --server=https://pub.dartlang.org)
    (cd packages/convenient_test_dev && flutter pub publish --force --server=https://pub.dartlang.org)
    cp README.md.bak README.md && rm README.md.bak

release old_version new_version:
    grep -q 'version: {{old_version}}' packages/convenient_test_common_dart/pubspec.yaml
    grep -q 'version: {{old_version}}' packages/convenient_test_common/pubspec.yaml
    grep -q 'version: {{old_version}}' packages/convenient_test/pubspec.yaml
    grep -q 'version: {{old_version}}' packages/convenient_test_dev/pubspec.yaml
    grep -q 'version: {{old_version}}' packages/convenient_test_manager/pubspec.yaml
    grep -q 'version: {{old_version}}' packages/convenient_test_manager_dart/pubspec.yaml
    grep -q '{{new_version}}' CHANGELOG.md

    sed -i '' 's/version: {{old_version}}/version: {{new_version}}/g' packages/convenient_test_common_dart/pubspec.yaml
    sed -i '' 's/version: {{old_version}}/version: {{new_version}}/g' packages/convenient_test_common/pubspec.yaml
    sed -i '' 's/version: {{old_version}}/version: {{new_version}}/g' packages/convenient_test/pubspec.yaml
    sed -i '' 's/version: {{old_version}}/version: {{new_version}}/g' packages/convenient_test_dev/pubspec.yaml
    sed -i '' 's/version: {{old_version}}/version: {{new_version}}/g' packages/convenient_test_manager/pubspec.yaml
    sed -i '' 's/version: {{old_version}}/version: {{new_version}}/g' packages/convenient_test_manager_dart/pubspec.yaml

    # just pub-get
    # just build-runner
    # just format

    git add --all
    git status && git diff --staged | grep ''
    git commit -m "bump from {{old_version}} to {{new_version}}"
    git push

    awk '/## {{new_version}}/{flag=1; next} /## {{old_version}}/{flag=0} flag' CHANGELOG.md | gh release create v{{new_version}} --notes-file "-" --draft --title v{{new_version}}
    echo 'A *DRAFT* release has been created. Please go to the webpage and really release if you find it correct.'
    open https://github.com/fzyzcjy/flutter_convenient_test/releases

    just publish_all
