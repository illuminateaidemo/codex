# Non-functional requirements and success criteria

## Non-functional requirements

## 1. Security and auditability

- Enterprise SSO + MFA required.
- Least-privilege RBAC with configurable data scopes.
- Immutable audit logs for approvals and key record changes.
- Financial closure locks preventing post-close edits except controlled reopen workflows.

## 2. Performance and scale

- Support large user populations across multiple regions/practices.
- Responsive UX for high-frequency actions (time/expense entry and approvals).
- Asynchronous processing for reporting aggregates and exports.

## 3. Availability and reliability

- Highly available core services with automated failover.
- Backups, disaster recovery, and tested restoration procedures.
- Idempotent integrations for export/retry safety.

## 4. Accessibility and usability

- Desktop and mobile responsive interfaces.
- Accessibility standard adherence (e.g., WCAG-aligned controls, keyboard support).
- Minimal-click time and expense capture.

## 5. Configurability and extensibility

- Admin-configurable workflows, approval thresholds, fiscal periods, and policy rules.
- API/event extensibility for automation and AI insight use cases.

## Success criteria

The platform is successful when:

1. Delivery, resource, and finance decisions are made from governed system data rather than spreadsheets.
2. Timesheet and expense compliance improves while administrative overhead decreases.
3. Leadership has near-real-time views of utilisation, margin, forecast vs actual, and project health.
4. Project staffing conflicts and forecast surprises are identified earlier through forward demand visibility.
5. Financial close and billing readiness cycles are faster and more auditable.

