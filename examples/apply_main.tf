module "application_insights" {
  source = "registry.terraform.io/telekom-mms/application-insights/azurerm"

  application_insights = {
    appi-mms-github = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
      application_type    = "web"
    }
  }
}
