# Agent Notes

Use this file as a quick navigation guide. Do not treat it as the source of project truth.

## Where To Look

- Start with `README.md` for the current architecture overview, vocabulary, product taxonomy, MVP scope, and default stack.
- Check `docs/adr/*.md` for Architecture Decision Records before changing architectural direction.
- Use `adr list` to see recorded decisions. ADR storage is configured by `.adr-dir` and currently points to `docs/adr`.
- Use repository search for details instead of guessing:
  - `rg "<term>" README.md docs/adr`
  - `find docs/adr -maxdepth 1 -type f -name '*.md' -print`

## Related Repositories

These repositories are related but independently cloned. Do not assume local sibling paths exist. If a path is needed, check it first with `test -d <path>` and confirm the remote with `git -C <path> remote -v` when identity matters.

| Repository | Purpose | Canonical URL | Possible Local Path |
| --- | --- | --- | --- |
| datahive | Architecture, vocabulary, ADRs, platform purpose | git@github.com:DecentraB/datahive.git | `.` |
| datahive-blueprints | Reusable Terraform modules, Helm charts, templates, policies, and bootstrap assets | git@github.com:DecentraB/datahive-blueprints.git | `../datahive-blueprints` |
| datahive-registry | Environments, domains, shared substrate configuration, access policy, and onboarding | git@github.com:DecentraB/datahive-registry.git | `../datahive-registry` |

Use related repositories as implementation context. Keep architectural truth in this repo unless an ADR or README explicitly delegates detail elsewhere.

## ADR Workflow

- Manage ADRs with the installed `adr` CLI.
- Run `adr help` for command usage.
- Keep ADRs concise and in Michael Nygard style: Context, Decision, Consequences.
- Add ADRs only for decisions that are architectural, durable, and costly to rediscover later.

## Editing Guidance

- Keep `README.md` high-level. Do not add long YAML examples or detailed product schemas there.
- Put detailed product profiles, schemas, and implementation design in separate docs.
- Preserve the current ownership principle: shared substrate infrastructure is platform-owned; product-specific logic is product-owned or domain-owned.
- Treat Kafka brokers and Kafka Connect workers as substrate-managed infrastructure by default; keep source-specific ingestion logic and contracts product-owned.
- Do not describe a landing zone as a business capability. Domains correspond to business capabilities; one landing zone may contain multiple domains.
