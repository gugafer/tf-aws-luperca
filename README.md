# AWS Luperca

## Objective:

## The brief how:

## How?

## Why?

- Personal project.
- Learn more about the used tools.
- Share knowledge (that's why is public).

## Want to help or test?

**Read the [contrib file](CONTRIBUTING.md)**

### Extra Docs and ref:
- [What hell is _Luperca_?](https://en.wikipedia.org/wiki/Capitoline_Wolf)
- [Configurando OpenID Connect em provedores da nuvem](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-cloud-providers)

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