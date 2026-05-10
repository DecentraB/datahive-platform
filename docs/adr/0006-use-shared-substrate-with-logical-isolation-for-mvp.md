# 6. Use shared substrate with logical isolation for MVP

Date: 2026-05-04

## Status

Accepted

## Context

The platform is on-premise and should start with a design that is easy to understand and operate. Physical isolation per product or domain would multiply clusters and operational overhead before the need is proven.

## Decision

Use one Kubernetes platform cluster and one Argo CD installation for the MVP.

Operate shared substrate services centrally: object storage, Polaris, StarRocks, OpenMetadata, policy, secrets integration, and observability.

Use logical isolation through Kubernetes namespaces, RBAC, quotas, network policies, StarRocks databases and roles, Polaris namespaces, and storage prefixes or buckets.

Do not include Crossplane or multiple Argo CD instances in the MVP.

## Consequences

This keeps the MVP smaller and easier to operate.

Logical isolation may not satisfy future scale, compliance, or blast-radius requirements.

Physical isolation, Crossplane, or additional Argo CD instances can be introduced later when there is a concrete requirement.
