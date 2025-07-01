#!/bin/sh
# gradlew script with Unix LF line endings to avoid /usr/bin/env: ‘sh\r’: No such file or directory error

# -----------------------------------------------------------------------------
# Gradle start up script for UN*X
# -----------------------------------------------------------------------------

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn() {
    echo "$*"
}

die() {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
case "`uname`" in
    CYGWIN*) cygwin=true ;;
    MINGW*) msys=true ;;
    Darwin*) darwin=true
             # macOS specific environment variables
             if [ -z "$JAVA_HOME" ] ; then
                 JAVA_HOME=/Library/Java/Home
             fi
             ;;
esac

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/bin/java" ] ; then
        JAVACMD="$JAVA_HOME/bin/java"
    else
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD=`which java 2> /dev/null`
    if [ -z "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
fi

# Increase the maximum file descriptors if possible.
if [ "$MAX_FD" != "maximum" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD_LIMIT" != "unlimited" ] ; then
            if [ "$MAX_FD_LIMIT" -lt "$MAX_FD" ] ; then
                MAX_FD="$MAX_FD_LIMIT"
            fi
        fi
    fi
    ulimit -n $MAX_FD || warn "Could not set maximum file descriptor limit: $MAX_FD"
fi

# Determine the location of the Gradle home directory.
PRG="$0"

while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`/"$link"
    fi
done

PRGDIR=`dirname "$PRG"`

# Only set GRADLE_HOME if not already set
if [ -z "$GRADLE_HOME" ] ; then
    GRADLE_HOME=`cd "$PRGDIR/.." ; pwd`
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --windows "$JAVA_HOME"`
    [ -n "$GRADLE_HOME" ] && GRADLE_HOME=`cygpath --windows "$GRADLE_HOME"`
    [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
fi

# Build the Gradle command line
CLASSPATH=$GRADLE_HOME/lib/gradle-launcher-*.jar

exec "$JAVACMD" $DEFAULT_JVM_OPTS -classpath "$CLASSPATH" org.gradle.launcher.GradleMain "$@"
