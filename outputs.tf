output "application_insights" {
  description = "Outputs all attributes of application_insights."
  value = {
    for application_insights in keys(azurerm_application_insights.application_insights) :
    application_insights => {
      for key, value in azurerm_application_insights.application_insights[application_insights] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      application_insights = {
        for key in keys(var.application_insights) :
        key => local.application_insights[key]
      }
    }
  }
}
