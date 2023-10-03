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


