#!/bin/bash

# ---------------------------------------------------------
# Generate the README.md files
# ---------------------------------------------------------

echo "# Kubernetes Hands On" > README.md
echo "" >> README.md
echo "## Requirements" >> README.md
echo "" >> README.md
cat ./scripts/requirements.md >> README.md
echo "" >> README.md
echo "" >> README.md

echo "## Hands On" >> README.md
ls handson | grep -v "README.md" | awk '{print "- [" $0 "](/handson/" $0 ")"}' >> README.md
echo "" >> README.md

echo "## Modules" >> README.md
ls modules | grep -v "README.md" | awk '{print "- [" $0 "](/modules/" $0 ")"}' >> README.md
ls modules/apps | grep -v "README.md" | awk '{print "- [" $0 "](/modules/apps/" $0 ")"}' >> README.md