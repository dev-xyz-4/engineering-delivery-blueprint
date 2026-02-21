# OBSERVABILITY SCOPE GUIDE

Generated on: 2026-02-15

------------------------------------------------------------------------

## Purpose

Define minimum observability governance requirements depending on project type and distribution model.

This guide:
- Defines scope-dependent requirements.
- Does NOT define project-specific observability targets (see `docs/engineering/observability.md`).
- Does NOT alter BMAD workflow rules.
- Avoids tool mandates and avoids hard numeric thresholds.

------------------------------------------------------------------------

## Design Principle

Observability requirements scale with:

- Distribution surface
- User and business impact of detection/diagnosis delays
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

This guide applies observability requirements by canonical type and does not redefine taxonomy.

------------------------------------------------------------------------

## Observability Requirement Dimensions

Define each dimension with a short normative definition (what it means and what "compliance" looks like).

The guide MUST include at minimum these dimensions:

1. Signals Coverage
   - Whether logs, metrics, traces, or equivalent signals are required for diagnosis.
   - Compliance means critical runtime behavior can be observed through documented signal coverage.

2. Alerting & On-call Readiness
   - When alerting and response readiness are required.
   - Compliance means actionable alert paths and responder expectations are documented.

3. Incident Response Readiness
   - Runbook and postmortem expectations for relevant incident classes.
   - Compliance means incident handling procedures are documented and used for material incidents.

4. Ownership & Tagging Governance
   - Service/component ownership and consistent tagging/classification of telemetry.
   - Compliance means ownership and classification conventions are defined and applied consistently.

5. Retention & Cost Governance
   - Telemetry lifecycle expectations to control data sprawl and cost risk.
   - Compliance means retention and cost-awareness policies are documented and reviewed.

6. Dashboards & Operational Views
   - Minimum operational visibility for service health and degraded behavior.
   - Compliance means project-appropriate operational views are defined and maintained.

7. Regression / Change Tracking
   - Ability to correlate incidents/regressions with deployments/releases/changes.
   - Compliance means change markers or equivalent traceability is available in operational review.

------------------------------------------------------------------------

## Observability Requirement Matrix

For canonical project-type meanings, refer to `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.
Matrix Reading Aid:
- `Type Alpha` to `Type Zeta` are abstract row labels for matrix scan reading.
- Canonical project-type meanings are defined in `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

| Project Type | Signals Coverage Required | Alerting & On-call Readiness Required | Incident Response Readiness Required | Ownership & Tagging Governance Required | Retention & Cost Governance Required | Dashboards & Operational Views Required | Regression / Change Tracking Required |
|---|---|---|---|---|---|---|---|
| Type Alpha | MAY | NOT REQUIRED | MAY | MAY | MAY | MAY | MAY |
| Type Beta | SHOULD | MAY | SHOULD | SHOULD | SHOULD | SHOULD | SHOULD |
| Type Gamma | SHOULD | MAY | SHOULD | SHOULD | SHOULD | SHOULD | SHOULD |
| Type Delta | MUST | MUST | MUST | MUST | MUST | MUST | MUST |
| Type Epsilon | MUST | MUST | MUST | MUST | MUST | MUST | MUST |
| Type Zeta | MUST | MUST | MUST | MUST | MUST | MUST | MUST |

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
- "Signal catalog documented in docs/engineering/observability.md"
- "Alert routing and escalation notes linked in operations docs"
- "Runbook references attached to incident records"
- "Ownership map documented per service/component"
- "Retention policy and review notes in governance docs"
- "Operational dashboard inventory maintained"
- "Release/change markers referenced in incident analysis"

Normative interpretation for all dimensions:
- MUST: Required for the project type; missing evidence blocks operational readiness.
- SHOULD: Expected by default; omission requires explicit rationale in governance/release docs.
- MAY: Optional; apply when risk, scale, or change profile justifies it.
- NOT REQUIRED: No baseline obligation; teams may still adopt voluntarily.

Dimension-specific practical meaning and evidence:

### Signals Coverage
- MUST/SHOULD: Define and maintain project-appropriate signal coverage for critical paths.
- MAY: Define focused signal coverage around likely fault areas.
- NOT REQUIRED: Signal coverage is discretionary.
- Evidence: signal catalog, event/metric/tracing coverage notes, operations review notes.

### Alerting & On-call Readiness
- MUST/SHOULD: Define actionable alert conditions and responder ownership/escalation.
- MAY: Provide lightweight alerting/notification for selected high-risk events.
- NOT REQUIRED: No baseline alerting/on-call requirement.
- Evidence: escalation notes, responder mapping, alert review checklist.

### Incident Response Readiness
- MUST/SHOULD: Maintain runbook guidance and capture post-incident learning for material incidents.
- MAY: Maintain ad hoc response notes for occasional incidents.
- NOT REQUIRED: Formal incident response artifacts are discretionary.
- Evidence: runbook references, post-incident summaries, remediation tracking notes.

### Ownership & Tagging Governance
- MUST/SHOULD: Define ownership mapping and consistent telemetry tagging/classification conventions.
- MAY: Apply ownership/tagging for core components only.
- NOT REQUIRED: Ownership/tagging formalization is discretionary.
- Evidence: ownership registry, tagging guideline, service metadata review notes.

### Retention & Cost Governance
- MUST/SHOULD: Define telemetry retention and cost-awareness review expectations.
- MAY: Apply lightweight retention/cost review at release checkpoints.
- NOT REQUIRED: No baseline retention/cost governance requirement.
- Evidence: retention policy notes, cost review entries, cleanup decisions.

### Dashboards & Operational Views
- MUST/SHOULD: Maintain operational views covering service health and degraded behavior.
- MAY: Maintain minimal operational snapshots for important flows.
- NOT REQUIRED: Dashboards/operational views are discretionary.
- Evidence: operations view inventory, health-view update notes, release readiness checklist.

### Regression / Change Tracking
- MUST/SHOULD: Correlate operational regressions with releases/deployments/changes.
- MAY: Use lightweight release marker notes and periodic manual correlation.
- NOT REQUIRED: Formal change-correlation is discretionary.
- Evidence: change marker references, incident timeline notes, release correlation records.

------------------------------------------------------------------------

## Governance Boundary

This guide:

- MUST NOT override project-level decisions documented in:
  `docs/engineering/observability.md`
- MUST NOT introduce new workflows or enforcement mechanisms.
- MUST NOT specify tools or numeric thresholds.
- MUST NOT modify BMAD Feature governance.

------------------------------------------------------------------------

## Version

Initial baseline established at v1.0.0.
