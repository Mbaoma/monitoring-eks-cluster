#! /bin/bash
echo "formatting terraform code ..........."
terraform fmt

echo "validating terraform code ..........."
terraform validate

echo "saving terraform plan to tfplan file ..........."
terraform plan -out tfplan