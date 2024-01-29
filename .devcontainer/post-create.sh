#!/bin/bash

# Install Flutter
git clone https://github.com/flutter/flutter.git /home/codespace/flutter
export PATH="$PATH:/home/codespace/flutter/bin"

# Install Dart
chown -R codespace /home/codespace/flutter
flutter doctor
