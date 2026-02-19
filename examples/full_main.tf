module "application_insights" {
  source = "registry.terraform.io/telekom-mms/application-insights/azurerm"

  application_insights = {
    aimms = {
      name                                  = "appi-mms-github"
      location                              = "westeurope"
      resource_group_name                   = "rg-mms-github"
      application_type                      = "web"
      daily_data_cap_in_gb                  = 10
      daily_data_cap_notifications_disabled = false
      retention_in_days                     = 90
      sampling_percentage                   = 100
      disable_ip_masking                    = false
      local_authentication_disabled         = false
      internet_ingestion_enabled            = true
      internet_query_enabled                = true
      force_customer_storage_for_profiler   = false
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
}

