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

## Dealing With Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likely have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't for all cloud resources. You need check the terraform providers documentation for which resources supoort import.

### Fixing missing Resoruce with Terraform Import

`terraform import aws_s3_bucket.example`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket.html)


### Fix Manual Configuration

If someone goes and delete or modifies cloud resource manually through Clickops.

If we run Terraform plan is with attempt to put our infrastructure back into the expected state fixing Configuration Drift


## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```



## Terraform Module

### Terraform Module Strucutre

It is recommand to place moduels in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variable to our module.
The module has to declare the terraform variable in its own variable.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:

- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```