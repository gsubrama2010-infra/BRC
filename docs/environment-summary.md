# Snowflake Environment Summary

## Overview

| | DEV | QA | PROD |
|---|---|---|---|
| **Status** | Active | Pending account config | Not yet configured |
| **Snowflake Org** | SPYPLHP | SPYPLHP | SPYPLHP |
| **Snowflake Account** | VU59987 | TBD | TBD |
| **Service User** | GSUBRAMA | TBD | TBD |
| **Terraform State** | S3: `environments/dev/terraform.tfstate` | S3: `environments/qa/terraform.tfstate` | S3: `environments/prod/terraform.tfstate` |
| **GitHub Secret (RSA Key)** | `SNOWFLAKE_PRIVATE_KEY` | `SNOWFLAKE_QA_PRIVATE_KEY` | TBD |
| **Sandbox Schemas** | Yes | No | No |
| **Human write access** | Yes | Read-only (service accounts only for DML/DDL) | TBD |

---

## Infrastructure

### Warehouses (all XSMALL, auto-suspend/resume)

| Warehouse | DEV | QA | PROD |
|---|---|---|---|
| Bronze ingest | `XS_BRONZE` | `qa_wh_bronze` | TBD |
| Silver transform | `XS_SILVER` | `qa_wh_silver` | TBD |
| Gold consumption | `XS_GOLD` | `qa_wh_gold` | TBD |
| Sigma reporting | `XS_SIGMA` | `qa_wh_sigma` | TBD |
| Braze | `XS_BRAZE` | `qa_wh_braze` | TBD |

### Databases

| Database | Purpose | DEV | QA | PROD |
|---|---|---|---|---|
| Bronze | Raw ingest / staging | `DLSTAGE_BRONZE` | `DLSTAGE_BRONZE` | TBD |
| Silver | Cleansed snapshots | `DLSNAPSHOT_SILVER` | `DLSNAPSHOT_SILVER` | TBD |
| Gold | Consumption / reporting | `DLCONSUMPTION_GOLD` | `DLCONSUMPTION_GOLD` | TBD |
| Admin | Integration metadata | `ADMIN_INTEGRATION_DB` | `ADMIN_INTEGRATION_DB` | TBD |

### Schemas

| | DEV | QA | PROD |
|---|---|---|---|
| Total schemas | 71 | 67 | TBD |
| Sandbox schemas | Yes (per-user) | No | No |
| Sources covered | RDS, ERP systems, and other upstream sources across Bronze & Silver | Same as DEV (minus sandbox) | TBD |

---

## RBAC Roles

### Functional Roles

| Role | DEV | QA | PROD | Purpose |
|---|---|---|---|---|
| `MFSG_DATAENG_ROLE_RW` | ✅ | ✅ | TBD | Data engineering read/write |
| `MFSG_DATAENG_ROLE_RO` | ✅ | ✅ | TBD | Data engineering read-only |
| `MFSG_DBT_RUNNER` | ✅ | ✅ | TBD | dbt transformation service account |
| `MFSG_DBT_READONLY` | ✅ | ✅ | TBD | dbt read-only access |
| `MFSG_TERRAFORM_ADMIN` | ✅ | ✅ | TBD | Terraform infrastructure management |
| `MFSG_OPENFLOW_ADMIN` | ✅ | ✅ | TBD | Openflow pipeline admin |
| `MFSG_OPENFLOW_DEVELOPER` | ✅ | ✅ | TBD | Openflow pipeline developer |
| `MFSG_OPENFLOW_MONITOR` | ✅ | ✅ | TBD | Openflow pipeline monitoring |
| `MFSG_SIGMA_READER_ROLE` | ✅ | ✅ | TBD | Sigma BI read access |
| `MFSG_BRAZE_READER_ROLE` | ✅ | ✅ | TBD | Braze marketing read access |
| `MFSG_PII_UNMASKED_ROLE` | ✅ | ✅ | TBD | Full PII data access (unmasked) |
| `MFSG_PII_FINANCIAL_ROLE` | ✅ | ✅ | TBD | Financial PII access |
| `MFSG_PII_HR_ROLE` | ✅ | ✅ | TBD | HR PII access |
| `MFSG_DATA_GOVERNANCE_ROLE` | ❌ | ❌ | TBD | Data governance (PROD only) |
| Consumer RO roles (7) | ✅ | ✅ | TBD | Domain-specific read-only consumers |

### Hierarchy Roles (QA and above)

| Role | Purpose |
|---|---|
| `MFSG_PLATFORM_ROLE` | Groups data engineering and platform functional roles |
| `MFSG_PIPELINE_ROLE` | Groups Openflow and dbt pipeline roles |
| `MFSG_SECURITY_ROLE` | Groups PII and masking policy roles |

> DEV does not use intermediate hierarchy roles — functional roles are granted directly.

---

## CI/CD Pipeline

| | DEV | QA | PROD |
|---|---|---|---|
| **Workflow file** | `terraform-ci.yml` | `terraform-ci-qa.yml` | Not yet created |
| **Trigger** | Manual (`workflow_dispatch`) | Manual (`workflow_dispatch`) | — |
| **Plan** | ✅ | ✅ | — |
| **Apply** | ✅ Manual approval via input | ✅ Manual approval via input | — |
| **AWS Auth** | OIDC → `mfsg-github-actions-role` | OIDC → `mfsg-github-actions-role` | — |

---

## Pending Actions

### QA
- [ ] Provision QA Snowflake account and service user
- [ ] Update `environments/qa/provider.tf`: replace `REPLACE_WITH_QA_ACCOUNT` and `REPLACE_WITH_QA_USER`
- [ ] Generate RSA key pair for QA service user
- [ ] Add `SNOWFLAKE_QA_PRIVATE_KEY` to GitHub repo secrets
- [ ] Run QA pipeline to provision resources

### PROD
- [ ] Provision PROD Snowflake account and service user
- [ ] Populate `environments/prod/terraform.tfvars` from PROD tab in the Excel RBAC spec
- [ ] Populate `environments/prod/main.tf` with module calls
- [ ] Update `environments/prod/provider.tf`: replace `REPLACE_WITH_PROD_ACCOUNT` and `REPLACE_WITH_PROD_USER`
- [ ] Generate RSA key pair for PROD service user
- [ ] Add PROD RSA key to GitHub repo secrets
- [ ] Create `terraform-ci-prod.yml` workflow
- [ ] Run PROD pipeline to provision resources
