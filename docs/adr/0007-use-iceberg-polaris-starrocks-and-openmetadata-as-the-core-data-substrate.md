# 7. Use Iceberg Polaris StarRocks and OpenMetadata as the core data substrate

Date: 2026-05-04

## Status

Accepted

## Context

DataHive needs an open lakehouse table format, a catalog, a warehouse for SQL transformation and serving, and a metadata catalog for discovery and governance. Choosing these early avoids re-litigating core substrate decisions in every product design.

## Decision

Use Apache Iceberg as the table format on S3-compatible object storage.

Use Apache Polaris as the Iceberg REST catalog.

Use StarRocks as the warehouse, SQL transformation engine, and serving/query layer.

Use OpenMetadata as the metadata catalog for discovery, ownership, governance, and lineage.

Do not include Trino, Nessie, or Hive Metastore in the MVP.

## Consequences

The MVP has a clear and coherent lakehouse substrate.

StarRocks integration with Iceberg and dbt becomes a critical path.

Changing catalog or warehouse choices later will be costly, so the decision should be revisited only with strong evidence.
