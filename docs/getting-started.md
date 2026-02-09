# Getting started

This repository is an **enterprise solution blueprint**, not a fully implemented runtime application yet.

Use it to design and stand up your Project Intelligence Platform in phases.

## 1) Understand what each artifact is for

- `README.md`: business context, platform scope, and module boundaries.
- `docs/architecture.md`: target architecture and integration boundaries.
- `docs/workflows.md`: end-to-end process behavior and approvals.
- `docs/rbac-matrix.md`: role/capability design baseline.
- `docs/non-functional-and-success.md`: NFR checklist and success criteria.
- `db/schema.sql`: baseline relational model for transactional data.
- `api/openapi.yaml`: API contract starter for service implementation.

## 2) Run a discovery workshop

Use the docs to confirm:

1. Your practices/geographies and legal entities.
2. Approval policies (time, expenses, staffing, period close).
3. Commercial models (T&M, milestone, fixed fee).
4. Required integrations (CRM, HRIS, ERP, BI).

Capture variances before implementation.

## 3) Instantiate a development baseline

### Database

Apply `db/schema.sql` to your RDBMS (PostgreSQL, SQL Server, etc.) with syntax adjustments if needed.

Example (PostgreSQL):

```bash
psql "$DATABASE_URL" -f db/schema.sql
```

### API

Import `api/openapi.yaml` into your API tooling (Swagger Editor, Stoplight, Postman, code generators).

Common next steps:

- Generate server stubs for your backend framework.
- Generate typed client SDKs for web/mobile apps.
- Add request/response schemas incrementally per endpoint.

## 4) Deliver in recommended increments

1. **Foundation**: identity, RBAC, org/client/project master data.
2. **Operational core**: resource allocations + weekly time entry/approval.
3. **Control layer**: expense workflows, period close, billing readiness.
4. **Insight layer**: dashboards, variance trending, forecast accuracy.

## 5) Define governance from day one

- Turn on immutable audit logging for every approval and key state transition.
- Enforce period locks for financial integrity.
- Ensure separation of duties between delivery, resource, and finance approvals.

## 6) Production hardening checklist

Before rollout, validate against `docs/non-functional-and-success.md`:

- SSO/MFA and least-privilege access
- Performance under expected timesheet volumes
- Backup/restore and DR tests
- Accessibility and mobile usability
- ERP export idempotency and reconciliation

## 7) How teams typically use this repository

- **Enterprise architects**: architecture and integration design baseline.
- **Product owners/PMO**: workflow and governance definition.
- **Engineering teams**: schema/API starter for implementation.
- **Finance leaders**: billing-readiness and period control requirements.
- **Data/BI teams**: KPI definitions and reporting feed planning.

