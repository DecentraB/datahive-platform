# 5. Use warehouse-native transformations instead of Spark by default

Date: 2026-05-04

## Status

Accepted

## Context

Most bronze-to-silver-to-gold transformations can be expressed in SQL and executed by the warehouse. Using Spark as the default ETL runtime would add operational complexity and duplicate warehouse capabilities.

## Decision

Use StarRocks SQL with dbt or equivalent SQL model tooling as the default transformation path.

Operational ingestion should be handled by source-aligned products. Source-aligned products use substrate-managed Kafka and substrate-managed Kafka Connect for streaming or CDC by default, while owning ingestion intent, source contracts, connector declarations, quality, and lifecycle.

Use Ray for AI/ML workloads when SQL is not a good fit. Spark is not part of the default ETL path.

## Consequences

The stack is simpler and SQL-first.

Transformation lineage, tests, and documentation can follow dbt conventions.

StarRocks capacity and workload isolation become important because the warehouse handles both transformation and serving.

Spark can still be introduced later for exceptional workloads.
