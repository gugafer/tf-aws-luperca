variable "business_unit" {
  description = "Name of the business unit and the needed environments"
  default = {
    # bu1 = ["prd"],
    # bu2 = ["prd"]
  }
}

variable "sec_accounts" {
  description = "Accounts recommended by AWS org best practices"
  type        = list(string)
  default     = ["log archive", "security tooling"]
}