#!/usr/bin/env php
<?php

$composer = json_decode(file_get_contents("composer.lock"), true);

$search = $argv[1];

$packages = $composer["packages"];

foreach ($packages as $package) {
    if ($package["name"] === $search) {
        echo str_replace("v", "", $package["version"]);
    }

}