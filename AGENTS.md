# Agent Notes

Use this file as a quick navigation guide. Do not treat it as the source of project truth.

## Where To Look

- Start with `README.md` for the current architecture overview, vocabulary, product taxonomy, MVP scope, and default stack.
- Check `docs/*.md` for Architecture Decision Records before changing architectural direction.
- Use `adr list` to see recorded decisions. ADR storage is configured by `.adr-dir` and currently points to `docs`.
- Use repository search for details instead of guessing:
  - `rg "<term>" README.md docs`
  - `find docs -maxdepth 1 -type f -name '*.md' -print`

## ADR Workflow

- Manage ADRs with the installed `adr` CLI.
- Run `adr help` for command usage.
- Keep ADRs concise and in Michael Nygard style: Context, Decision, Consequences.
- Add ADRs only for decisions that are architectural, durable, and costly to rediscover later.

## Editing Guidance

- Keep `README.md` high-level. Do not add long YAML examples or detailed product schemas there.
- Put detailed product profiles, schemas, and implementation design in separate docs.
- Preserve the current ownership principle: shared substrate is platform-owned; product-specific runtimes and logic are product-owned or domain-owned.
