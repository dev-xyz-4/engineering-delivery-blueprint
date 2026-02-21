# SECURITY_SCOPE_GUIDE

## Purpose

This document defines normative security governance scope for this repository.
It standardizes how security depth is classified by project type and risk profile.

Security level must be selected during project initialization and documented in `docs/00-project/risk-profile.md`.

This guide defines:
- project type classification
- security levels (`Minimal`, `Standard`, `Extended`)
- required security control depth per level
- escalation triggers and examples

This guide does not define implementation automation, CI policies, or technical enforcement.

---

## Design Principle

Security depth is selected according to project type and risk profile.

If multiple project types apply, use the higher-risk type.

---

## Project Classification Matrix

Use canonical terminology from `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

Use the closest primary project type from the canonical taxonomy owner:
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md`

This guide does not redefine project-type taxonomy.

---

## Requirement Dimensions

### Security Levels

- `Minimal`: baseline controls for low exposure and low impact.
- `Standard`: default controls for public/user-facing production systems.
- `Extended`: high-assurance controls for high-impact or high-risk systems.

### Security Control Categories

Required categories for every level:
All control categories apply at all levels; depth varies by level.
- Dependency management
- Input validation
- Secrets handling
- Access control
- Logging & monitoring
- Release integrity

---

## Requirement Matrix

### Baseline Mapping By Project Type

Project types are defined in docs/engineering/guides/PROJECT_CLASSIFICATION.md.
Matrix reading aid:
- `Type Alpha` to `Type Delta` are abstract row labels for quick matrix scanning.
- Canonical project-type meanings are defined in `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

| Project Type | Default Level |
|---|---|
| Type Alpha | Minimal |
| Type Beta | Standard |
| Type Gamma | Standard |
| Type Delta | Extended |

Escalate above default when triggers in Requirement Definitions are present.

### Required Depth By Level

| Control Category | Minimal | Standard | Extended |
|---|---|---|---|
| Dependency management | Locked dependencies and routine updates | + vulnerability triage with defined remediation window | + strict provenance policy and higher review depth |
| Input validation | Basic validation at external boundaries | + centralized validation rules and negative-case coverage | + defensive validation model with abuse-case focus |
| Secrets handling | No hardcoded secrets; local handling rules | + managed secret storage and rotation policy | + strict least-access, rotation cadence, and incident playbook |
| Access control | Basic role/path restrictions where applicable | + explicit authorization model and review checkpoints | + high-assurance authorization boundaries and auditability |
| Logging & monitoring | Core security-relevant events logged | + alertable signals and retention policy | + high-fidelity audit logging with escalation runbooks |
| Release integrity | Reproducible release process and trusted sources | + signed or verifiable artifacts and release checks | + hardened release chain with separation of duties |

---

## Requirement Definitions

### Escalation Criteria Between Levels

Escalate from `Minimal` to `Standard` when one or more applies:
- internet exposure is introduced
- external user data is processed
- authentication/authorization is introduced
- third-party integrations increase attack surface

Escalate from `Standard` to `Extended` when one or more applies:
- custody/signing or irreversible transactions are introduced
- financial loss risk is material
- regulatory/compliance obligations require stronger assurance
- high-value targets or elevated adversarial interest are expected

De-escalation requires explicit rationale and risk acceptance.

### Classification Examples

- Local CLI helper, no remote interface, no secrets at runtime -> `Minimal`
- Public SaaS dashboard with user accounts and APIs -> `Standard`
- Wallet-enabled dApp with transaction signing -> `Extended`
- Payment orchestration service with settlement operations -> `Extended`

If uncertain, choose the higher level and document rationale.

---

## Governance Boundary

This guide:

- MUST NOT override project-level decisions documented in instance documents (e.g., `docs/engineering/security.md`, `docs/engineering/testing.md`).
- MUST NOT introduce new workflows or enforcement mechanisms.
- MUST NOT mandate vendors, tools, or specific implementations.
- MUST NOT modify BMAD Feature governance.

---

## Version

Initial baseline established at v1.0.0.
