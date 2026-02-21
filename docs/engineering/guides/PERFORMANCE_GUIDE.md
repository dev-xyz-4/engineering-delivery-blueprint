# PERFORMANCE GUIDE

Generated on: 2026-02-15

------------------------------------------------------------------------

## Purpose

Define minimum performance governance requirements depending on project type and distribution model.

This guide:
- Defines scope-dependent requirements.
- Does NOT define project-specific performance targets (see `docs/engineering/performance.md`).
- Does NOT alter BMAD workflow rules.
- Avoids tool mandates and avoids hard numeric thresholds.

------------------------------------------------------------------------

## Design Principle

Performance requirements scale with:

- Distribution surface
- User impact of latency/resource regressions
- Operational blast radius
- Regulatory or financial sensitivity
- Cost and reliability constraints (where applicable)

Avoid:
- Overengineering for local/internal tools.
- Underengineering for distributed/public systems.

------------------------------------------------------------------------

## Project Classification Reference

Use canonical project-type terminology from:
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md`

This guide applies performance requirements by canonical type and does not redefine taxonomy.

------------------------------------------------------------------------

## Performance Requirement Dimensions

Define each dimension with a short normative definition (what it means and what "compliance" looks like).

The guide MUST include at minimum these dimensions:

1. Performance Targets / Budgets
   - Whether targets/budgets must be defined and tracked.
   - Compliance means expected performance behavior is documented and reviewed for the project scope.

2. Profiling Requirement
   - When profiling is required (pre-release, regressions, hotspots).
   - Compliance means profiling is performed at required checkpoints and findings are documented.

3. Benchmarking Requirement
   - When benchmarks are required (microbench + scenario/functional).
   - NOTE: No tool mandates.
   - Compliance means representative benchmark evidence is recorded before relevant releases or changes.

4. Load / Stress Testing Requirement
   - When load/stress tests are required (APIs, financial-sensitive, public services).
   - Compliance means load/stress validation is executed and outcomes are documented for release decisions.

5. Runtime Monitoring / Telemetry Requirement
   - When runtime monitoring is required (error rates, latency, resource usage).
   - Keep tool-agnostic.
   - Compliance means production-relevant observability expectations are defined and traceable.

6. Regression Prevention
   - How performance regressions must be caught (review gates, baseline comparisons, CI checks),
     without specifying exact tooling.
   - Compliance means a repeatable gate exists to detect and block material regressions.

------------------------------------------------------------------------

## Performance Requirement Matrix

Provide a table with the following columns:

For canonical project-type meanings, refer to `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.
Matrix Reading Aid:
- `Type Alpha` to `Type Zeta` are abstract row labels for matrix scan reading.
- Canonical project-type meanings are defined in `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

| Project Type | Targets/Budgets Required | Profiling Required | Benchmarking Required | Load/Stress Testing Required | Runtime Monitoring Required | Regression Prevention Required |
|---|---|---|---|---|---|---|
| Type Alpha | MAY | MAY | MAY | NOT REQUIRED | NOT REQUIRED | MAY |
| Type Beta | SHOULD | SHOULD | SHOULD | MAY | SHOULD | SHOULD |
| Type Gamma | SHOULD | SHOULD | SHOULD | MAY | SHOULD | SHOULD |
| Type Delta | MUST | MUST | SHOULD | MUST | MUST | MUST |
| Type Epsilon | MUST | MUST | MUST | MUST | MUST | MUST |
| Type Zeta | MUST | MUST | MUST | MUST | MUST | MUST |

Each cell MUST use exactly one of:
- MUST
- SHOULD
- MAY
- NOT REQUIRED

------------------------------------------------------------------------

## Requirement Definitions

For each dimension, define:

- What MUST/SHOULD/MAY/NOT REQUIRED means in practical terms.
- Typical evidence of compliance (examples), without mandating tools.

Examples (non-binding):
- "Documented budget in docs/engineering/performance.md"
- "Profiling notes attached to PR"
- "Benchmark results captured before release"
- "Load test run documented in release notes"
- "Monitoring dashboard link in ops docs"
- "CI check that prevents obvious regressions"

Normative interpretation for all dimensions:
- MUST: Required for the project type; missing evidence blocks release readiness.
- SHOULD: Expected by default; omission requires explicit rationale in governance/release docs.
- MAY: Optional; apply when risk, scale, or change profile justifies it.
- NOT REQUIRED: No baseline obligation; teams may still adopt voluntarily.

Dimension-specific practical meaning and evidence:

### Performance Targets / Budgets
- MUST/SHOULD: Define and maintain project-appropriate targets in `docs/engineering/performance.md`.
- MAY: Targets can be lightweight and change-focused.
- NOT REQUIRED: No baseline target definition required.
- Evidence: documented targets, PR references to updated targets, release note mention of target impact.

### Profiling Requirement
- MUST/SHOULD: Profile hotspots, major changes, or release candidates and document findings.
- MAY: Profile when risk indicators appear.
- NOT REQUIRED: Profiling is discretionary.
- Evidence: profiling summary in PR/release docs, captured hotspots, decision notes.

### Benchmarking Requirement
- MUST/SHOULD: Run representative benchmarks for critical paths and compare to prior baseline.
- MAY: Run benchmarks for significant refactors or suspected regressions.
- NOT REQUIRED: Benchmarking is discretionary.
- Evidence: benchmark result summary, baseline comparison notes, documented interpretation.

### Load / Stress Testing Requirement
- MUST/SHOULD: Execute and document load/stress tests before release when service exposure warrants it.
- MAY: Execute for selected scenarios.
- NOT REQUIRED: No baseline load/stress test obligation.
- Evidence: test scope summary, execution notes, pass/fail decision rationale.

### Runtime Monitoring / Telemetry Requirement
- MUST/SHOULD: Define runtime observability expectations for latency, error behavior, and resource trends.
- MAY: Add monitoring selectively for higher-risk components.
- NOT REQUIRED: No runtime monitoring baseline requirement.
- Evidence: monitoring plan references, operations links, incident/release annotations.

### Regression Prevention
- MUST/SHOULD: Maintain a repeatable gate to detect regressions before release.
- MAY: Use lightweight manual checks.
- NOT REQUIRED: No dedicated regression gate required.
- Evidence: review checklist entries, baseline comparison artifacts, CI/manual gate notes.

------------------------------------------------------------------------

## Governance Boundary

This guide:

- MUST NOT override project-level decisions documented in:
  `docs/engineering/performance.md`
- MUST NOT introduce new workflows or enforcement mechanisms.
- MUST NOT specify tools or numeric thresholds.
- MUST NOT modify BMAD Feature governance.

------------------------------------------------------------------------

## Version

Initial baseline established at v1.0.0.
