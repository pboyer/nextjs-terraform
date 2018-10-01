#!/usr/bin/env bash

curl -fSL "https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip" -o terraform.zip
mkdir -p bin/terraform/Linux
unzip terraform.zip -d bin/terraform/Linux
rm -f terraform.zip
