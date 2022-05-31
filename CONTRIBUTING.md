# Contribuiting Guide:

> Thank you for investing your time in contributing to our project! In this guide you will get an overview of the contribution workflow from creating a PR, reviewing, and merging the PR.

_Plagiarized from Github..._

---

## How to help, improve or test it

- Create a new branch
- Open a PR to the main branch. _**Direct commits to main are not allowed.**_

## The development flow:

It looks like TBD (Trunk Based Development).
- The process is a manual due to the costs of AWS so:
    - Create a new branch
    - Locally test with [TFLint](https://github.com/terraform-linters/tflint) and [Checkov](https://www.checkov.io/)
    - Open a PR

## The test phase

When I receive your PR, I'll:
- Activate the actions
- Run your code against the CI phase
- Check if the [Terraform-Docs](https://terraform-docs.io/) was generated
- All good? Merge time!

## The deployment phase

Checks completed:
- I approve your PR
- After the merge has be done I'll run the actions and reply with results to you

**I know, a lot of manual intervention, but I don't want any surprise with AWS billing**