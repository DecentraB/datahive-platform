# 2. Use ODPS and ODCS for product metadata and contracts

Date: 2026-05-04

## Status

Accepted

## Context

DataHive needs data product metadata, output-port contracts, ownership, lifecycle, quality expectations, and discoverability. Creating a custom platform schema in the architecture document would make the design harder to interoperate with and harder to evolve.

## Decision

Use Open Data Product Standard (ODPS) for data product metadata.

Use Open Data Contract Standard (ODCS) for output-port contracts.

Keep DataHive-specific validation rules and extensions in a separate profile document. Do not embed detailed product YAML schemas in the architecture overview.

## Consequences

This keeps DataHive aligned with existing standards and reduces custom schema design.

The platform must provide validation and guidance for the DataHive ODPS/ODCS profile.

Some desired platform metadata may need to be represented as ODPS extensions instead of custom top-level fields.
