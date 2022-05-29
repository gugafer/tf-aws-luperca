locals {
  buEnv = flatten([
    for buName, envList in var.business_unit : [
      for env in envList : {
        buName = buName
        env    = env
      }
    ]
  ])
}