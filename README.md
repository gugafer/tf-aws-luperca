# AWS Luperca

## Objective:
Be able to create multiple AWS accounts
## The brief how:

Using AWS organizations and terraform

- You will need to change the email structure at the [aws_organizations_account.active](terraform/aws_org.tf), change "email" and "@domain.com" with real values, **do not** remove the plus sign everything after the plus sign is translated into tags for some email providers

```hcl
resource "aws_organizations_account" "account" {
  for_each = { for buenv in local.buEnv : "${buenv.buName}-${buenv.env}" => buenv }

  name              = "${each.value.buName}-${each.value.env}"
  email             = "email+${each.value.buName}-${each.value.env}@domain.com"
  parent_id         = aws_organizations_organizational_unit.active[each.value.buName].id
  close_on_deletion = true

  lifecycle {
    ignore_changes = [role_name]
  }
}

```

- You need to add your bussiness_unit name and the list of envs at [variables.tf](terraform/variables.tf) to create the accounts separated by env

exemple:
```hcl
variable "business_unit" {
  description = "Name of the business unit and the needed environments"
  default = {
    bu1 = ["prod", "dev"],
    bu2 = ["prod", "sbd", "stg", "dev"]
  }
}
```
## How?

Using github actions and Terraform this repo can create:
- Organization
- Organization Unit (OU)
- New AWS Accounts under the created OU
- Sevice Control Policies (SCP)
- Give the Organization ability to control:
    - [AWS Account Management](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-account.html)
    - [AWS CloudTrail](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-cloudtrail.html)
    - [AWS Config](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-config.html)
    - [AWS Resource Access Manager](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ram.html)
    - [AWS Systems Manager](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ssm.html)
    - [Tag policies](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-tag-policies.html)

In the Github actions, I'm using OpenID to authenticate at the AWS root account and passing the created role
via secret with the name of GITHUBOIDC_AWSROLE secret var in the CI and CD files.

For remote state, I'm using Terraform cloud with the local exec configurated there so I can execute all terraform steps here in the Github, it's necessary to create a token at terraform cloud and in the CI/CD files pass that secret, here I've called TF_AWS_ROOT_LAB.

For Infracost you will also need a API key, toget the key you can check their docs: [Get API key​](https://www.infracost.io/docs/#2-get-api-key), here I've called INFRACOST_API_KEY

For CI checks I'm using TFLint, Checkov, and Infracost.

Creating and pushing changes for a new branch will activate the CI workflow except if the changes are made in the **.md files.

When a pull request is open two comments will be added:
- The plan with what that code will change
- The Infracost check

When the PR is merged to the main branch the terraform will apply the changes described in the PR comment.

the only part of the code that need to be changed to create the organization units or accounts is the bussiness_unit variable in [variables.tf](terraform/variables.tf) and the email structure at the [aws_organizations_account.active](terraform/aws_org.tf)

Exemples:
- Creating OUs:
```hcl
variable "business_unit" {
  description = "Name of the business unit and the needed environments"
  default = {
    bu1 = [],
    bu2 = [],
    bu3 = []
  }
}
```
- Creating OUs and acconts:
```hcl
variable "business_unit" {
  description = "Name of the business unit and the needed environments"
  default = {
    bu1 = ["prod", "dev"],
    bu2 = ["prod", "dev"],
    bu2 = ["prod", "stg", "dev"]
  }
}
```
the naming will be:
- For organization unit will be the key: ```bu1```
- For the account will be key-listObject: ```bu1-prod```

**To remove an account is a bit more complicated:**
> If you remove the account from the list, the account will be immediately suspended, but if you try to remove the bu together with the account terraform will break because there is an object inside the OU

So a manual intervention is necessary and the change will need 2 PR
- First PR, remove the account
- Go to AWS Console or using AWS CLI move the suspended account to a "thrash" OU (this code generates one under the name of trash)
- Then the second PR removing de OU

**Last but not least:**

1. There is a complicated limit for accounts that can be suspended via API, check the values at [Quotas for AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html) if this happens you can safely do the manual process, the terraform code will update the account status and OU in the next run to match the reality.
1. Of course, to avoid surprises with AWS billing the secret GITHUBOIDC_AWSROLE is not configurated :clown_face:

## Why?

- Personal project.
- Learn more about the used tools.
- Share knowledge (that's why is public).

## Want to help or test?

**Read the [contrib file](CONTRIBUTING.md)**

### Extra Docs and ref:
- [What hell is _Luperca_?](https://en.wikipedia.org/wiki/Capitoline_Wolf)
- [Configuring OpenID Connect in Amazon Web Services](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
- [Accessing and administering the member accounts in your organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html)
- [AWS services that you can use with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html)
    - [AWS Account Management](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-account.html)
    - [AWS CloudTrail](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-cloudtrail.html)
    - [AWS Config](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-config.html)
    - [AWS Resource Access Manager](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ram.html)
    - [AWS Systems Manager](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ssm.html)
    - [Tag policies](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-tag-policies.html)
- [Service control policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
