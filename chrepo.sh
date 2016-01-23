#!/usr/bin/env bash
find . -type f | xargs perl -pi -e 's/github\.com\/vova616\/GarageEngine/github\.com\/skarr\/GarageEngine/g'
find . -type f | xargs perl -pi -e 's/github\.com\/go\-gl\/gl([^f])/github\.com\/go\-gl\/gl\/v3\.3\-core\/gl$1/g'
find . -type f | xargs perl -pi -e 's/github\.com\/go\-gl\/glfw/github\.com\/go\-gl\/glfw\/v3\.1\/glfw/g'
