locals {
  buEnv = flatten([
    for buName, envList in var.business_unit : [
      for env in envList : {
        buName = buName
        env    = env
      }
    ]
  ])
}

locals {
  acct_id = {
    for info in data.aws_organizations_organization.root.non_master_accounts[*] :
    "${info.name}" => { arn = "${info.arn}", id = "${info.id}", status = "${info.status}" }
  }
}
