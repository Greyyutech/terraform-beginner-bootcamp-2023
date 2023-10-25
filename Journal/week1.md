# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module strcuture is as follows:

```
PROJECT_ROOT
│
├── main.tf            everything else
├── variables.tf       stores the structure of input variables
├── providers.tf       defined required providers and their configuration
├── outputs.tf         stores outputs
├── terraform.tfvars   the data of variables we want to load into our Terraform project
└── README.md          required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

## Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash eg. AWS credentials

- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensentive so they are not shown visibility in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)


### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my_user_uuid`

### var-file flag

### terraform.tfvars

This is the default file to load in terraform variables in blunk

### auto.tfvars

### order of terraform variables