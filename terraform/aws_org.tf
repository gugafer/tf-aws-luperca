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
