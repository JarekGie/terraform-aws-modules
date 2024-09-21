# Makefile to manage Terraform operations

# Variables
ENVIRONMENT ?= DRP
TERRAFORM_DIR := examples
TF_PLAN := ./tfplan

SHELL := /bin/bash
.SHELLFLAGS := -c

# Default action
.PHONY: all
all: help

# Help command
.PHONY: help
help:
	@echo "Makefile for Terraform operations"
	@echo
	@echo "Available targets:"
	@echo "  init         - Initialize Terraform"
	@echo "  validate     - Validate Terraform configuration"
	@echo "  plan         - Generate and show the execution plan"
	@echo "  apply        - Apply the changes required to reach the desired state"
	@echo "  destroy      - Destroy the Terraform-managed infrastructure"
	@echo "  format       - Format Terraform code"
	@echo "  clean        - Remove Terraform state files"

# Initialize Terraform
.PHONY: init
init:
	@echo "Initializing Terraform..."
	cd $(TERRAFORM_DIR) && terraform init

# Format Terraform configuration
.PHONY: format
format:
	@echo "Formatting Terraform files..."
	cd $(TERRAFORM_DIR) && terraform fmt

# Validate Terraform configuration
.PHONY: validate
validate:
	@echo "Validating Terraform configuration..."
	cd $(TERRAFORM_DIR) && terraform validate

# Generate and show the execution plan
.PHONY: plan
plan: format validate
	@echo "Planning Terraform changes..."
	cd $(TERRAFORM_DIR) && terraform plan -out=$(TF_PLAN)

# Apply the changes required to reach the desired state
.PHONY: apply
apply: plan
	@if [ ! -f $(TF_PLAN) ]; then \
		echo "Terraform plan file does not exist. Run 'make plan' first."; \
		exit 1; \
	fi
	@echo "Applying Terraform changes..."
	cd $(TERRAFORM_DIR) && terraform apply $(TF_PLAN)

# Destroy the Terraform-managed infrastructure
.PHONY: destroy
destroy:
	@echo "Destroying Terraform-managed infrastructure..."
	cd $(TERRAFORM_DIR) && terraform destroy

# Clean up Terraform files
.PHONY: clean
clean:
	@echo "Cleaning up Terraform state files..."
	rm -rf $(TERRAFORM_DIR)/.terraform
	rm -rf $(TERRAFORM_DIR)/terraform.tfstate*
	rm -rf $(TERRAFORM_DIR)/$(TF_PLAN)
	rm -rf $(TERRAFORM_DIR)/.terraform.lock.hcl
	rm -rf $(TERRAFORM_DIR)/$(TF_PLAN).backup
