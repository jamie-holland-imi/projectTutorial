#!/bin/bash

#get highest tag number
VERSION=`git describe --tags `git rev-list --tags --max-count=1``
BRANCH=`git branch --show-current`

#get number parts of the current tag
VNUM1=$(echo "$VERSION" | cut -d"." -f1)
VNUM2=$(echo "$VERSION" | cut -d"." -f2)
VNUM3=$(echo "$VERSION" | cut -d"." -f3 | grep -Eo '[0-9]+')
VNUM4=$(echo "$VERSION" | cut -d"." -f3 | grep -Eo '[[:alpha:]]+')
VNUM5=$(echo "$VERSION" | cut -d"." -f4)
VNUM1=`echo $VNUM1 | sed 's/V//'`

# Check for #major or #minor in commit message and increment the relevant version number
CLEAN=`git log --format=%B -n 1 HEAD | grep '(CLEAN)'`
MAJOR=`git log --format=%B -n 1 HEAD | grep '(MAJOR)'`
MINOR=`git log --format=%B -n 1 HEAD | grep '(MINOR)'`
PATCH=`git log --format=%B -n 1 HEAD | grep '(PATCH)'`
ALPHA=`git log --format=%B -n 1 HEAD | grep '(ALPHA)'`
BETA=`git log --format=%B -n 1 HEAD | grep '(BETA)'`
PHASE=`git log --format=%B -n 1 HEAD | grep '(PHASE)'`
RC=`git log --format=%B -n 1 HEAD | grep '(RC)'`
MAJORRC=`git log --format=%B -n 1 HEAD | grep '(MAJORRC)'`

if [ "$CLEAN" ]; then
    if [ "$BRANCH" == "main" ]; then
        echo "Create a clean release tag removing additional labels"
        VNUM4=""
        VNUM5=0
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3"
    else
        echo "Must be on the main branch to create a clean release tag"
        NEW_TAG="invalidbranch"
    fi
elif [ "$MAJOR" ]; then
    echo "Update major version"
    VNUM1=$((VNUM1+1))
    VNUM2=0
    VNUM3=0
    if [ -z "$VNUM4" ]; then
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3"
    else
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$MINOR" ]; then
    echo "Update minor version"
    VNUM2=$((VNUM2+1))
    VNUM3=0
    if [ -z "$VNUM4" ]; then
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3"
    else
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$PATCH" ]; then
    echo "Update patch version"
    VNUM3=$((VNUM3+1))
    if [ -z "$VNUM4" ]; then
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3"
    else
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
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
elif [ "$PHASE" ]; then
    if [ -z "$VNUM4" ]; then
        echo "Not currently in a phase no change to be done"
        NEW_TAG="nochange"
    else
        echo "Update phase $VNUM4 version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$RC" ]; then
    if [ "$BRANCH" == "main" ]; then
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
    else
        echo "Must be on the main branch to create a RC tag"
        NEW_TAG="invalidbranch"
    fi
elif [ "$MAJORRC" ]; then
    if [ "$BRANCH" == "main" ]; then
        echo "Update major and set release candidate"
        VNUM1=$((VNUM1+1))
        VNUM2=0
        VNUM3=0
        VNUM4='rc'
        VNUM5=1
        NEW_TAG="V$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Must be on the main branch to create a rc tag"
        NEW_TAG="invalidbranch"
    fi
elif [ -z "$VERSION" ]; then
    echo "No tag exists setting the first tag to V0.0.0-alpha.1"
    NEW_TAG="V0.0.0-alpha.1"
else
    NEW_TAG="nochange"
fi

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

echo "##############################################################"
if [ "$NEW_TAG" == "nochange" ]; then
    echo "No instruction detected the branch will remain as $VERSION"
elif [ "$NEW_TAG" == "invalidbranch" ]; then
    echo "The current branch is $BRANCH"
    echo "To set either a release or rc you must be on the main branch not the $BRANCH branch"
elif [ -z "$NEEDS_TAG" ]; then
    echo "Updating the tag from $VERSION to $NEW_TAG"
    git tag $NEW_TAG
    git push --tags
else
    echo "The tag $NEW_TAG already exists the latest tag will remain as $VERSION"
fi
echo "##############################################################"
