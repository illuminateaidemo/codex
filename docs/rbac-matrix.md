# RBAC matrix

| Capability | Delivery Staff | Project Manager | Resource Manager | Finance User | Sales/BD | System Admin |
|---|---|---|---|---|---|---|
| Manage clients/contacts | View | View | View | View | Create/Edit | Configure |
| Manage opportunities | View | View | View | View | Create/Edit | Configure |
| Convert opportunity to project | No | Approve/Create | Review | View | Request | Configure |
| Create/edit project baseline | No | Create/Edit | View | View | View | Configure |
| Update project health | No | Create/Edit | View | View | View | Configure |
| Raise resource demand | No | Create/Edit | Edit | View | No | Configure |
| Allocate resources | No | Propose | Create/Edit/Approve | View | No | Configure |
| Enter time | Create/Edit own | View team | View allocation impact | View | No | Configure |
| Approve time | No | Approve team | Optional delegate | Final control | No | Configure |
| Enter expenses | Create/Edit own | View team | No | View | No | Configure |
| Approve expenses | No | Approve project | No | Final control | No | Configure |
| Manage periods | No | No | No | Create/Edit/Close | No | Configure |
| Mark billing readiness | No | Recommend | No | Approve | No | Configure |
| Run dashboards | Role-specific | Role-specific | Role-specific | Role-specific | Role-specific | Full |
| Manage workflow rules | No | No | No | Limited | No | Full |
| Manage users/roles | No | No | No | No | No | Full |

## Notes

- Access should be enforced with both role membership and data scope (practice, legal entity, geography).
- Sensitive financial fields (cost rates, margin) are hidden from unauthorised roles.
- All approval actions require user identity, timestamp, and reason codes where configured.

