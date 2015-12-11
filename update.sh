#!/usr/bin/env bash

rm -rf ./vendor/
composer require mustache/mustache
PACKAGE_VERSION=$(./getPackageVersion.php mustache/mustache)
cd ./vendor/mustache/
mv ./mustache/ ./mustache.php/
zip -r "../../mustache.php-$PACKAGE_VERSION.zip" ./mustache.php
cd ../..
scp "mustache.php-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
rm composer.*
echo $PACKAGE_VERSION > VERSION