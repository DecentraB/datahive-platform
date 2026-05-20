# 8. Use Terragrunt for Terraform Orchestration

Date: 2026-05-04

## Status

Accepted

## Context

DataHive uses Terraform for infrastructure as code. But managing vanilla Terraform with bash scripts across multiple environments (dev, staging, prod) and promoting code between them can be challenging:

- **Code Duplication:** We copy-paste backend configuration and provider blocks across directories, violating the DRY principle.
- **Maintenance Overhead:** Custom Bash scripts are brittle, difficult to test locally, and require ongoing maintenance.
- **Dependency Management:** We lack a native way to define and execute infrastructure modules in a specific order (e.g., deploying the VPC before the database).

## Decision

We will adopt Terragrunt as the orchestration tool for Terraform. Specifically:

- All environment-specific configurations will be managed via `terragrunt.hcl` files.
- Developers will interact with infrastructure using `terragrunt` commands (e.g., `terragrunt run-all apply`) instead of raw `terraform` commands.

## Consequences

**Positive:**

- **DRY Configuration:** Centralized management of backend configuration and provider blocks.
- **Dependency Management:** Native support for defining and executing infrastructure modules in a specific order.
- **Better Local Dev:** Developers can run orchestration steps locally using `terragrunt run-all` without relying on CI/CD pipelines to stitch components together.

**Negative:**

- **Learning Curve:** Developers will need to learn Terragrunt syntax and commands.
- **Additional Tooling:** We will introduce an additional dependency (Terragrunt) into our infrastructure management workflow.
