variable "business_unit" {
  description = "Name of the business unit and the needed environments"
  default = {
    bu1 = ["prd"],
    bu2 = ["prd"]
  }
}
