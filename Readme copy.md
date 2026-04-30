Snowflake Terraform Infrastructure

This project provisions Snowflake infrastructure using Terraform including:

Warehouses

Databases

Schemas

Account Roles

Role hierarchy

Privilege grants

The infrastructure is modularized to ensure reusability, scalability, and easier management across environments.

Snowflake Object Hierarchy

Snowflake Account
│
├── Warehouses
│     ├── ETL_WH
│     └── BI_WH
│
├── Databases
│     └── ANALYTICS_DB
│           ├── RAW
│           └── CURATED
│
└── Roles
      ├── SYSADMIN
      │     └── DATAENG_DEV_SILVER
      │
      └── ANALYST_ROLE

Project Structure

terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── README.md
│
└── modules/
    │
    ├── warehouse/
    │     ├── main.tf
    │     ├── variables.tf
    │     └── outputs.tf
    │
    ├── database/
    │     ├── main.tf
    │     ├── variables.tf
    │     └── outputs.tf
    │
    ├── schema/
    │     ├── main.tf
    │     ├── variables.tf
    │     └── outputs.tf
    │
    └── account_role/
          ├── main.tf
          ├── variables.tf
          └── outputs.tf

Terraform Modules
1 Warehouse Module

Creates Snowflake virtual warehouses.

Resources

snowflake_warehouse

2 Database Module

Creates Snowflake databases.

Resources
snowflake_database

3 Schema Module

Creates schemas inside databases.

Resources
snowflake_schema

4 Account Role Module

Manages:

Account roles

Role hierarchy

Privilege grants

Resources
snowflake_account_role
snowflake_grant_account_role
snowflake_grant_privileges_to_account_role
Example
account_roles = {
  dataeng_role = {
    name = "DATAENG_DEV_SILVER"
  }
}
Role Hierarchy
SYSADMIN
   │
   └── DATAENG_DEV_SILVER
           │
           └── Privileges on databases / schemas / warehouses
Privilege Grant Example
role_privilege_grants = {

  db_usage = {
    account_role_name = "DATAENG_DEV_SILVER"
    privileges        = ["USAGE"]

    on_account_object = {
      object_type = "DATABASE"
      object_name = "ANALYTICS_DB"
    }
  }

}
Terraform Variables
Provider Variables
Variable	Description
snowflake_account	Snowflake account name
snowflake_user	Snowflake user
snowflake_password	Snowflake password
snowflake_role	Role used by Terraform
Example terraform.tfvars
snowflake_account  = "my_account"
snowflake_user     = "terraform_user"
snowflake_password = "password"
snowflake_role     = "SYSADMIN"

parent_role_name = "SYSADMIN"
Terraform Commands

Initialize Terraform:

terraform init

Validate configuration:

terraform validate

Format code:

terraform fmt -recursive

Preview infrastructure changes:

terraform plan

Apply infrastructure:

terraform apply

Destroy infrastructure:

terraform destroy
Provider

Terraform uses the Snowflake provider.

snowflakedb/snowflake
Best Practices

✔ Use modules for reusable infrastructure
✔ Use for_each for scalable resource creation
✔ Keep environment variables in tfvars
✔ Use role hierarchy for access control
✔ Manage Snowflake objects through Terraform only

Troubleshooting
Provider errors

Reset Terraform cache:

rm -rf .terraform
terraform init
Debug logs

Enable:

set TF_LOG=DEBUG

Disable:

set TF_LOG=
Future Improvements

Possible extensions:

Role-based access modules

Data masking policies

Snowflake resource monitors

Network policies

External stages

Storage integrations

