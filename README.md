# Project Intelligence Platform

Project Intelligence Platform is an enterprise-grade application blueprint for professional services organisations to manage the full lifecycle of project delivery, resourcing, time, cost, and financial performance.

## Outcomes

- Single source of truth for clients, opportunities, projects, resources, and delivery finance.
- Role-specific operational workflows for delivery, resourcing, and finance teams.
- Strong governance through configurable approvals, period controls, and complete auditability.
- Analytics-ready model for utilisation, margin, forecast accuracy, and project health.

## User roles

- Delivery Staff
- Project Manager
- Resource Manager
- Finance User
- Sales / Business Development
- System Administrator

## Core modules

1. Client & Demand Management
2. Project Management
3. Resource Management
4. Time Management
5. Expense Management
6. Financial Control & Billing Readiness
7. Governance & Approvals
8. Insight & Reporting

## Repository contents

- `api/openapi.yaml` – REST API contract for core platform capabilities.
- `db/schema.sql` – relational data model and audit foundations.
- `docs/architecture.md` – logical architecture and deployment guidance.
- `docs/workflows.md` – end-to-end process flows and approvals.
- `docs/rbac-matrix.md` – role-based access control model.
- `docs/non-functional-and-success.md` – NFRs, SLAs, and success measures.


## How do I use this?

Start with `docs/getting-started.md` for a practical implementation path from discovery through production hardening.

Quick summary:

1. Confirm target workflows, roles, and policies with stakeholders.
2. Apply `db/schema.sql` as your initial data model baseline.
3. Import `api/openapi.yaml` into API tooling to generate service/client scaffolds.
4. Deliver in phases: foundation -> time/resource core -> financial controls -> insights.
5. Validate non-functional readiness and success metrics before rollout.

## Suggested implementation approach

1. Stand up identity, RBAC, and foundational master data.
2. Deliver timesheets + resource planning first to replace spreadsheets.
3. Add project financial controls and billing readiness.
4. Roll out executive dashboards and enterprise analytics integrations.

