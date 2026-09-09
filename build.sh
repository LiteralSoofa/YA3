#!/bin/bash

zip -r build.zip . \
    -x '.git/*' \
       '.godot/*' \
       '*.tmp' \
       'LICENSE' \
       'icon.png*' \
       'build.sh' \
       'CHANGELOG.md' \
       'player.*' \
       'project.godot' \
       'README.md' \
       'test.*' \
       '.gitattributes' \
       '.gitignore' \
       'test3d.*' \
       'build.zip'
