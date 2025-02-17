#!/usr/bin/env bash
set -e

# Install package
cd /tmp/build
composer require --no-interaction --ignore-platform-reqs tweakwise/magento2-tweakwise-export
cp -R ${TRAVIS_BUILD_DIR}/* /tmp/build/vendor/tweakwise/magento2-tweakwise-export

php bin/magento module:enable Tweakwise_Magento2TweakwiseExport
php bin/magento setup:upgrade --no-interaction

# Install package dev dependencies. Unfortunately I do not have a generic way to do this yet
composer require fzaninotto/faker --no-interaction

# Make sure auto loading works as expected
composer dump-autoload
