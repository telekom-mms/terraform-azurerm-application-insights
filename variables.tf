variable "application_insights" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    application_insights = {
      name                                  = ""
      daily_data_cap_in_gb                  = null
      daily_data_cap_notifications_disabled = null
      retention_in_days                     = 30 # defined default
      sampling_percentage                   = null
      disable_ip_masking                    = null
      workspace_id                          = null
      local_authentication_disabled         = null
      internet_ingestion_enabled            = false # defined default
      internet_query_enabled                = false # defined default
      force_customer_storage_for_profiler   = null
      tags                                  = {}
    }
  }

  # compare and merge custom and default values
  # merge all custom and default values
  application_insights = {
    for application_insights in keys(var.application_insights) :
    application_insights => merge(local.default.application_insights, var.application_insights[application_insights])
  }
}
