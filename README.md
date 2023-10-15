# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)
Given a version number **MAJOR.MINOR.PATCH**, increment the:

The genernal format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


## Install the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have chagned due to gpg keying changes. So we needed to refer to the latest install CLI instructions via Terraform Documentation and chagne the scripting for installation.


[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Refacting into Bash Scripts
While fixing the Terraforms CLI gpg depreciation issues we notice that bash scripts steps were a considerateable amount more code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [.bin/install_terraform_cli](./bin/install_terraform_cli)

- Thi will keep the Gitpod Task File ([.gitpod.yml]([.gitpod.yml))tidy.
- This allow us an easier to debug and execute manually Terraform CLI install
- This wil allow better portablity for other projects that need to install Terraform CLI.

#### Shebang Consideratiaons

A Shebang (pronced Sha-bang) tells the bash script what program that will interpet the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions
- will search the user's PATH for the bash executable

#### Execution Considerations
When executing the bash script we can use the `./` shorthand notiationto execute the bash script.

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Linux Considerations
https://en.wikipedia.org/wiki/File-system_permissions

#### Github Lifecycle (Before, Init, Command)
https://www.gitpod.io/docs/configure/workspaces/tasks

#### Working Env Vars

We can list out all Environment Variables (Env Vars) Using the `env` command

We can filter specfic env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the termininal we can set using `export HELLO='world'`

In the termininal we can unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```

Wwithin a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminal in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

we can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO=`world`
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.

### AWS CLI Installation

AWS CLI is intalled for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)


[Getting Started Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)


[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured  correctly by running the following AWS CLI command:

```sh
aws sts get-caller-identity
```

If it is successful you should see a json payload return that looks like this:

```json
{
    "UserId": "AIAUW67KMMFAYCHVGA",
    "Account": "123456789",
    "Arn": "arn:aws:iam::112233:user/terraform-beginner-bootcamp"
}
```

We will need to generate AWS CLI credits from IAM User in order to use AWS CLI.


## Terraform Basics

### Terraform Registry

Terraform sources their providers and moudules from the Terraform registry which located at [registry.terraform.i](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resouces in terraform.

- **Modules** are a way to make large ammount of terraform code modular, portable and sharable.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

## Terraform console 

We can see a list of all the Terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### Terraform plan

`terraform plan`

This will generate out a changest, about the state of our infrastrucuture and what will be. chagned.

We can out this chagneset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Aplly

`terraform apply`

This will run a plan and pass the chagneset to be excuete by terraform. Apply should prompt yes or no.

If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modulues that should be used with this project.

The Terrafrom Lock File **should be committed** to your Version Control System (VSC) eg. GitHub

### Terrafrom State Files

`.terraform.tfstate` contain information about the current state of your infrastructure.

This file **should not be committed** to your VSC.

Thi file can contain sensentive data.

If you lose this file, you lose knowning the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.