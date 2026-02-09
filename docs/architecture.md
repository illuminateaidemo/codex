# Architecture

## 1. Logical architecture

The platform follows a modular, domain-oriented architecture with shared identity, workflow, and reporting services.

- **Experience layer**
  - Web app (desktop-first responsive)
  - Mobile-responsive views for time and expenses
  - Notification channels (email, in-app)
- **Application layer**
  - Client & Demand service
  - Project service
  - Resource service
  - Time service
  - Expense service
  - Financial Control service
  - Approval Workflow service
  - Reporting API service
- **Platform services**
  - Identity and Access Management (SSO + MFA)
  - RBAC + policy engine
  - Audit logging service
  - Document storage (expense evidence)
  - Integration service (ERP/Finance, BI, HRIS)
- **Data layer**
  - Transactional relational database
  - Reporting data mart (star schema)
  - Immutable audit/event store

## 2. Key design principles

1. **Single source of truth**: all project, allocation, time, expense, and financial status is mastered in one platform.
2. **Separation of duties**: approvals enforce governance and role boundaries.
3. **Configurable workflows**: thresholds, approvals, period locking, and policy rules are metadata-driven.
4. **API-first integration**: ERP, payroll, CRM, and BI tools consume governed APIs/events.
5. **Audit by default**: all approvals and material field changes produce immutable audit records.

## 3. Integration boundaries

- **Inbound**
  - CRM opportunities
  - HRIS worker profile and employment status
  - Cost rates and organisational hierarchy
- **Outbound**
  - Approved time and expenses for payroll/AP
  - Billing-ready entries and milestones to ERP
  - Standard data extracts to enterprise analytics

## 4. Scalability and resilience

- Stateless services behind load balancers
- Queue-backed async processing for notifications, exports, and heavy rollups
- Partitioned transactional tables for high-volume time/expense entries
- Read replicas and cached aggregate views for dashboards
- RPO/RTO aligned to enterprise recovery targets

## 5. Security and compliance

- SSO (SAML/OIDC), MFA, and session controls
- Row-level and field-level access policies
- Encryption at rest and in transit
- Full audit trail of create/update/approve/reject/close actions
- Configurable retention and legal hold for financial records

