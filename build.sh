#!/usr/bin/env bash

if [[ $TRAVIS_BRANCH == 'master' ]]
then
    cd terraform/stage
    terraform
fi