warehouses = {
  moneymart_wh_bronze = {
    name              = "XS_BRONZE"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "This warehouse is being used by Dev env for Bronze warehouse"
  }

  moneymart_wh_silver = {
    name              = "XS_SILVER"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "This warehouse is being used by Dev env for Silver warehouse"
  }

  moneymart_wh_gold = {
    name              = "XS_GOLD"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "This warehouse is being used by Dev env for Gold warehouse"
  }

  moneymart_wh_sigma = {
    name              = "XS_SIGMA"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "This warehouse is being used by Dev env for Sigma warehouse"
  }

  moneymart_wh_braze = {
    name              = "XS_BRAZE"
    warehouse_size    = "XSMALL"
    min_cluster_count = 1
    max_cluster_count = 4
    auto_suspend      = 60
    auto_resume       = true
    comment           = "This warehouse is being used by Dev env for Braze warehouse"
  }
}

databases = {
  moneymart_db_bronze = {
    name         = "DLSTAGE_BRONZE"
    comment      = "This database is being used by Dev env for Bronze"
    is_transient = false
  }

  moneymart_db_silver = {
    name         = "DLSNAPSHOT_SILVER"
    comment      = "This database is being used by Dev env for Silver"
    is_transient = false
  }

  moneymart_db_gold = {
    name         = "DLCONSUMPTION_GOLD"
    comment      = "This database is being used by Dev env for Gold"
    is_transient = false
  }
}

custom_account_roles = {
  moneymart_account_role_mfsg_datascience = {
    name             = "MFSG_DATASCI_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG Data Science dev jobs"
  }

  moneymart_account_role_mfsg_creditrisk = {
    name             = "MFSG_CREDITRISK_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG Credit Risk silver jobs"
  }

  moneymart_account_role_mfsg_fraud = {
    name             = "MFSG_FRAUD_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG Fraud dev jobs"
  }

  moneymart_account_role_mfsg_analytics = {
    name             = "MFSG_ANALYTICS_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG Analytics dev jobs"
  }

  moneymart_account_role_mfsg_collection = {
    name             = "MFSG_COLLECTION_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG Collection dev jobs"
  }

  moneymart_account_role_mfsg_allowfor = {
    name             = "MFSG_ALLOWFOR_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG ALLOWFOR dev jobs"
  }

  moneymart_account_role_mfsg_it_core = {
    name             = "MFSG_IT_CORE_ROLE"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG IT Core dev jobs"
  }

  moneymart_account_role_mfsg_dataeng_dev = {
    name             = "MFSG_DATAENG_DEV"
    parent_role_name = "SYSADMIN"
    comment          = "Role for mfsg dataeng dev jobs"
  }

  moneymart_account_role_mfsg_openflow_admin = {
    name             = "MFSG_OPENFLOW_ADMIN"
    parent_role_name = "SYSADMIN"
    comment          = "Role for MFSG OPENFLOW ADMIN"
  }

  moneymart_account_role_mfsg_openflow_developer = {
    name             = "MFSG_OPENFLOW_DEVELOPER"
    parent_role_name = "MFSG_OPENFLOW_ADMIN"
    comment          = "Role for MFSG OPENFLOW DEVELOPER"
  }

  moneymart_account_role_mfsg_openflow_monitor = {
    name             = "MFSG_OPENFLOW_MONITOR"
    parent_role_name = "MFSG_OPENFLOW_ADMIN"
    comment          = "Role for MFSG OPENFLOW MONITOR"
  }

}

custom_role_privilege_grants = {

  moneymart_grant_privileges_account_role_mfsg_openflow_developer_bronze = {
    account_role_name = "MFSG_OPENFLOW_DEVELOPER"
    privileges        = ["USAGE", "OPERATE", "MONITOR"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_BRONZE"
    }
  }

  moneymart_grant_privileges_account_role_mfsg_openflow_admin_bronze = {
    account_role_name = "MFSG_OPENFLOW_ADMIN"
    privileges        = ["USAGE", "OPERATE", "MONITOR"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_BRONZE"
    }
  }

  moneymart_grant_privileges_account_role_mfsg_openflow_monitor_bronze = {
    account_role_name = "MFSG_OPENFLOW_MONITOR"
    privileges        = ["USAGE", "OPERATE", "MONITOR"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_BRONZE"
    }
  }

  moneymart_grant_privileges_account_role_dataeng_dev_bronze = {
    account_role_name = "DATAENG_DEV"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_BRONZE"
    }
  }

  moneymart_grant_privileges_account_role_dbt_runner_silver = {
    account_role_name = "DBT_RUNNER"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_SILVER"
    }
  }

  moneymart_grant_privileges_account_role_dbt_readonly_silver = {
    account_role_name = "DBT_READONLY"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_SILVER"
    }
  }

  moneymart_grant_privileges_account_role_dataeng_dev_silver = {
    account_role_name = "DATAENG_DEV_SILVER"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_SILVER"
    }
  }

  moneymart_grant_privileges_account_role_dbt_runner_gold = {
    account_role_name = "DBT_RUNNER_GOLD"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_GOLD"
    }
  }

  moneymart_grant_privileges_account_role_dataeng_dev_gold = {
    account_role_name = "DATAENG_DEV_GOLD"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_GOLD"
    }
  }

  moneymart_grant_privileges_account_role_mfsg_analytics_ro_sigma = {
    account_role_name = "MFSG_ANALYTICS_RO"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_SIGMA"
    }
  }

  moneymart_grant_privileges_account_role_mfsg_dataeng_dev_braze = {
    account_role_name = "MFSG_DATAENG_DEV"
    privileges        = ["USAGE"]
    on_account_object = {
      object_type = "WAREHOUSE"
      object_name = "XS_BRAZE"
    }
  }

}

########## Schemas for Bronze Database ###########
schemas = {
  RDS_BANKSQL01_AUTOBANK_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_BANKSQL01_AUTOBANK_US"
    comment             = "Schema for RDS BANKSQL01 AUTOBANK US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITACHQ_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITACHQ_CAN"
    comment             = "Schema for RDS_VITACAN_VITACHQ_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITACHEQ_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITACHEQ_US"
    comment             = "Schema for RDS_VITAUS_VITACHEQ_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAFX_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAFX_US"
    comment             = "Schema for RDS_VITAUS_VITAFX_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAFX_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAFX_CAN"
    comment             = "Schema for RDS_VITACAN_VITAFX_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITATRAN_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITATRAN_CAN"
    comment             = "Schema for RDS_VITACAN_VITATRAN_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_EEPSUITECOMSQL_USEFT_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_EEPSUITECOMSQL_USEFT"
    comment             = "Schema for RDS_EEPSUITECOMSQL_USEFT for Bronze Database"
    with_managed_access = false
  }

  RDS_NADC1PPROD01_SECU_NADC1_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_NADC1PPROD01_SECU_NADC1"
    comment             = "Schema for RDS_NADC1PPROD01_SECU_NADC1 for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAOPER_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAOPER_CAN"
    comment             = "Schema for RDS_VITACAN_VITAOPER_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITACRM_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITACRM_CAN"
    comment             = "Schema for RDS_VITACAN_VITACRM_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAPDL_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAPDL_CAN"
    comment             = "Schema for RDS_VITACAN_VITACRM_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_NADC1PSQL99_JOURNAL_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_NADC1PSQL99_JOURNAL_CAN"
    comment             = "Schema for RDS_NADC1PSQL99_JOURNAL_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAPDL_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAPDL_US"
    comment             = "Schema for RDS_VITAUS_VITAPDL_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITACRM_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITACRM_US"
    comment             = "Schema for RDS_VITAUS_VITACRM_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAOPER_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAOPER_US"
    comment             = "Schema for RDS_VITAUS_VITAOPER_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITATRAN_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITATRAN_US"
    comment             = "Schema for RDS_VITAUS_VITATRAN_US for Bronze Database"
    with_managed_access = false
  }

  RDS_LOANPRO_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_LOANPRO"
    comment             = "Schema for RDS_LOANPRO for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITACENAUTH_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITACENAUTH_CAN"
    comment             = "Schema for RDS_VITACAN_VITACENAUTH_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITACENAUTH_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITACENAUTH_US"
    comment             = "Schema for RDS_VITAUS_VITACENAUTH_US for Bronze Database"
    with_managed_access = false
  }

  RDS_NADC1PSQL99_JOURNAL_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_NADC1PSQL99_JOURNAL_US"
    comment             = "Schema for RDS_NADC1PSQL99_JOURNAL_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_BIDATA_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_BIDATA_CAN"
    comment             = "Schema for RDS_VITACAN_BIDATA_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAMMDTC_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAMMDTC_US"
    comment             = "Schema for RDS_VITAUS_VITAMMDTC_US for Bronze Database"
    with_managed_access = false
  }

  RDS_PRPSQLUS_CARDPROCESSOR_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_PRPSQLUS_CARDPROCESSOR_US"
    comment             = "Schema for RDS_PRPSQLUS_CARDPROCESSOR_US for Bronze Database"
    with_managed_access = false
  }

  RDS_CARD_DEBITCARDTOKENIZER_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_CARD_DEBITCARDTOKENIZER"
    comment             = "Schema for RDS_CARD_DEBITCARDTOKENIZER for Bronze Database"
    with_managed_access = false
  }

  RDS_PRPSQLCAN_CARDPROCESSOR_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_PRPSQLCAN_CARDPROCESSOR_CAN"
    comment             = "Schema for RDS_PRPSQLCAN_CARDPROCESSOR_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAUW_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAUW_US"
    comment             = "Schema for RDS_VITAUS_VITAUW_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAUW_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAUW_CAN"
    comment             = "Schema for RDS_VITACAN_VITAUW_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAWESUNION_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAWESUNION_US"
    comment             = "Schema for RDS_VITAUS_VITAWESUNION_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_BIDATA_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_BIDATA_US"
    comment             = "Schema for RDS_VITAUS_BIDATA_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAMONORDERS_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAMONORDERS_CAN"
    comment             = "Schema for RDS_VITACAN_VITAMONORDERS_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAMONORDERS_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAMONORDERS_US"
    comment             = "Schema for RDS_VITAUS_VITAMONORDERS_US for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAWESUNION_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAWESUNION_CAN"
    comment             = "Schema for RDS_VITACAN_VITAWESUNION_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAEVENTAUDIT_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_VITAEVENTAUDIT_CAN"
    comment             = "Schema for RDS_VITACAN_VITAEVENTAUDIT_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAEVENTAUDIT_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAEVENTAUDIT_US"
    comment             = "Schema for RDS_VITAUS_VITAEVENTAUDIT_US for Bronze Database"
    with_managed_access = false
  }

  RDS_EEPSUITECOMSQL_CANEFT_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_EEPSUITECOMSQL_CANEFT"
    comment             = "Schema for RDS_EEPSUITECOMSQL_CANEFT for Bronze Database"
    with_managed_access = false
  }

  RDA_VITACAN_VITAAPPVERI_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDA_VITACAN_VITAAPPVERI_CAN"
    comment             = "Schema for RDA_VITACAN_VITAAPPVERI_CAN for Bronze Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAAPPVERI_US_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITAUS_VITAAPPVERI_US"
    comment             = "Schema for RDS_VITAUS_VITAAPPVERI_US for Bronze Database"
    with_managed_access = false
  }

  RDS_PUSSQL01_IDVERIFIER_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_PUSSQL01_IDVERIFIER"
    comment             = "Schema for RDS_PUSSQL01_IDVERIFIER for Bronze Database"
    with_managed_access = false
  }

  RDS_VITACAN_BANKINT_CAN_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "RDS_VITACAN_BANKINT_CAN"
    comment             = "Schema for RDS_VITACAN_BANKINT_CAN for Bronze Database"
    with_managed_access = false
  }

  NETWORK_Bronze = {
    database            = "DLSTAGE_BRONZE"
    name                = "NETWORK"
    comment             = "Schema for Network for Bronze Database"
    with_managed_access = false
  }



  RDS_BANKSQL01_AUTOBANK_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_BANKSQL01_AUTOBANK_US"
    comment             = "Schema for RDS BANKSQL01 AUTOBANK US for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITACHQ_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITACHQ_CAN"
    comment             = "Schema for RDS_VITACAN_VITACHQ_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITACHEQ_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITACHEQ_US"
    comment             = "Schema for RDS_VITAUS_VITACHEQ_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAFX_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAFX_US"
    comment             = "Schema for RDS_VITAUS_VITAFX_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAFX_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAFX_CAN"
    comment             = "Schema for RDS_VITACAN_VITAFX_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITATRAN_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITATRAN_CAN"
    comment             = "Schema for RDS_VITACAN_VITATRAN_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_EEPSUITECOMSQL_USEFT_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_EEPSUITECOMSQL_USEFT"
    comment             = "Schema for RDS_EEPSUITECOMSQL_USEFT for Silver Database"
    with_managed_access = false
  }

  RDS_NADC1PPROD01_SECU_NADC1_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_NADC1PPROD01_SECU_NADC1"
    comment             = "Schema for RDS_NADC1PPROD01_SECU_NADC1 for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAOPER_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAOPER_CAN"
    comment             = "Schema for RDS_VITACAN_VITAOPER_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITACRM_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITACRM_CAN"
    comment             = "Schema for RDS_VITACAN_VITACRM_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAPDL_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAPDL_CAN"
    comment             = "Schema for RDS_VITACAN_VITACRM_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_NADC1PSQL99_JOURNAL_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_NADC1PSQL99_JOURNAL_CAN"
    comment             = "Schema for RDS_NADC1PSQL99_JOURNAL_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAPDL_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAPDL_US"
    comment             = "Schema for RDS_VITAUS_VITAPDL_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITACRM_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITACRM_US"
    comment             = "Schema for RDS_VITAUS_VITACRM_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAOPER_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAOPER_US"
    comment             = "Schema for RDS_VITAUS_VITAOPER_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITATRAN_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITATRAN_US"
    comment             = "Schema for RDS_VITAUS_VITATRAN_US for Silver Database"
    with_managed_access = false
  }

  RDS_LOANPRO_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_LOANPRO"
    comment             = "Schema for RDS_LOANPRO for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITACENAUTH_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITACENAUTH_CAN"
    comment             = "Schema for RDS_VITACAN_VITACENAUTH_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITACENAUTH_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITACENAUTH_US"
    comment             = "Schema for RDS_VITAUS_VITACENAUTH_US for Silver Database"
    with_managed_access = false
  }

  RDS_NADC1PSQL99_JOURNAL_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_NADC1PSQL99_JOURNAL_US"
    comment             = "Schema for RDS_NADC1PSQL99_JOURNAL_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_BIDATA_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_BIDATA_CAN"
    comment             = "Schema for RDS_VITACAN_BIDATA_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAMMDTC_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAMMDTC_US"
    comment             = "Schema for RDS_VITAUS_VITAMMDTC_US for Silver Database"
    with_managed_access = false
  }

  RDS_PRPSQLUS_CARDPROCESSOR_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_PRPSQLUS_CARDPROCESSOR_US"
    comment             = "Schema for RDS_PRPSQLUS_CARDPROCESSOR_US for Silver Database"
    with_managed_access = false
  }

  RDS_CARD_DEBITCARDTOKENIZER_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_CARD_DEBITCARDTOKENIZER"
    comment             = "Schema for RDS_CARD_DEBITCARDTOKENIZER for Silver Database"
    with_managed_access = false
  }

  RDS_PRPSQLCAN_CARDPROCESSOR_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_PRPSQLCAN_CARDPROCESSOR_CAN"
    comment             = "Schema for RDS_PRPSQLCAN_CARDPROCESSOR_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAUW_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAUW_US"
    comment             = "Schema for RDS_VITAUS_VITAUW_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAUW_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAUW_CAN"
    comment             = "Schema for RDS_VITACAN_VITAUW_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAWESUNION_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAWESUNION_US"
    comment             = "Schema for RDS_VITAUS_VITAWESUNION_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_BIDATA_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_BIDATA_US"
    comment             = "Schema for RDS_VITAUS_BIDATA_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAMONORDERS_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAMONORDERS_CAN"
    comment             = "Schema for RDS_VITACAN_VITAMONORDERS_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAMONORDERS_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAMONORDERS_US"
    comment             = "Schema for RDS_VITAUS_VITAMONORDERS_US for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAWESUNION_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAWESUNION_CAN"
    comment             = "Schema for RDS_VITACAN_VITAWESUNION_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_VITAEVENTAUDIT_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_VITAEVENTAUDIT_CAN"
    comment             = "Schema for RDS_VITACAN_VITAEVENTAUDIT_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAEVENTAUDIT_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAEVENTAUDIT_US"
    comment             = "Schema for RDS_VITAUS_VITAEVENTAUDIT_US for Silver Database"
    with_managed_access = false
  }

  RDS_EEPSUITECOMSQL_CANEFT_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_EEPSUITECOMSQL_CANEFT"
    comment             = "Schema for RDS_EEPSUITECOMSQL_CANEFT for Silver Database"
    with_managed_access = false
  }

  RDA_VITACAN_VITAAPPVERI_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDA_VITACAN_VITAAPPVERI_CAN"
    comment             = "Schema for RDA_VITACAN_VITAAPPVERI_CAN for Silver Database"
    with_managed_access = false
  }

  RDS_VITAUS_VITAAPPVERI_US_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITAUS_VITAAPPVERI_US"
    comment             = "Schema for RDS_VITAUS_VITAAPPVERI_US for Silver Database"
    with_managed_access = false
  }

  RDS_PUSSQL01_IDVERIFIER_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_PUSSQL01_IDVERIFIER"
    comment             = "Schema for RDS_PUSSQL01_IDVERIFIER for Silver Database"
    with_managed_access = false
  }

  RDS_VITACAN_BANKINT_CAN_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "RDS_VITACAN_BANKINT_CAN"
    comment             = "Schema for RDS_VITACAN_BANKINT_CAN for Silver Database"
    with_managed_access = false
  }

  NETWORK_Silver = {
    database            = "DLSNAPSHOT_SILVER"
    name                = "NETWORK"
    comment             = "Schema for Network for Silver Database"
    with_managed_access = false
  }
}


########## User Role Assignments ############
user_role_assignments = {
  "CHAITANYA.CHHIBBA@MONEYMART.CA" = [
    "MFSG_OPENFLOW_ADMIN",
    "MFSG_OPENFLOW_DEVELOPER"
  ]

  "GANESH-KUMAR.SUBRAMANIAM@MONEYMART.CA" = [
    "MFSG_OPENFLOW_ADMIN",
    "MFSG_OPENFLOW_DEVELOPER"
  ]

  "SARABJEET.SINGH@MONEYMART.CA" = [
    "MFSG_OPENFLOW_ADMIN",
    "MFSG_OPENFLOW_DEVELOPER"
  ]

}