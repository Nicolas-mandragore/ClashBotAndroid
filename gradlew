#!/usr/bin/env sh
# Gradle start script for UN*X

DIRNAME=$(dirname "$0")
exec java -jar "$DIRNAME/gradle/wrapper/gradle-wrapper.jar" "$@"
