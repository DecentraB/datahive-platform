# 3. Classify data products by ownership intent

Date: 2026-05-04

## Status

Accepted

## Context

Data products can have different ownership intent. Confusing source capture, aggregation, construction of new values, and consumer-specific shaping leads to unclear ownership and brittle downstream dependencies.

## Decision

Classify data products by ownership intent:

- source-aligned data products publish data from an operational source
- aggregate data products group existing streams or tables without changing business meaning
- constructor data products create new values, derived entities, metrics, or insights
- consumer-aligned data products shape data for a specific end use

Represent the type in ODPS metadata and governance rules, not as a separate custom product schema in the architecture document.

## Consequences

This makes ownership, contracts, and lifecycle clearer.

Aggregate products must not contain hidden transformation logic. If they construct new business meaning, they must be treated as constructor products.

Product templates and reviews must enforce the distinction.
