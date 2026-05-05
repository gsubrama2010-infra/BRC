##############################################################################
# QA ENVIRONMENT — terraform.tfvars
# All human users are READ-ONLY. DDL/DML is restricted to service accounts.
##############################################################################

warehouses = {
  qa_wh_bronze = {
    name              = "XS_BRONZE"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "QA env Bronze warehouse"
  }
  qa_wh_silver = {
    name              = "XS_SILVER"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "QA env Silver warehouse"
  }
  qa_wh_gold = {
    name              = "XS_GOLD"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "QA env Gold warehouse"
  }
  qa_wh_sigma = {
    name              = "XS_SIGMA"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "QA env Sigma warehouse"
  }
  qa_wh_braze = {
    name              = "XS_BRAZE"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "QA env Braze warehouse"
  }
}

databases = {
  qa_db_bronze = {
    name         = "DLSTAGE_BRONZE"
    comment      = "QA env Bronze database"
    is_transient = false
  }
  qa_db_silver = {
    name         = "DLSNAPSHOT_SILVER"
    comment      = "QA env Silver database"
    is_transient = false
  }
  qa_db_gold = {
    name         = "DLCONSUMPTION_GOLD"
    comment      = "QA env Gold database"
    is_transient = false
  }
  qa_db_admin = {
    name         = "ADMIN_INTEGRATION_DB"
    comment      = "Admin database for network rules, secrets, and integration objects"
    is_transient = false
  }
}

##############################################################################
# CUSTOM ACCOUNT ROLES
##############################################################################
custom_account_roles = {

  ########## Intermediate Hierarchy Roles ##########
  role_mfsg_platform = {
    name             = "MFSG_PLATFORM_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Groups all consumer and support functional roles"
  }
  role_mfsg_pipeline = {
    name             = "MFSG_PIPELINE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Groups all pipeline execution roles"
  }
  role_mfsg_security = {
    name             = "MFSG_SECURITY_ROLE"
    parent_role_name = "SECURITYADMIN"
    comment          = "Groups all security, PII and masking roles"
  }

  ########## Consumer RO Functional Roles (under MFSG_PLATFORM_ROLE) ##########
  role_mfsg_datasci_ro = {
    name             = "MFSG_DATASCI_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for Data Science team"
  }
  role_mfsg_creditrisk_ro = {
    name             = "MFSG_CREDITRISK_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for Credit Risk team"
  }
  role_mfsg_fraud_ro = {
    name             = "MFSG_FRAUD_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for Fraud team"
  }
  role_mfsg_analytics_ro = {
    name             = "MFSG_ANALYTICS_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for Analytics team"
  }
  role_mfsg_collection_ro = {
    name             = "MFSG_COLLECTION_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for Collection team"
  }
  role_mfsg_allowfor_ro = {
    name             = "MFSG_ALLOWFOR_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for Allowance & Forecasting team"
  }
  role_mfsg_it_core_ro = {
    name             = "MFSG_IT_CORE_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "RO functional role for IT Core team"
  }

  ########## Data Engineering Roles (under MFSG_PLATFORM_ROLE) ##########
  role_mfsg_dataeng_ro = {
    name             = "MFSG_DATAENG_ROLE_RO"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "Data Engineering RO support role for QA"
  }
  role_mfsg_dataeng_rw = {
    name             = "MFSG_DATAENG_ROLE_RW"
    parent_role_name = "SYSADMIN"
    comment          = "Data Engineering RW role (individual users only)"
  }

  ########## Governance & Reporting (under MFSG_PLATFORM_ROLE) ##########
  role_mfsg_dbt_readonly = {
    name             = "MFSG_DBT_READONLY"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "DBT read-only monitoring role"
  }
  role_mfsg_sigma_reader = {
    name             = "MFSG_SIGMA_READER_ROLE"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "Sigma reporting reader role"
  }
  role_mfsg_braze_reader = {
    name             = "MFSG_BRAZE_READER_ROLE"
    parent_role_name = "MFSG_PLATFORM_ROLE"
    comment          = "Braze reporting reader role"
  }

  ########## Openflow Roles (under MFSG_PIPELINE_ROLE) ##########
  role_mfsg_openflow_admin = {
    name             = "MFSG_OPENFLOW_ADMIN"
    parent_role_name = "MFSG_PIPELINE_ROLE"
    comment          = "Openflow Admin role"
  }
  role_mfsg_openflow_developer = {
    name             = "MFSG_OPENFLOW_DEVELOPER"
    parent_role_name = "MFSG_OPENFLOW_ADMIN"
    comment          = "Openflow Developer role (SVC_OPENFLOW)"
  }
  role_mfsg_openflow_monitor = {
    name             = "MFSG_OPENFLOW_MONITOR"
    parent_role_name = "MFSG_OPENFLOW_DEVELOPER"
    comment          = "Openflow Monitor role"
  }

  ########## DBT Runner (under MFSG_PIPELINE_ROLE) ##########
  role_mfsg_dbt_runner = {
    name             = "MFSG_DBT_RUNNER"
    parent_role_name = "MFSG_PIPELINE_ROLE"
    comment          = "DBT Runner service role (SVC_DBT) — sole DDL/DML role in QA"
  }

  ########## Security Roles (under MFSG_SECURITY_ROLE → SECURITYADMIN) ##########
  role_mfsg_terraform_admin = {
    name             = "MFSG_TERRAFORM_ADMIN"
    parent_role_name = "MFSG_SECURITY_ROLE"
    comment          = "Terraform admin service role (OIDC via CI/CD)"
  }
  role_mfsg_pii_unmasked = {
    name             = "MFSG_PII_UNMASKED"
    parent_role_name = "MFSG_SECURITY_ROLE"
    comment          = "PII unmasked access (SVC_DBT, SVC_OPENFLOW)"
  }
  role_mfsg_pii_financial = {
    name             = "MFSG_PII_FINANCIAL"
    parent_role_name = "MFSG_SECURITY_ROLE"
    comment          = "PII financial domain access (Finance/Risk leads)"
  }
  role_mfsg_pii_hr = {
    name             = "MFSG_PII_HR"
    parent_role_name = "MFSG_SECURITY_ROLE"
    comment          = "PII HR domain access (HR/Compliance staff)"
  }

  ########## Admin DB Access Roles ##########
  role_admin_integration_db_ro = {
    name             = "ADMIN_INTEGRATION_DB_ROLE_RO"
    parent_role_name = "SYSADMIN"
    comment          = "RO access role for Admin Integration DB"
  }
  role_admin_integration_db_rw = {
    name             = "ADMIN_INTEGRATION_DB_ROLE_RW"
    parent_role_name = "SYSADMIN"
    comment          = "RW access role for Admin Integration DB"
  }

  ########## Gold DB Access Roles (no schemas, not auto-generated) ##########
  role_dlconsumption_gold_ro = {
    name             = "DLCONSUMPTION_GOLD_RO"
    parent_role_name = "SYSADMIN"
    comment          = "Read-only role for database DLCONSUMPTION_GOLD"
  }
  role_dlconsumption_gold_rw = {
    name             = "DLCONSUMPTION_GOLD_RW"
    parent_role_name = "SYSADMIN"
    comment          = "Read-write role for database DLCONSUMPTION_GOLD"
  }

  ########## Warehouse Usage Roles ##########
  role_xs_bronze_usage = {
    name             = "XS_BRONZE_USAGE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Warehouse usage role for XS_BRONZE"
  }
  role_xs_silver_usage = {
    name             = "XS_SILVER_USAGE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Warehouse usage role for XS_SILVER"
  }
  role_xs_gold_usage = {
    name             = "XS_GOLD_USAGE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Warehouse usage role for XS_GOLD"
  }
  role_xs_sigma_usage = {
    name             = "XS_SIGMA_USAGE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Warehouse usage role for XS_SIGMA"
  }
  role_xs_braze_usage = {
    name             = "XS_BRAZE_USAGE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Warehouse usage role for XS_BRAZE"
  }
}

##############################################################################
# CUSTOM ROLE PRIVILEGE GRANTS
##############################################################################
custom_role_privilege_grants = {

  ######################################################################
  # WAREHOUSE USAGE GRANTS
  ######################################################################
  grant_wh_usage_xs_bronze = {
    account_role_name = "XS_BRONZE_USAGE_ROLE"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "WAREHOUSE", object_name = "XS_BRONZE" }
  }
  grant_wh_usage_xs_silver = {
    account_role_name = "XS_SILVER_USAGE_ROLE"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "WAREHOUSE", object_name = "XS_SILVER" }
  }
  grant_wh_usage_xs_gold = {
    account_role_name = "XS_GOLD_USAGE_ROLE"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "WAREHOUSE", object_name = "XS_GOLD" }
  }
  grant_wh_usage_xs_sigma = {
    account_role_name = "XS_SIGMA_USAGE_ROLE"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "WAREHOUSE", object_name = "XS_SIGMA" }
  }
  grant_wh_usage_xs_braze = {
    account_role_name = "XS_BRAZE_USAGE_ROLE"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "WAREHOUSE", object_name = "XS_BRAZE" }
  }

  ######################################################################
  # GOLD DB GRANTS (no schemas, not auto-generated)
  ######################################################################
  grant_gold_db_usage_ro = {
    account_role_name = "DLCONSUMPTION_GOLD_RO"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "DATABASE", object_name = "DLCONSUMPTION_GOLD" }
  }
  grant_gold_db_usage_rw = {
    account_role_name = "DLCONSUMPTION_GOLD_RW"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "DATABASE", object_name = "DLCONSUMPTION_GOLD" }
  }
  grant_gold_db_tables_ro = {
    account_role_name = "DLCONSUMPTION_GOLD_RO"
    privileges        = ["SELECT"]
    on_schema_object  = { all = { object_type_plural = "TABLES", in_database = "DLCONSUMPTION_GOLD" } }
  }
  grant_gold_db_future_tables_ro = {
    account_role_name = "DLCONSUMPTION_GOLD_RO"
    privileges        = ["SELECT"]
    on_schema_object  = { future = { object_type_plural = "TABLES", in_database = "DLCONSUMPTION_GOLD" } }
  }
  grant_gold_db_tables_rw = {
    account_role_name = "DLCONSUMPTION_GOLD_RW"
    privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE", "REFERENCES"]
    on_schema_object  = { all = { object_type_plural = "TABLES", in_database = "DLCONSUMPTION_GOLD" } }
  }
  grant_gold_db_future_tables_rw = {
    account_role_name = "DLCONSUMPTION_GOLD_RW"
    privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE", "REFERENCES"]
    on_schema_object  = { future = { object_type_plural = "TABLES", in_database = "DLCONSUMPTION_GOLD" } }
  }

  ######################################################################
  # ADMIN_INTEGRATION_DB GRANTS
  ######################################################################
  grant_admin_db_usage_ro = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RO"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "DATABASE", object_name = "ADMIN_INTEGRATION_DB" }
  }
  grant_admin_db_usage_rw = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RW"
    privileges        = ["USAGE"]
    on_account_object = { object_type = "DATABASE", object_name = "ADMIN_INTEGRATION_DB" }
  }
  grant_admin_db_schema_ro = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RO"
    privileges        = ["USAGE"]
    on_schema         = { schema_name = "ADMIN_INTEGRATION_DB.NETWORKING" }
  }
  grant_admin_db_schema_rw = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RW"
    privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW", "CREATE STAGE", "CREATE FILE FORMAT", "CREATE SEQUENCE", "CREATE FUNCTION", "CREATE PROCEDURE"]
    on_schema         = { schema_name = "ADMIN_INTEGRATION_DB.NETWORKING" }
  }
  grant_admin_db_tables_ro = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RO"
    privileges        = ["SELECT"]
    on_schema_object  = { all = { object_type_plural = "TABLES", in_database = "ADMIN_INTEGRATION_DB" } }
  }
  grant_admin_db_future_tables_ro = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RO"
    privileges        = ["SELECT"]
    on_schema_object  = { future = { object_type_plural = "TABLES", in_database = "ADMIN_INTEGRATION_DB" } }
  }
  grant_admin_db_tables_rw = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RW"
    privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE", "REFERENCES"]
    on_schema_object  = { all = { object_type_plural = "TABLES", in_database = "ADMIN_INTEGRATION_DB" } }
  }
  grant_admin_db_future_tables_rw = {
    account_role_name = "ADMIN_INTEGRATION_DB_ROLE_RW"
    privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE", "REFERENCES"]
    on_schema_object  = { future = { object_type_plural = "TABLES", in_database = "ADMIN_INTEGRATION_DB" } }
  }
}

##############################################################################
# ROLE-TO-ROLE GRANTS
##############################################################################
role_to_role_grants = {

  ########## Consumer RO → Silver RO + Gold RO ##########
  grant_datasci_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_DATASCI_ROLE_RO"
  }
  grant_datasci_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_DATASCI_ROLE_RO"
  }
  grant_creditrisk_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_CREDITRISK_ROLE_RO"
  }
  grant_creditrisk_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_CREDITRISK_ROLE_RO"
  }
  grant_fraud_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_FRAUD_ROLE_RO"
  }
  grant_fraud_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_FRAUD_ROLE_RO"
  }
  grant_analytics_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_ANALYTICS_ROLE_RO"
  }
  grant_analytics_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_ANALYTICS_ROLE_RO"
  }
  grant_collection_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_COLLECTION_ROLE_RO"
  }
  grant_collection_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_COLLECTION_ROLE_RO"
  }
  grant_allowfor_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_ALLOWFOR_ROLE_RO"
  }
  grant_allowfor_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_ALLOWFOR_ROLE_RO"
  }
  grant_it_core_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_IT_CORE_ROLE_RO"
  }
  grant_it_core_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_IT_CORE_ROLE_RO"
  }

  ########## MFSG_DATAENG_ROLE_RO → Bronze RO + Silver RO + Gold RO + Admin RO ##########
  grant_dataeng_ro_bronze = {
    role_name = "DLSTAGE_BRONZE_RO", parent_role_name = "MFSG_DATAENG_ROLE_RO"
  }
  grant_dataeng_ro_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_DATAENG_ROLE_RO"
  }
  grant_dataeng_ro_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_DATAENG_ROLE_RO"
  }
  grant_dataeng_ro_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RO", parent_role_name = "MFSG_DATAENG_ROLE_RO"
  }

  ########## MFSG_DATAENG_ROLE_RW → Bronze RW + Silver RW + Gold RW + Admin RO ##########
  grant_dataeng_rw_bronze = {
    role_name = "DLSTAGE_BRONZE_RW", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }
  grant_dataeng_rw_silver = {
    role_name = "DLSNAPSHOT_SILVER_RW", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }
  grant_dataeng_rw_gold = {
    role_name = "DLCONSUMPTION_GOLD_RW", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }
  grant_dataeng_rw_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RO", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }

  ########## Openflow → Bronze + Admin ##########
  grant_openflow_admin_bronze = {
    role_name = "DLSTAGE_BRONZE_RW", parent_role_name = "MFSG_OPENFLOW_ADMIN"
  }
  grant_openflow_admin_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RO", parent_role_name = "MFSG_OPENFLOW_ADMIN"
  }
  grant_openflow_dev_bronze = {
    role_name = "DLSTAGE_BRONZE_RW", parent_role_name = "MFSG_OPENFLOW_DEVELOPER"
  }
  grant_openflow_dev_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RO", parent_role_name = "MFSG_OPENFLOW_DEVELOPER"
  }
  grant_openflow_mon_bronze = {
    role_name = "DLSTAGE_BRONZE_RO", parent_role_name = "MFSG_OPENFLOW_MONITOR"
  }
  grant_openflow_mon_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RO", parent_role_name = "MFSG_OPENFLOW_MONITOR"
  }

  ########## MFSG_DBT_RUNNER → Bronze RO + Silver RW + Gold RW + Admin RO ##########
  grant_dbt_runner_bronze = {
    role_name = "DLSTAGE_BRONZE_RO", parent_role_name = "MFSG_DBT_RUNNER"
  }
  grant_dbt_runner_silver = {
    role_name = "DLSNAPSHOT_SILVER_RW", parent_role_name = "MFSG_DBT_RUNNER"
  }
  grant_dbt_runner_gold = {
    role_name = "DLCONSUMPTION_GOLD_RW", parent_role_name = "MFSG_DBT_RUNNER"
  }
  grant_dbt_runner_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RO", parent_role_name = "MFSG_DBT_RUNNER"
  }

  ########## MFSG_DBT_READONLY → Gold RO ##########
  grant_dbt_readonly_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_DBT_READONLY"
  }

  ########## MFSG_TERRAFORM_ADMIN → Bronze RW + Silver RW + Gold RW + Admin RW ##########
  grant_terraform_bronze = {
    role_name = "DLSTAGE_BRONZE_RW", parent_role_name = "MFSG_TERRAFORM_ADMIN"
  }
  grant_terraform_silver = {
    role_name = "DLSNAPSHOT_SILVER_RW", parent_role_name = "MFSG_TERRAFORM_ADMIN"
  }
  grant_terraform_gold = {
    role_name = "DLCONSUMPTION_GOLD_RW", parent_role_name = "MFSG_TERRAFORM_ADMIN"
  }
  grant_terraform_admin = {
    role_name = "ADMIN_INTEGRATION_DB_ROLE_RW", parent_role_name = "MFSG_TERRAFORM_ADMIN"
  }

  ########## PII Roles → DB RO ##########
  grant_pii_unmasked_bronze = {
    role_name = "DLSTAGE_BRONZE_RO", parent_role_name = "MFSG_PII_UNMASKED"
  }
  grant_pii_unmasked_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_PII_UNMASKED"
  }
  grant_pii_unmasked_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_PII_UNMASKED"
  }
  grant_pii_financial_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_PII_FINANCIAL"
  }
  grant_pii_financial_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_PII_FINANCIAL"
  }
  grant_pii_hr_silver = {
    role_name = "DLSNAPSHOT_SILVER_RO", parent_role_name = "MFSG_PII_HR"
  }
  grant_pii_hr_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_PII_HR"
  }

  ########## Reporting → Gold RO ##########
  grant_sigma_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_SIGMA_READER_ROLE"
  }
  grant_braze_gold = {
    role_name = "DLCONSUMPTION_GOLD_RO", parent_role_name = "MFSG_BRAZE_READER_ROLE"
  }

  ########## Warehouse Usage Roles → Functional Roles ##########
  # XS_BRONZE
  grant_wh_bronze_to_openflow_admin = {
    role_name = "XS_BRONZE_USAGE_ROLE", parent_role_name = "MFSG_OPENFLOW_ADMIN"
  }
  grant_wh_bronze_to_openflow_dev = {
    role_name = "XS_BRONZE_USAGE_ROLE", parent_role_name = "MFSG_OPENFLOW_DEVELOPER"
  }
  grant_wh_bronze_to_openflow_mon = {
    role_name = "XS_BRONZE_USAGE_ROLE", parent_role_name = "MFSG_OPENFLOW_MONITOR"
  }
  grant_wh_bronze_to_dataeng_rw = {
    role_name = "XS_BRONZE_USAGE_ROLE", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }

  # XS_SILVER
  grant_wh_silver_to_dataeng_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_DATAENG_ROLE_RO"
  }
  grant_wh_silver_to_dataeng_rw = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }
  grant_wh_silver_to_dbt_runner = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_DBT_RUNNER"
  }
  grant_wh_silver_to_dbt_readonly = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_DBT_READONLY"
  }
  grant_wh_silver_to_datasci_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_DATASCI_ROLE_RO"
  }
  grant_wh_silver_to_creditrisk_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_CREDITRISK_ROLE_RO"
  }
  grant_wh_silver_to_fraud_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_FRAUD_ROLE_RO"
  }
  grant_wh_silver_to_analytics_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_ANALYTICS_ROLE_RO"
  }
  grant_wh_silver_to_collection_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_COLLECTION_ROLE_RO"
  }
  grant_wh_silver_to_allowfor_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_ALLOWFOR_ROLE_RO"
  }
  grant_wh_silver_to_it_core_ro = {
    role_name = "XS_SILVER_USAGE_ROLE", parent_role_name = "MFSG_IT_CORE_ROLE_RO"
  }

  # XS_GOLD
  grant_wh_gold_to_dataeng_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_DATAENG_ROLE_RO"
  }
  grant_wh_gold_to_dataeng_rw = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_DATAENG_ROLE_RW"
  }
  grant_wh_gold_to_dbt_runner = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_DBT_RUNNER"
  }
  grant_wh_gold_to_datasci_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_DATASCI_ROLE_RO"
  }
  grant_wh_gold_to_creditrisk_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_CREDITRISK_ROLE_RO"
  }
  grant_wh_gold_to_fraud_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_FRAUD_ROLE_RO"
  }
  grant_wh_gold_to_analytics_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_ANALYTICS_ROLE_RO"
  }
  grant_wh_gold_to_collection_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_COLLECTION_ROLE_RO"
  }
  grant_wh_gold_to_allowfor_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_ALLOWFOR_ROLE_RO"
  }
  grant_wh_gold_to_it_core_ro = {
    role_name = "XS_GOLD_USAGE_ROLE", parent_role_name = "MFSG_IT_CORE_ROLE_RO"
  }

  # XS_SIGMA
  grant_wh_sigma_to_sigma = {
    role_name = "XS_SIGMA_USAGE_ROLE", parent_role_name = "MFSG_SIGMA_READER_ROLE"
  }

  # XS_BRAZE
  grant_wh_braze_to_braze = {
    role_name = "XS_BRAZE_USAGE_ROLE", parent_role_name = "MFSG_BRAZE_READER_ROLE"
  }
}

##############################################################################
# SCHEMAS
##############################################################################
schemas = {

  ########## Admin Integration DB ###########
  NETWORKING_Admin = {
    database            = "ADMIN_INTEGRATION_DB"
    name                = "NETWORKING"
    comment             = "Schema for network rules, secrets, and integration objects"
    with_managed_access = false
  }

  ########## Bronze Database ###########
  RDS_BANKSQL01_AUTOBANK_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_BANKSQL01_AUTOBANK_US"
    comment  = "Schema for RDS BANKSQL01 AUTOBANK US for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITACHQ_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITACHQ_CAN"
    comment  = "Schema for RDS_VITACAN_VITACHQ_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITACHEQ_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITACHEQ_US"
    comment  = "Schema for RDS_VITAUS_VITACHEQ_US for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAFX_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAFX_US"
    comment  = "Schema for RDS_VITAUS_VITAFX_US for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAFX_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAFX_CAN"
    comment  = "Schema for RDS_VITACAN_VITAFX_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITATRAN_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITATRAN_CAN"
    comment  = "Schema for RDS_VITACAN_VITATRAN_CAN for Bronze Database", with_managed_access = false
  }
  RDS_EEPSUITECOMSQL_USEFT_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_EEPSUITECOMSQL_USEFT"
    comment  = "Schema for RDS_EEPSUITECOMSQL_USEFT for Bronze Database", with_managed_access = false
  }
  RDS_NADC1PPROD01_SECU_NADC1_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_NADC1PPROD01_SECU_NADC1"
    comment  = "Schema for RDS_NADC1PPROD01_SECU_NADC1 for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAOPER_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAOPER_CAN"
    comment  = "Schema for RDS_VITACAN_VITAOPER_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITACRM_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITACRM_CAN"
    comment  = "Schema for RDS_VITACAN_VITACRM_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAPDL_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAPDL_CAN"
    comment  = "Schema for RDS_VITACAN_VITAPDL_CAN for Bronze Database", with_managed_access = false
  }
  RDS_NADC1PSQL99_JOURNAL_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_NADC1PSQL99_JOURNAL_CAN"
    comment  = "Schema for RDS_NADC1PSQL99_JOURNAL_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAPDL_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAPDL_US"
    comment  = "Schema for RDS_VITAUS_VITAPDL_US for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITACRM_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITACRM_US"
    comment  = "Schema for RDS_VITAUS_VITACRM_US for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAOPER_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAOPER_US"
    comment  = "Schema for RDS_VITAUS_VITAOPER_US for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITATRAN_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITATRAN_US"
    comment  = "Schema for RDS_VITAUS_VITATRAN_US for Bronze Database", with_managed_access = false
  }
  RDS_LOANPRO_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_LOANPRO"
    comment  = "Schema for RDS_LOANPRO for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITACENAUTH_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITACENAUTH_CAN"
    comment  = "Schema for RDS_VITACAN_VITACENAUTH_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITACENAUTH_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITACENAUTH_US"
    comment  = "Schema for RDS_VITAUS_VITACENAUTH_US for Bronze Database", with_managed_access = false
  }
  RDS_NADC1PSQL99_JOURNAL_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_NADC1PSQL99_JOURNAL_US"
    comment  = "Schema for RDS_NADC1PSQL99_JOURNAL_US for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_BIDATA_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_BIDATA_CAN"
    comment  = "Schema for RDS_VITACAN_BIDATA_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAMMDTC_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAMMDTC_US"
    comment  = "Schema for RDS_VITAUS_VITAMMDTC_US for Bronze Database", with_managed_access = false
  }
  RDS_PRPSQLUS_CARDPROCESSOR_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_PRPSQLUS_CARDPROCESSOR_US"
    comment  = "Schema for RDS_PRPSQLUS_CARDPROCESSOR_US for Bronze Database", with_managed_access = false
  }
  RDS_CARD_DEBITCARDTOKENIZER_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_CARD_DEBITCARDTOKENIZER"
    comment  = "Schema for RDS_CARD_DEBITCARDTOKENIZER for Bronze Database", with_managed_access = false
  }
  RDS_PRPSQLCAN_CARDPROCESSOR_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_PRPSQLCAN_CARDPROCESSOR_CAN"
    comment  = "Schema for RDS_PRPSQLCAN_CARDPROCESSOR_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAUW_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAUW_US"
    comment  = "Schema for RDS_VITAUS_VITAUW_US for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAUW_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAUW_CAN"
    comment  = "Schema for RDS_VITACAN_VITAUW_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAWESUNION_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAWESUNION_US"
    comment  = "Schema for RDS_VITAUS_VITAWESUNION_US for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_BIDATA_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_BIDATA_US"
    comment  = "Schema for RDS_VITAUS_BIDATA_US for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAMONORDERS_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAMONORDERS_CAN"
    comment  = "Schema for RDS_VITACAN_VITAMONORDERS_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAMONORDERS_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAMONORDERS_US"
    comment  = "Schema for RDS_VITAUS_VITAMONORDERS_US for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAWESUNION_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAWESUNION_CAN"
    comment  = "Schema for RDS_VITACAN_VITAWESUNION_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_VITAEVENTAUDIT_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_VITAEVENTAUDIT_CAN"
    comment  = "Schema for RDS_VITACAN_VITAEVENTAUDIT_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAEVENTAUDIT_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAEVENTAUDIT_US"
    comment  = "Schema for RDS_VITAUS_VITAEVENTAUDIT_US for Bronze Database", with_managed_access = false
  }
  RDS_EEPSUITECOMSQL_CANEFT_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_EEPSUITECOMSQL_CANEFT"
    comment  = "Schema for RDS_EEPSUITECOMSQL_CANEFT for Bronze Database", with_managed_access = false
  }
  RDA_VITACAN_VITAAPPVERI_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDA_VITACAN_VITAAPPVERI_CAN"
    comment  = "Schema for RDA_VITACAN_VITAAPPVERI_CAN for Bronze Database", with_managed_access = false
  }
  RDS_VITAUS_VITAAPPVERI_US_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITAUS_VITAAPPVERI_US"
    comment  = "Schema for RDS_VITAUS_VITAAPPVERI_US for Bronze Database", with_managed_access = false
  }
  RDS_PUSSQL01_IDVERIFIER_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_PUSSQL01_IDVERIFIER"
    comment  = "Schema for RDS_PUSSQL01_IDVERIFIER for Bronze Database", with_managed_access = false
  }
  RDS_VITACAN_BANKINT_CAN_Bronze = {
    database = "DLSTAGE_BRONZE", name = "RDS_VITACAN_BANKINT_CAN"
    comment  = "Schema for RDS_VITACAN_BANKINT_CAN for Bronze Database", with_managed_access = false
  }
  NETWORK_Bronze = {
    database = "DLSTAGE_BRONZE", name = "NETWORK"
    comment  = "Schema for Network for Bronze Database", with_managed_access = false
  }

  ########## Silver Database ###########
  RDS_BANKSQL01_AUTOBANK_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_BANKSQL01_AUTOBANK_US"
    comment  = "Schema for RDS BANKSQL01 AUTOBANK US for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITACHQ_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITACHQ_CAN"
    comment  = "Schema for RDS_VITACAN_VITACHQ_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITACHEQ_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITACHEQ_US"
    comment  = "Schema for RDS_VITAUS_VITACHEQ_US for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAFX_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAFX_US"
    comment  = "Schema for RDS_VITAUS_VITAFX_US for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAFX_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAFX_CAN"
    comment  = "Schema for RDS_VITACAN_VITAFX_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITATRAN_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITATRAN_CAN"
    comment  = "Schema for RDS_VITACAN_VITATRAN_CAN for Silver Database", with_managed_access = false
  }
  RDS_EEPSUITECOMSQL_USEFT_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_EEPSUITECOMSQL_USEFT"
    comment  = "Schema for RDS_EEPSUITECOMSQL_USEFT for Silver Database", with_managed_access = false
  }
  RDS_NADC1PPROD01_SECU_NADC1_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_NADC1PPROD01_SECU_NADC1"
    comment  = "Schema for RDS_NADC1PPROD01_SECU_NADC1 for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAOPER_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAOPER_CAN"
    comment  = "Schema for RDS_VITACAN_VITAOPER_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITACRM_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITACRM_CAN"
    comment  = "Schema for RDS_VITACAN_VITACRM_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAPDL_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAPDL_CAN"
    comment  = "Schema for RDS_VITACAN_VITAPDL_CAN for Silver Database", with_managed_access = false
  }
  RDS_NADC1PSQL99_JOURNAL_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_NADC1PSQL99_JOURNAL_CAN"
    comment  = "Schema for RDS_NADC1PSQL99_JOURNAL_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAPDL_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAPDL_US"
    comment  = "Schema for RDS_VITAUS_VITAPDL_US for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITACRM_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITACRM_US"
    comment  = "Schema for RDS_VITAUS_VITACRM_US for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAOPER_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAOPER_US"
    comment  = "Schema for RDS_VITAUS_VITAOPER_US for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITATRAN_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITATRAN_US"
    comment  = "Schema for RDS_VITAUS_VITATRAN_US for Silver Database", with_managed_access = false
  }
  RDS_LOANPRO_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_LOANPRO"
    comment  = "Schema for RDS_LOANPRO for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITACENAUTH_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITACENAUTH_CAN"
    comment  = "Schema for RDS_VITACAN_VITACENAUTH_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITACENAUTH_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITACENAUTH_US"
    comment  = "Schema for RDS_VITAUS_VITACENAUTH_US for Silver Database", with_managed_access = false
  }
  RDS_NADC1PSQL99_JOURNAL_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_NADC1PSQL99_JOURNAL_US"
    comment  = "Schema for RDS_NADC1PSQL99_JOURNAL_US for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_BIDATA_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_BIDATA_CAN"
    comment  = "Schema for RDS_VITACAN_BIDATA_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAMMDTC_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAMMDTC_US"
    comment  = "Schema for RDS_VITAUS_VITAMMDTC_US for Silver Database", with_managed_access = false
  }
  RDS_PRPSQLUS_CARDPROCESSOR_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_PRPSQLUS_CARDPROCESSOR_US"
    comment  = "Schema for RDS_PRPSQLUS_CARDPROCESSOR_US for Silver Database", with_managed_access = false
  }
  RDS_CARD_DEBITCARDTOKENIZER_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_CARD_DEBITCARDTOKENIZER"
    comment  = "Schema for RDS_CARD_DEBITCARDTOKENIZER for Silver Database", with_managed_access = false
  }
  RDS_PRPSQLCAN_CARDPROCESSOR_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_PRPSQLCAN_CARDPROCESSOR_CAN"
    comment  = "Schema for RDS_PRPSQLCAN_CARDPROCESSOR_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAUW_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAUW_US"
    comment  = "Schema for RDS_VITAUS_VITAUW_US for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAUW_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAUW_CAN"
    comment  = "Schema for RDS_VITACAN_VITAUW_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAWESUNION_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAWESUNION_US"
    comment  = "Schema for RDS_VITAUS_VITAWESUNION_US for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_BIDATA_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_BIDATA_US"
    comment  = "Schema for RDS_VITAUS_BIDATA_US for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAMONORDERS_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAMONORDERS_CAN"
    comment  = "Schema for RDS_VITACAN_VITAMONORDERS_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAMONORDERS_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAMONORDERS_US"
    comment  = "Schema for RDS_VITAUS_VITAMONORDERS_US for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAWESUNION_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAWESUNION_CAN"
    comment  = "Schema for RDS_VITACAN_VITAWESUNION_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_VITAEVENTAUDIT_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_VITAEVENTAUDIT_CAN"
    comment  = "Schema for RDS_VITACAN_VITAEVENTAUDIT_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAEVENTAUDIT_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAEVENTAUDIT_US"
    comment  = "Schema for RDS_VITAUS_VITAEVENTAUDIT_US for Silver Database", with_managed_access = false
  }
  RDS_EEPSUITECOMSQL_CANEFT_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_EEPSUITECOMSQL_CANEFT"
    comment  = "Schema for RDS_EEPSUITECOMSQL_CANEFT for Silver Database", with_managed_access = false
  }
  RDA_VITACAN_VITAAPPVERI_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDA_VITACAN_VITAAPPVERI_CAN"
    comment  = "Schema for RDA_VITACAN_VITAAPPVERI_CAN for Silver Database", with_managed_access = false
  }
  RDS_VITAUS_VITAAPPVERI_US_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITAUS_VITAAPPVERI_US"
    comment  = "Schema for RDS_VITAUS_VITAAPPVERI_US for Silver Database", with_managed_access = false
  }
  RDS_PUSSQL01_IDVERIFIER_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_PUSSQL01_IDVERIFIER"
    comment  = "Schema for RDS_PUSSQL01_IDVERIFIER for Silver Database", with_managed_access = false
  }
  RDS_VITACAN_BANKINT_CAN_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "RDS_VITACAN_BANKINT_CAN"
    comment  = "Schema for RDS_VITACAN_BANKINT_CAN for Silver Database", with_managed_access = false
  }
  NETWORK_Silver = {
    database = "DLSNAPSHOT_SILVER", name = "NETWORK"
    comment  = "Schema for Network for Silver Database", with_managed_access = false
  }
}

##############################################################################
# USER ROLE ASSIGNMENTS
##############################################################################
user_role_assignments = {}
