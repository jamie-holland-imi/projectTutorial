#!/bin/bash

#get highest tag number
VERSION=`git describe --abbrev=0 --tags`
OLDVERSION=$VERSION

#get number parts and increase last one by 1
#VNUM1=$(echo "$VERSION" | cut -d"." -f1)
#VNUM2=$(echo "$VERSION" | cut -d"." -f2)
#VNUM3=$(echo "$VERSION" | cut -d"." -f3)
#VNUM4=$(echo "$VERSION" | cut -d"-" -f4)
#VNUM5=$(echo "$VERSION" | cut -d"." -f5)
#VNUM1=`echo $VNUM1 | sed 's/V//'`
$(echo "$VERSION" | awk -F'[.-]' '{print $1; print $2; print $3;print $4;print $5;}')
VNUM1=$1
VNUM2=$2
VNUM3=$3
VNUM4=$4
VNUM5=$5

# Check for #major or #minor in commit message and increment the relevant version number
RELEASE=`git log --format=%B -n 1 HEAD | grep '(RELEASE)'`
MAJOR=`git log --format=%B -n 1 HEAD | grep '(MAJOR)'`
MINOR=`git log --format=%B -n 1 HEAD | grep '(MINOR)'`
PATCH=`git log --format=%B -n 1 HEAD | grep '(PATCH)'`
ALPHA=`git log --format=%B -n 1 HEAD | grep '(ALPHA)'`
BETA=`git log --format=%B -n 1 HEAD | grep '(BETA)'`
RC=`git log --format=%B -n 1 HEAD | grep '(RC)'`
MAJORRC=`git log --format=%B -n 1 HEAD | grep '(MAJORRC)'`

echo "###############################"
echo "1 $VNUM1"
echo "2 $VNUM2"
echo "3 $VNUM3"
echo "4 $VNUM4"
echo "5 $VNUM5"
echo "###############################"

if [ "$RELEASE" ]; then
    NEW_TAG="V$VNUM1.$VNUM2.$VNUM3"
elif [ "$MAJOR" ]; then
    echo "Update major version"
    VNUM1=$((VNUM1+1))
    VNUM2=0
    VNUM3=0
    VNUM5=1
    NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
elif [ "$MINOR" ]; then
    echo "Update minor version"
    VNUM2=$((VNUM2+1))
    VNUM3=0
    VNUM5=1
    NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
elif [ "$PATCH" ]; then
    echo "Update patch version"
    VNUM3=$((VNUM3+1))
    VNUM5=1
    NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
elif [ "$ALPHA" ]; then
    if [ "$VNUM4" == 'alpha' ]; then
        echo "Update alpha version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Set alpha version"
        VNUM4='alpha'
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$BETA" ]; then
    if [ "$VNUM4" == 'beta' ]; then
        echo "Update beta version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Set beta version"
        VNUM4='beta'
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$RC" ]; then
    if [ "$VNUM4" == 'rc' ]; then
        echo "Update release candidate"
        VNUM5=$((VNUM5+1))
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "For current tag set release candidate"
        VNUM4='rc'
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$MAJORRC" ]; then
    echo "Update major and set release candidate"
    VNUM1=$((VNUM1+1))
    VNUM2=0
    VNUM3=0
    VNUM4='rc'
    VNUM5=1
    NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
elif [ -z "$VERSION" ]; then
    echo "No tag exists setting the first tag to V0.0.0"
    NEW_TAG="V0.0.0-alpha.1"
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
