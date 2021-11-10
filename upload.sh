#!/bin/bash

git stash
git pull origin master --tags
git stash pop

VersionString=`grep -E 's.version.*=' ProjUI.podspec`
VersionString=${VersionString#*\"} 
VersionString=${VersionString%\"*} 
VersionSubString=${VersionString##*.}
VersionNumber=`tr -cd 0-9 <<<"$VersionSubString"`

NewVersionNumber=$(($VersionNumber + 1))
NewVersionString="${VersionString%$VersionNumber*}${NewVersionNumber}"

echo "old-VersionString:${VersionString} new-VersionString:${NewVersionString}"
LineNumber=`grep -nE 's.version.*=' ProjUI.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionString}/${NewVersionString}/g" ProjUI.podspec

echo "current version is ${VersionString}, new version is ${NewVersionString}"

git add .
git commit -am ${NewVersionString}
git tag ${NewVersionString}
git push origin master --tags
cd ~/.cocoapods/repos/OperaSpecs && git pull origin master && cd - && pod repo push OperaSpecs ProjUI.podspec --verbose --allow-warnings

