# Modularity Terraform AWS (OpenTofu)

Production Grade Modularity AWS Terraform Modules

![all contributors](https://img.shields.io/github/contributors/devopscorner/tf-aws-modules)
![tags](https://img.shields.io/github/v/tag/devopscorner/tf-aws-modules?sort=semver)
![terraform](https://img.shields.io/static/v1?logo=terraform&logoColor=white&label=terraform&message=1.5.2&color=orange)
![download all](https://img.shields.io/github/downloads/devopscorner/tf-aws-modules/total.svg)
![view](https://views.whatilearened.today/views/github/devopscorner/tf-aws-modules.svg)
![clone](https://img.shields.io/badge/dynamic/json?color=success&label=clone&query=count&url=https://raw.githubusercontent.com/devopscorner/tf-aws-modules/master/clone.json?raw=True&logo=github)
![issues](https://img.shields.io/github/issues/devopscorner/tf-aws-modules)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/tf-aws-modules)
![forks](https://img.shields.io/github/forks/devopscorner/tf-aws-modules)
![stars](https://img.shields.io/github/stars/devopscorner/tf-aws-modules)
[![license](https://img.shields.io/github/license/devopscorner/tf-aws-modules)](https://img.shields.io/github/license/devopscorner/tf-aws-modules)

---
## Version 1.2.1

### Features

- Multi Provider AWS
  - Terraform Provider

    ```
    terraform {
      required_version = ">= 1.5.0"

      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = ">= 4.50.0, < 5.7"
        }

        random = ">= 2.0"
      }
    }
    ```

  - OpenTofu Provider

    ```
    terraform {
      required_version = ">= 1.5.0"

      required_providers {
        aws = {
          source  = "opentofu/aws"
          version = ">= 4.50.0, < 5.7"
        }

        random = ">= 2.0"
      }
    }
    ```

- Tested OpenTofu Environment
  - OpenTofu AMD 64-bit

    ```
    tofu version
    ---
    OpenTofu v1.6.0-alpha3
    on linux_amd64
    ```

  - OpenTofu ARM 64-bit

    ```
    tofu version
    ---
    OpenTofu v1.6.0-alpha3
    on darwin_arm64
    ```

---
## Version 1.2.0

### Features

- Added Terraform EKS Modules
  - Terraform Workspace Module EKS DevOps
  - Terraform Workspace Module EKS Golang
  - Terraform Workspace Module EKS Laravel
  - Terraform Workspace Module EKS Nifi
- Using OpenTofu (`tofu`) as default running terraform

---
## Version 1.1.0

### Features

- Terraform Workspace Example
  - Terraform Workspace Module EC2 Amazon Linux 2
  - Terraform Workspace Module EC2 Amazon Linux 2023
  - Terraform Workspace Module EC2 Ubuntu
  - Terraform Workspace Module EC2 Autoscaling (Ubuntu 22.04)
  - Terraform Workspace Module EC2 for Airflow
  - Terraform Workspace Module EC2 for Jumphost

---
## Version 1.0.0

### Features

- Terraform Core Infrastructure
- Terraform Remote State
- Terraform Module ACM
- Terraform Module Budget
- Terraform Module EC2
  - Terraform Module EC2 Autoscaling Group
  - Terraform Module EC2 Ubuntu 22.04 x86
  - Terraform Module EC2 Ubuntu 22.04 ARM
  - Terraform Module EC2 Amazon Linux 2 x86
  - Terraform Module EC2 Amazon Linux 2 ARM
  - Terraform Module EC2 Amazon Linux 2023 x86
  - Terraform Module EC2 Amazon Linux 2023 ARM
- Terraform Module Lightsails
- Terraform Module Route53