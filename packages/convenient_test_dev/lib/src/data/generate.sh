set -eux

path_icons_dart="$(dirname "$(which flutter)")"/../packages/flutter/lib/src/material/icons.dart

path_target="icon_name_info.dart"

{
  printf "const kIconNameInfo = {\n"
  grep 'static const IconData' "$path_icons_dart" | awk -F'[ (,]' '{print "  \x27" $6 "\x27: " $9 "," }'
  printf "};\n"
} > $path_target
