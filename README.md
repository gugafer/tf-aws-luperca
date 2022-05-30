# AWS Luperca

## Objective:
Be able to create multiple AWS accounts
## The brief how:
Using AWS organizations and terraform
## How?

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

### Temp Notes

the trust relationship for the created role
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::YOUR-ACCT-NUMBER-NOT-MINE:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:USERNAME-OR-ORG/*"
                }
            }
        }
    ]
}
```