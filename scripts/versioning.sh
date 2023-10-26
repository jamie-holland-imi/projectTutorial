#!/bin/sh

#get highest tag number
VERSION=`git describe --abbrev=0 --tags`

#get number parts and increase last one by 1
VNUM1=$(echo "$VERSION" | cut -d"." -f1)
VNUM2=$(echo "$VERSION" | cut -d"." -f2)

VNUM1=`echo $VNUM1 | sed 's/v//'`

# Check for #major or #minor in commit message and increment the relevant version number
MAJOR=`git log --format=%B -n 1 HEAD | grep '#major'`
MINOR=`git log --format=%B -n 1 HEAD | grep '#minor'`
PATCH=`git log --format=%B -n 1 HEAD | grep '#patch'`
RELCAN=`git log --format=%B -n 1 HEAD | grep '#releasecandidate'`

if [ "$MAJOR" ]; then
    echo "Update major version"
    VNUM1=$((VNUM1+1))
    VNUM2=0
    VNUM3=0
    VNUM4=0
elif [ "$MINOR" ]; then
    echo "Update minor version"
    VNUM2=$((VNUM2+1))
    VNUM3=0
    VNUM4=0
elif [ "$PATCH" ]; then
    echo "Update patch version"
    VNUM3=$((VNUM3+1))
    VNUM4=0
else
    echo "No instruction detected a tag wont be added to this commit"
fi

#create new tag
NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"

# check for release
if [ "$RELCAN" ]; then
    echo "Update release candidate version"
    VNUM4=$((VNUM4+1))
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-rc.$VNUM4"
fi

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

echo "###############################################################"  
#only tag if no tag already (would be better if the git describe command above could have a silent option)
if [ -z "$NEEDS_TAG" ]; then
    echo "Updating $VERSION to $NEW_TAG"
#    echo "Tagged with $NEW_TAG (Ignoring fatal:cannot describe - this means commit is untagged) "
    git tag $NEW_TAG
    git push --tags
else
    echo "Already a tag on this commit"
fi
echo "###############################################################"  
