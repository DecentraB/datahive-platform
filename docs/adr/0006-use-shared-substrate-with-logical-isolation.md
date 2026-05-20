# 6. Preserve domain ownership on shared platform runtimes

Date: 2026-05-04

## Status

Accepted

## Context

Shared orchestration and compute runtimes can unintentionally centralize ownership if the platform team begins managing product-specific workflows, pipelines, transformations, or data contracts.

This would blur accountability boundaries between the platform team and domain teams, increase coordination overhead, and weaken the data product ownership model.

The architecture should preserve decentralized ownership even when infrastructure and runtimes are shared.

## Decision

Shared platform runtimes do not imply shared ownership of workloads.

Domain and product teams remain responsible for their own:

- dbt projects and models
- Dagster jobs, schedules, and orchestration graphs
- Ray jobs and ML workloads
- Kafka topics and schemas
- data contracts
- SLAs
- data quality rules
- deployment lifecycle

The platform team owns only the shared runtime infrastructure and platform capabilities, including:

- runtime provisioning
- scaling
- upgrades
- observability infrastructure
- access control frameworks
- operational guardrails
- templates and CI/CD patterns

The platform team must not own or directly manage product-specific business logic or pipelines.

Domain-level sharing of workflows or runtime components is allowed only when the owning domain explicitly accepts the operational coupling and lifecycle coordination.

## Consequences

This preserves clear ownership boundaries while still benefiting from shared infrastructure and runtimes.

Domain teams maintain autonomy over their data products and operational behavior.

The platform team can focus on reliability, enablement, and platform capabilities rather than becoming a centralized data engineering bottleneck.

Shared runtimes still introduce some operational coupling and noisy-neighbor risk, which may require stronger isolation mechanisms as the platform grows.
