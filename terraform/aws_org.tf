resource "aws_organizations_organization" "root" {
  aws_service_access_principals = [
    "account.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "config-multiaccountsetup.amazonaws.com",
    "sso.amazonaws.com",
    "ram.amazonaws.com",
    "ssm.amazonaws.com",
    "tagpolicies.tag.amazonaws.com"
  ]

  feature_set          = "ALL"
  enabled_policy_types = ["SERVICE_CONTROL_POLICY", "TAG_POLICY"]
}

resource "aws_organizations_organizational_unit" "active" {
  for_each  = var.business_unit
  name      = each.key
  parent_id = aws_organizations_organization.root.roots[0].id
}

resource "aws_organizations_organizational_unit" "trash" {
  name      = "trash"
  parent_id = aws_organizations_organization.root.roots[0].id
}

resource "aws_organizations_account" "account" {
  for_each = { for buenv in local.buEnv : "${buenv.buName}-${buenv.env}" => buenv }

  name              = "${each.value.buName}-${each.value.env}"
  email             = "email+${each.value.buName}-${each.value.env}@domain.com"
  parent_id         = aws_organizations_organizational_unit.active[each.value.buName].id
  close_on_deletion = true
  role_name         = "AdminCrossAccountRole"

  lifecycle {
    ignore_changes = [role_name]
  }
}
