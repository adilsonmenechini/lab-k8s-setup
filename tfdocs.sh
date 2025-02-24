#!/bin/bash

docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs/modules/cluster > modules/cluster/README.md


# Loop through the directories in the specified directory and print them
for dir in modules/apps/*; do
  echo "$dir"
  docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs/$dir > $dir/README.md
  terraform fmt $dir
done
