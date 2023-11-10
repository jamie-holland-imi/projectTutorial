#!/bin/bash

#get highest tag number
REVLIST=`git rev-list --tags --max-count=1`
VERSION=`git describe --tags $REVLIST`
BRANCH=`git branch --show-current`

#get number parts of the current tag
VNUM1=$(echo "$VERSION" | cut -d"." -f1 | sed 's/v//')
VNUM2=$(echo "$VERSION" | cut -d"." -f2)
VNUM3=$(echo "$VERSION" | cut -d"." -f3 | grep -Eo '[0-9]+')
VNUM4=$(echo "$VERSION" | cut -d"." -f3 | grep -Eo '[[:alpha:]]+')
VNUM5=$(echo "$VERSION" | cut -d"." -f4)

# Check for #major or #minor in commit message and increment the relevant version number
MAJOR=`git log --format=%B -n 1 HEAD | grep '(MAJOR)'`
MINOR=`git log --format=%B -n 1 HEAD | grep '(MINOR)'`
PATCH=`git log --format=%B -n 1 HEAD | grep '(PATCH)'`
CLEAN=`git log --format=%B -n 1 HEAD | grep '(CLEAN)'`
# Phase increments the alpha,beta or rc number by 1 (rc1 -> rc2)
PHASE=`git log --format=%B -n 1 HEAD | grep '(PHASE)'`
ALPHA=`git log --format=%B -n 1 HEAD | grep '(ALPHA)'`
BETA=`git log --format=%B -n 1 HEAD | grep '(BETA)'`
RC=`git log --format=%B -n 1 HEAD | grep '(RC)'`

if [ -z "$VERSION" ]; then
    echo "No tag exists setting the first tag to V0.0.0-alpha.1"
    VNUM1=0
    VNUM2=0
    VNUM3=0
    VNUM4='alpha'
    VNUM5=1
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
# check if the branch is not main then tag must drop down to beta
elif ([ "$VNUM4" == 'rc' ] && [ "$BRANCH" != "main" ]); then
    VNUM4='beta'
    VNUM5=1
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
fi

if [ "$MAJOR" ]; then
    echo "Update major version"
    VNUM1=$((VNUM1+1))
    VNUM2=0
    VNUM3=0
    if [ -z "$VNUM4" ]; then
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
    else
        VNUM5=0
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$MINOR" ]; then
    echo "Update minor version"
    VNUM2=$((VNUM2+1))
    VNUM3=0
    if [ -z "$VNUM4" ]; then
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
    else
        VNUM5=0
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$PATCH" ]; then
    echo "Update patch version"
    VNUM3=$((VNUM3+1))
    if [ -z "$VNUM4" ]; then
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
    else
        VNUM5=0
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
fi

if [ "$CLEAN" ]; then
    if [ "$BRANCH" == "main" ]; then
        echo "Create a clean release tag removing additional labels"
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
    else
        echo "Must be on the main branch to create a clean release tag"
        NEW_TAG="invalidbranch"
    fi
elif [ "$ALPHA" ]; then
    if [ "$VNUM4" == 'alpha' ]; then
        echo "Update alpha version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Set alpha version"
        VNUM4='alpha'
        VNUM5=1
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$BETA" ]; then
    if [ "$VNUM4" == 'beta' ]; then
        echo "Update beta version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Set beta version"
        VNUM4='beta'
        VNUM5=1
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$PHASE" ]; then
    if [ -z "$VNUM4" ]; then
        echo "Not currently in a phase will set to alpha"
        VNUM4='alpha'
        VNUM5=1
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    else
        echo "Update phase $VNUM4 version"
        VNUM5=$((VNUM5+1))
        NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
    fi
elif [ "$RC" ]; then
    if [ "$BRANCH" == "main" ]; then
        if [ "$VNUM4" == 'rc' ]; then
            echo "Update release candidate"
            VNUM5=$((VNUM5+1))
            NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
        else
            echo "For current tag set release candidate"
            VNUM4='rc'
            VNUM5=1
            NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
        fi
    else
        echo "Must be on the main branch to create a RC tag"
        NEW_TAG="invalidbranch"
    fi
elif [ "$VNUM5" == "0" ]; then
    VNUM5=1
    NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
fi

if [ $(git tag -l "$NEW_TAG") ]; then
    VALID=false
    while [ "$VALID" = false ];  do
        if [ $(git tag -l "$NEW_TAG") ]; then
            echo "The Tag $NEW_TAG already exists incrementing PHASE by 1"
            VNUM5=$((VNUM5+1))
            NEW_TAG="v$VNUM1.$VNUM2.$VNUM3-$VNUM4.$VNUM5"
        else
            echo "valid Tag setting tag to $NEW_TAG"
            VALID=true
        fi
    done
fi

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

echo "################################################################"
if [ -z "$NEW_TAG" ]; then
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
echo "################################################################"
