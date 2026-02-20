/**
* # application-insights
*
* This module manages the azurerm application-insights resources, see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs.
*
* For more information about the module structure see https://telekom-mms.github.io/terraform-template.
*
*/

resource "azurerm_application_insights" "application_insights" {
  for_each = var.application_insights

  name                                  = local.application_insights[each.key].name == "" ? each.key : local.application_insights[each.key].name
  location                              = local.application_insights[each.key].location
  resource_group_name                   = local.application_insights[each.key].resource_group_name
  application_type                      = local.application_insights[each.key].application_type
  daily_data_cap_in_gb                  = local.application_insights[each.key].daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = local.application_insights[each.key].daily_data_cap_notifications_disabled
  retention_in_days                     = local.application_insights[each.key].retention_in_days
  sampling_percentage                   = local.application_insights[each.key].sampling_percentage
  disable_ip_masking                    = local.application_insights[each.key].disable_ip_masking
  workspace_id                          = local.application_insights[each.key].workspace_id
  local_authentication_disabled         = local.application_insights[each.key].local_authentication_disabled
  internet_ingestion_enabled            = local.application_insights[each.key].internet_ingestion_enabled
  internet_query_enabled                = local.application_insights[each.key].internet_query_enabled
  force_customer_storage_for_profiler   = local.application_insights[each.key].force_customer_storage_for_profiler
  tags                                  = local.application_insights[each.key].tags
}
