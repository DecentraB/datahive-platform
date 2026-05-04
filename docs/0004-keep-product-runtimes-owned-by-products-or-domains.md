# 4. Keep product runtimes owned by products or domains

Date: 2026-05-04

## Status

Accepted

## Context

Kafka, Kafka Connect, Dagster, and Ray can easily become shared platform services that own product-specific behavior. That would blur ownership, create coordination problems between products, and make failures or configuration conflicts harder to attribute.

## Decision

Keep product runtimes owned by the product that needs them.

Kafka/Kafka Connect should run inside source-aligned products when streaming or CDC is needed. Dagster and Ray should run inside products or domains that need orchestration or AI/ML workloads.

The platform may provide templates, operators, CI checks, and observability conventions, but it must not own product-specific topics, connector configs, orchestration graphs, or Ray jobs.

Domain-level sharing is allowed only when the domain explicitly owns the coupling and operational risk.

## Consequences

This improves modularity, ownership, and blast-radius control.

It may create more runtime instances than a centralized platform would.

The platform must provide good templates and guardrails so product-owned runtimes remain operable.
