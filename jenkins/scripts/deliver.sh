#!/usr/bin/env bash

echo 'Installing the JAR to local Maven repository...'
set -x
/opt/maven/bin/mvn install -DskipTests
set +x

echo 'Extracting project name and version from pom.xml...'
set -x
NAME=$(/opt/maven/bin/mvn -q -DforceStdout help:evaluate -Dexpression=project.name)
VERSION=$(/opt/maven/bin/mvn -q -DforceStdout help:evaluate -Dexpression=project.version)
set +x

echo "Running built JAR: target/${NAME}-${VERSION}.jar"
set -x
java -jar target/${NAME}-${VERSION}.jar
