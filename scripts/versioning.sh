#!/bin/bash

#get highest tag number
VERSION=`git describe --abbrev=0 --tags`
OLDVERSION=$VERSION

#get number parts and increase last one by 1
VNUM1=$(echo "$VERSION" | cut -d"." -f1)
VNUM2=$(echo "$VERSION" | cut -d"." -f2)
VNUM3=$(echo "$VERSION" | cut -d"." -f3 | cut -d"-" -f4)
VNUM4=$(echo "$VERSION" | cut -d"-" -f5 | cut -d"." -f6)
VNUM5=$(echo "$VERSION" | cut -d"." -f7)
VNUM1=`echo $VNUM1 | sed 's/v//'`

# Check for #major or #minor in commit message and increment the relevant version number
MAJOR=`git log --format=%B -n 1 HEAD | grep '(MAJOR)'`
MINOR=`git log --format=%B -n 1 HEAD | grep '(MINOR)'`
PATCH=`git log --format=%B -n 1 HEAD | grep '(PATCH)'`
RC=`git log --format=%B -n 1 HEAD | grep '(RC)'`
MAJORRC=`git log --format=%B -n 1 HEAD | grep '(MAJORRC)'`

echo "1 $VNUM1"
echo "2 $VNUM2"
echo "3 $VNUM3"
echo "4 $VNUM4"
echo "5 $VNUM5"

if [ "$MAJOR" ]; then
    echo "Update major version"
    VNUM1=$((VNUM1+1))
    VNUM2=0
    VNUM3=0
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
elif [ "$MINOR" ]; then
    echo "Update minor version"
    VNUM2=$((VNUM2+1))
    VNUM3=0
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
elif [ "$PATCH" ]; then
    echo "Update patch version"
    VNUM3=$((VNUM3+1))
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
elif [ "$RC" ]; then
    if [ -z "$VNUM5" ]; then
        echo "For current tag set release candidate"
        VNUM1=$((VNUM1+1))
        VNUM2=0
        VNUM3=0
        VNUM4='rc'
        VNUM5=1
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Update release candidate version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$MAJORRC" ]; then
    if [ "$VNUM5" >= '1' ] && [ "$VNUM4" == 'rc' ]; then
        echo "Already RC will instead just increment it"
        VNUM5=$((VNUM5+1))
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    elif [ "$VNUM2" == '0' ] && [ "$VNUM3" == '0' ]; then
        echo "Setting RC as currently already a major version"
        VNUM4='rc'
        VNUM5=1
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Update major and set release candidate"
        VNUM1=$((VNUM1+1))
        VNUM2=0
        VNUM3=0
        VNUM4='rc'
        VNUM5=1
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ -z "$VERSION" ]; then
    echo "No tag exists setting the first tag to 0.0.0"
    NEW_TAG="v0.0.0"
else
    NEW_TAG="nochange"
fi

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

echo "###############################################################"
if [ "$OLDVERSION" == "$NEW_TAG" ]; then
    echo "The tag $NEW_TAG already exists"
elif [ "$NEW_TAG" == "nochange" ]; then
    echo "No instruction detected"
    CURRENTTAG=`git describe --tags`
    echo "tag is set to $CURRENTTAG"
elif [ -z "$NEEDS_TAG" ]; then
    echo "Updating $OLDVERSION to $NEW_TAG"
#    echo "Tagged with $NEW_TAG (Ignoring fatal:cannot describe - this means commit is untagged) "
    git tag $NEW_TAG
    git push --tags
else
    echo "Already a tag on this commit"
fi
echo "###############################################################"
