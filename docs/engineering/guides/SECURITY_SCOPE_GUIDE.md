# SECURITY_SCOPE_GUIDE

## 1) Purpose And Scope

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

## 2) Project Type Classification

Use the closest primary project type:

- `Local Tool`: local-only utility with no external user exposure.
- `Desktop App`: distributed client application, limited remote surface.
- `Public Web App`: internet-facing application with user traffic.
- `Web3 App`: blockchain-integrated app with wallet/signing interactions.
- `Financial-Critical App`: systems handling high-impact financial operations.

If multiple types apply, use the higher-risk type.

---

## 3) Security Level Matrix

### 3.1 Level Definitions

- `Minimal`: baseline controls for low exposure and low impact.
- `Standard`: default controls for public/user-facing production systems.
- `Extended`: high-assurance controls for high-impact or high-risk systems.

### 3.2 Baseline Mapping By Project Type

| Project Type | Default Level |
|---|---|
| Local Tool | Minimal |
| Desktop App | Standard |
| Public Web App | Standard |
| Web3 App | Extended |
| Financial-Critical App | Extended |

Escalate above default when triggers in section 5 are present.

---

## 4) Required Security Controls By Level

### 4.1 Control Categories

Required categories for every level:
All control categories apply at all levels; depth varies by level.
- Dependency management
- Input validation
- Secrets handling
- Access control
- Logging & monitoring
- Release integrity

### 4.2 Required Depth By Level

| Control Category | Minimal | Standard | Extended |
|---|---|---|---|
| Dependency management | Locked dependencies and routine updates | + vulnerability triage with defined remediation window | + strict provenance policy and higher review depth |
| Input validation | Basic validation at external boundaries | + centralized validation rules and negative-case coverage | + defensive validation model with abuse-case focus |
| Secrets handling | No hardcoded secrets; local handling rules | + managed secret storage and rotation policy | + strict least-access, rotation cadence, and incident playbook |
| Access control | Basic role/path restrictions where applicable | + explicit authorization model and review checkpoints | + high-assurance authorization boundaries and auditability |
| Logging & monitoring | Core security-relevant events logged | + alertable signals and retention policy | + high-fidelity audit logging with escalation runbooks |
| Release integrity | Reproducible release process and trusted sources | + signed or verifiable artifacts and release checks | + hardened release chain with separation of duties |

---

## 5) Escalation Criteria Between Levels

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

---

## 6) Classification Examples

- Local CLI helper, no remote interface, no secrets at runtime -> `Minimal`
- Public SaaS dashboard with user accounts and APIs -> `Standard`
- Wallet-enabled dApp with transaction signing -> `Extended`
- Payment orchestration service with settlement operations -> `Extended`

If uncertain, choose the higher level and document rationale.

---

## 7) Governance Boundaries

This document is governance-only.

- It defines scope and minimum control expectations.
- It does not mandate CI jobs, automation tooling, or enforcement implementation.
- Enforcement, operational controls, and automation are defined in separate engineering/security operations artifacts.
