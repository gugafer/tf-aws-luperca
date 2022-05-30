# AWS Luperca

## Objective:
Be able to create multiple AWS accounts
## The brief how:
Using AWS organizations and terraform
You need to add your bussiness_unit name and the list of envs at [variables.tf](terraform/variables.tf) to create the accounts separated by env.

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

> A more specific how will be here briefly


## Why?

- Personal project.
- Learn more about the used tools.
- Share knowledge (that's why is public).

## Want to help or test?

**Read the [contrib file](CONTRIBUTING.md)**

### Extra Docs and ref:
- [What hell is _Luperca_?](https://en.wikipedia.org/wiki/Capitoline_Wolf)
- [Configuring OpenID Connect in Amazon Web Services](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
- [AWS services that you can use with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html)
    - [AWS Account Management](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-account.html)
    - [AWS CloudTrail](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-cloudtrail.html)
    - [AWS Config](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-config.html)
    - [AWS Resource Access Manager](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ram.html)
    - [AWS Systems Manager](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ssm.html)
    - [Tag policies](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-tag-policies.html)
- [Service control policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
