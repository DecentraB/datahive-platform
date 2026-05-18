# 4. Use shared platform runtimes on shared substrate

Date: 2026-05-04

## Status

Accepted

## Context

The platform is on-premise and should start with an architecture that is operationally simple, cost-efficient, and easy to evolve.

Running separate infrastructure stacks or runtime systems per product or domain would significantly increase operational overhead, infrastructure duplication, and operational inconsistency before there is a proven need for stronger isolation.

Most data and compute runtimes support multi-tenancy and logical isolation well enough for the current scale and risk profile.

## Decision

Use a shared Kubernetes platform cluster and a shared Argo CD installation.

Operate the following as centrally managed shared platform services:

* Celph object storage
* Polaris
* StarRocks
* OpenMetadata
* Apache Kafka brokers
* Kafka Connect worker pools
* Dagster
* Ray clusters
* dbt execution environments
* observability
* secrets integration
* policy integration

Use logical isolation through:

* Kubernetes namespaces
* RBAC
* quotas
* network policies
* workload queues and concurrency limits
* StarRocks databases and roles
* storage prefixes or buckets
* Kafka ACLs and topic naming conventions

Do not introduce:

* separate runtime installations per product
* multiple Argo CD instances
* Crossplane (unless it becomes necessary to manage non-Kubernetes infrastructure)
* physical isolation per domain

until there is a concrete operational, compliance, scale, or blast-radius requirement.

## Consequences

This keeps the platform smaller and easier to operate.

Shared runtimes improve infrastructure utilization, standardization, observability consistency, and operational efficiency.

Logical isolation may not satisfy future compliance or fault-isolation requirements.

Dedicated runtime deployments can be introduced later when justified by operational or organizational needs.