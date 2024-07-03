#!/bin/bash

level_change=$1 # major, minor or patch

# extract version from pubspec.yaml
version_name=$(awk '/version:/ {print $2}' pubspec.yaml | head -n1 | cut -d '+' -f1)

major=$(echo $version_name | awk -F. '{print $1}')
minor=$(echo $version_name | awk -F. '{print $2}')
path=$(echo $version_name | awk -F. '{print $3}')

# increment version
if [ "$level_change" = "major" ]; then
  major=$(echo "scale=0; $major + 1" | bc)
  minor=0
  path=0
elif [ "$level_change" = "minor" ]; then
  minor=$(echo "scale=0; $minor + 1" | bc)
  path=0
elif [ "$level_change" = "patch" ]; then
  path=$(echo "scale=0; $path + 1" | bc)
else
  echo "Level not found, use major, minor or patch"
  exit 1
fi

new_version_name="$major.$minor.$path"
#new_version_number=$(echo "scale=0; $(date +%s) / 3" | bc) # It should work until August 21, 2169, 16:00:00.
new_version_number=$(git rev-list --count HEAD)
new_version="$new_version_name+$new_version_number"

# update in pubspec.yaml
sed -i.bak -E "s/version: [0-9]+\.[0-9]+\.[0-9]+(\+[0-9]+)?/version: $new_version/g" pubspec.yaml && rm pubspec.yaml.bak

# update in ios
#sed -i.bak -E "s/(CURRENT_PROJECT_VERSION = )[0-9]+;/\1$new_version_number;/g" ios/Runner.xcodeproj/project.pbxproj && rm ios/Runner.xcodeproj/project.pbxproj.bak
#sed -i.bak -E "s/(MARKETING_VERSION = )[0-9.]+;/\1$new_version_name;/g" ios/Runner.xcodeproj/project.pbxproj && rm ios/Runner.xcodeproj/project.pbxproj.bak

echo "Version: $new_version"