#!/bin/bash

yarn install
yarn build
bundle check || bundle install

./bin/dev
