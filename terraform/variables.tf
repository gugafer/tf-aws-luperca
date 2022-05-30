variable "business_unit" {
  description = "Name of the business unit and the needed environments"
  default = {
    bu-name = ["env1", "env2", "env3"]
  }
}
