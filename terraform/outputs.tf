output "non_master_accounts" {
  value = data.aws_organizations_organization.root.non_master_accounts
}
