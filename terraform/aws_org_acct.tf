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
