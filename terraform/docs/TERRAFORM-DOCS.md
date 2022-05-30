## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_account.account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_organizations_organization.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organizational_unit.active](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.trash](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_policy.bca](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.bcca](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.dsous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.pesr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.tmp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy_attachment.bca](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_organizations_policy_attachment.bcca](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_organizations_policy_attachment.dsous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_organizations_policy_attachment.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_organizations_policy_attachment.tmp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_organizations_organization.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Name of the business unit and the needed environments | `map` | <pre>{<br>  "bu-name": [<br>    "env1",<br>    "env2",<br>    "env3"<br>  ]<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_non_root_accounts"></a> [non\_root\_accounts](#output\_non\_root\_accounts) | Information about arn, id and status of the managed account |
