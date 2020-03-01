#!/bin/sh -l

while read app version arch app_path ; do
  docker buildx build \
    --platform ${arch} \
    --output 'type=docker,push-false' \
    --tag barcus/bareos-${app}:${version} \
    ${app_path}
done < <(cat homework/app_build.txt |grep ${bareos_app})
