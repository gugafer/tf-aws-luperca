resource "aws_organizations_organizational_unit" "suspended" {
  name      = "Suspended Accounts"
  parent_id = aws_organizations_organization.root.roots[0].id
}

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.root.roots[0].id
}

resource "aws_organizations_organizational_unit" "active" {
  for_each = var.business_unit

  name      = each.key
  parent_id = aws_organizations_organization.root.roots[0].id
}