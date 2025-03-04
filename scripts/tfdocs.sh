#!/bin/bash

# ---------------------------------------------------------
# Clean up the cache
# ---------------------------------------------------------
  find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;
	find . -name ".terraform" -prune -exec rm -rf {} \;
  find . -name ".terragrunt" -prune -exec rm -rf {} \;

# ---------------------------------------------------------
# Run terraform-docs and terraform fmt
# ---------------------------------------------------------

# Loop through the directories in the specified directory and print them
for dir in $(find modules -name "main.tf" -exec dirname {} \;); do
  echo "$dir"
  docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs/$dir > $dir/README.md
  terraform fmt $dir
done


for dir in $(find handson -name "terragrunt.hcl" -exec dirname {} \;); do
  echo "$dir"
  terragrunt hclfmt ./$dir
done

