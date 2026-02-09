-- Project Intelligence Platform foundational schema

create table organisations (
  id uuid primary key,
  name varchar(255) not null,
  type varchar(50) not null, -- CLIENT, INTERNAL
  status varchar(30) not null,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table users (
  id uuid primary key,
  email varchar(255) unique not null,
  full_name varchar(255) not null,
  office varchar(100),
  geography varchar(100),
  active boolean not null default true,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table roles (
  id uuid primary key,
  code varchar(50) unique not null,
  name varchar(100) not null
);

create table user_roles (
  user_id uuid not null references users(id),
  role_id uuid not null references roles(id),
  scope_type varchar(50),
  scope_value varchar(100),
  primary key (user_id, role_id, scope_type, scope_value)
);

create table opportunities (
  id uuid primary key,
  client_org_id uuid not null references organisations(id),
  owner_user_id uuid not null references users(id),
  name varchar(255) not null,
  stage varchar(50) not null,
  value_amount numeric(18,2) not null,
  value_currency varchar(3) not null,
  probability_percent numeric(5,2) not null,
  expected_start_date date,
  expected_end_date date,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table projects (
  id uuid primary key,
  opportunity_id uuid references opportunities(id),
  client_org_id uuid not null references organisations(id),
  project_manager_id uuid not null references users(id),
  code varchar(50) unique not null,
  name varchar(255) not null,
  status varchar(30) not null,
  commercial_model varchar(30) not null,
  start_date date,
  end_date date,
  budget_effort_hours numeric(18,2),
  budget_cost numeric(18,2),
  budget_revenue numeric(18,2),
  created_at timestamp not null,
  updated_at timestamp not null
);

create table project_health_snapshots (
  id uuid primary key,
  project_id uuid not null references projects(id),
  health_rag varchar(10) not null,
  schedule_rag varchar(10) not null,
  cost_rag varchar(10) not null,
  scope_rag varchar(10) not null,
  narrative text,
  created_by uuid not null references users(id),
  created_at timestamp not null
);

create table resource_demands (
  id uuid primary key,
  project_id uuid not null references projects(id),
  role_name varchar(100) not null,
  skill varchar(100),
  location varchar(100),
  start_date date not null,
  end_date date not null,
  requested_hours numeric(18,2) not null,
  status varchar(30) not null,
  created_by uuid not null references users(id),
  created_at timestamp not null
);

create table allocations (
  id uuid primary key,
  project_id uuid not null references projects(id),
  user_id uuid not null references users(id),
  start_date date not null,
  end_date date not null,
  allocation_percent numeric(5,2) not null,
  status varchar(30) not null,
  approved_by uuid references users(id),
  approved_at timestamp,
  created_at timestamp not null
);

create table fiscal_periods (
  id uuid primary key,
  name varchar(30) unique not null,
  start_date date not null,
  end_date date not null,
  status varchar(30) not null, -- OPEN, CLOSED
  locked_at timestamp,
  locked_by uuid references users(id)
);

create table time_entries (
  id uuid primary key,
  user_id uuid not null references users(id),
  project_id uuid not null references projects(id),
  allocation_id uuid references allocations(id),
  work_date date not null,
  hours numeric(6,2) not null,
  activity_code varchar(50) not null,
  status varchar(30) not null,
  fiscal_period_id uuid not null references fiscal_periods(id),
  submitted_at timestamp,
  approved_by uuid references users(id),
  approved_at timestamp,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table expenses (
  id uuid primary key,
  user_id uuid not null references users(id),
  project_id uuid not null references projects(id),
  expense_date date not null,
  category varchar(50) not null,
  amount numeric(18,2) not null,
  currency varchar(3) not null,
  policy_status varchar(30) not null,
  workflow_status varchar(30) not null,
  receipt_uri varchar(500),
  approved_by uuid references users(id),
  approved_at timestamp,
  fiscal_period_id uuid not null references fiscal_periods(id),
  created_at timestamp not null,
  updated_at timestamp not null
);

create table billing_items (
  id uuid primary key,
  project_id uuid not null references projects(id),
  source_type varchar(30) not null, -- TIME, EXPENSE, MILESTONE
  source_id uuid,
  billable_amount numeric(18,2) not null,
  currency varchar(3) not null,
  billing_status varchar(30) not null, -- WIP, READY, EXPORTED, BILLED
  erp_reference varchar(100),
  created_at timestamp not null,
  updated_at timestamp not null
);

create table approvals (
  id uuid primary key,
  entity_type varchar(50) not null,
  entity_id uuid not null,
  workflow_type varchar(50) not null,
  status varchar(30) not null,
  step_order int not null,
  approver_id uuid references users(id),
  decision varchar(30),
  decision_note text,
  decided_at timestamp,
  created_at timestamp not null
);

create table audit_log (
  id uuid primary key,
  actor_user_id uuid references users(id),
  entity_type varchar(50) not null,
  entity_id uuid not null,
  action varchar(50) not null,
  before_json text,
  after_json text,
  occurred_at timestamp not null
);

create index idx_time_entries_project_date on time_entries(project_id, work_date);
create index idx_expenses_project_date on expenses(project_id, expense_date);
create index idx_allocations_user_dates on allocations(user_id, start_date, end_date);
create index idx_billing_items_status on billing_items(billing_status);
create index idx_approvals_entity on approvals(entity_type, entity_id, status);
create index idx_audit_entity on audit_log(entity_type, entity_id, occurred_at);
