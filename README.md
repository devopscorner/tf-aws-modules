# Modularity Terraform AWS (OpenTofu)

Production Grade Modularity AWS Terraform Modules

![all contributors](https://img.shields.io/github/contributors/devopscorner/tf-aws-modules)
![tags](https://img.shields.io/github/v/tag/devopscorner/tf-aws-modules?sort=semver)
![terraform](https://img.shields.io/static/v1?logo=terraform&logoColor=white&label=terraform&message=1.5.2&color=orange)
![download all](https://img.shields.io/github/downloads/devopscorner/tf-aws-modules/total.svg)
![download latest](https://img.shields.io/github/downloads/devopscorner/tf-aws-modules/1.2.2/total)
![view](https://views.whatilearened.today/views/github/devopscorner/tf-aws-modules.svg)
![clone](https://img.shields.io/badge/dynamic/json?color=success&label=clone&query=count&url=https://raw.githubusercontent.com/devopscorner/tf-aws-modules/master/clone.json?raw=True&logo=github)
![issues](https://img.shields.io/github/issues/devopscorner/tf-aws-modules)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/tf-aws-modules)
![forks](https://img.shields.io/github/forks/devopscorner/tf-aws-modules)
![stars](https://img.shields.io/github/stars/devopscorner/tf-aws-modules)
[![license](https://img.shields.io/github/license/devopscorner/tf-aws-modules)](https://img.shields.io/github/license/devopscorner/tf-aws-modules)

---

## Folder Structure

```
.
├── CHANGELOG.md
├── LICENSE
├── README.md
├── example
│   ├── terraform-workspace-project
│   │   ├── _tf_wsp_infra_core
│   │   ├── _tf_wsp_infra_core_ec2
│   │   ├── _tf_wsp_infra_core_eks
│   │   ├── _tf_wsp_infra_tfstate
│   │   ├── tf_wsp_ec2-auto-scaling-group
│   │   ├── tf_wsp_ec2-for-airflow
│   │   ├── tf_wsp_ec2-for-jumphost
│   │   ├── tf_wsp_ec2-os-amazon-linux-2
│   │   ├── tf_wsp_ec2-os-amazon-linux-2023
│   │   ├── tf_wsp_ec2-os-ubuntu-22.04
│   │   ├── tf_wsp_eks-devops
│   │   ├── tf_wsp_eks-golang
│   │   ├── tf_wsp_eks-laravel
│   │   └── tf_wsp_eks-nifi
│   ├── terragrunt-project
│   │   ├── _tg_infra_core
│   │   └── _tg_infra_tfstate
│   ├── terraspace-project
│   │   ├── _tsp_infra_core
│   │   └── _tsp_infra_tfstate
│   └── terraspace-project-flat
│   │   ├── _tsp_fl_infra_core
│   │   └── _tsp_fl_infra_tfstate
├── gen-docs.sh
└── modules
    ├── _core
    ├── _tfstate
    ├── acm
    ├── budget
    ├── ec2
    │   ├── ec2-amazon-linux-2
    │   ├── ec2-amazon-linux-2023
    │   ├── ec2-auto-scaling-group
    │   └── ec2-ubuntu-22.04
    ├── eks
    │   ├── _manifest
    │   ├── _scripts
    │   ├── _tags
    │   ├── nodegroup-cicd
    │   ├── nodegroup-golang
    │   ├── nodegroup-laravel
    │   ├── nodegroup-nifi
    │   └── nodegroup-redis
    ├── lightsails
    └── route53
```

## Tested Environment

### Versioning

- Docker version

  ```
  docker -v
  ---
  Docker version 20.10.21-rd, build ac29474

  docker version
  ---
  Client:
    Version:           20.10.21-rd
    API version:       1.41
    Go version:        go1.18.7
    Git commit:        ac29474
    Built:             Tue Nov 22 22:21:43 2022
    OS/Arch:           darwin/arm64
    Context:           desktop-linux
    Experimental:      true

  Server: Docker Desktop 4.17.0 (99724)
    Engine:
      Version:          20.10.23
      API version:      1.41 (minimum version 1.12)
      Go version:       go1.18.10
      Git commit:       6051f14
      Built:            Thu Jan 19 17:31:28 2023
      OS/Arch:          linux/arm64
      Experimental:     false
    containerd:
      Version:          1.6.18
      GitCommit:        2456e983eb9e37e47538f59ea18f2043c9a73640
    runc:
      Version:          1.1.4
      GitCommit:        v1.1.4-0-g5fd4c4d
    docker-init:
      Version:          0.19.0
      GitCommit:        de40ad0
  ```

- Docker-Compose version

  ```
  docker-compose -v
  ---
  Docker Compose version v2.14.0
  ```

- AWS Cli

  ```
  aws --version
  ---
  aws-cli/2.9.16 Python/3.9.11 Darwin/22.5.0 exe/x86_64 prompt/off
  ```

- Terraform Environment Cli

  ```
  tfenv -v
  ---
  tfenv 3.0.0
  ```

- Terraform Cli

  ```
  terraform version
  ---
  Terraform v1.5.2
  on darwin_amd64
  - provider registry.terraform.io/hashicorp/aws v3.74.3
  - provider registry.terraform.io/hashicorp/local v2.1.0
  - provider registry.terraform.io/hashicorp/null v3.1.0
  - provider registry.terraform.io/hashicorp/random v3.1.0
  - provider registry.terraform.io/hashicorp/time v0.7.2
  ```

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

## Security Check

Make sure that you didn't push sensitive information in this repository

- [ ] AWS Credentials (AWS_ACCESS_KEY, AWS_SECRET_KEY)
- [ ] AWS Account ID
- [ ] AWS Resources ARN
- [ ] Username & Password
- [ ] Private (id_rsa) & Public Key (id_rsa.pub)
- [ ] DNS Zone ID
- [ ] APP & API Key

## Copyright

- Author: **Dwi Fahni Denni (@zeroc0d3)**
- Vendor: **DevOps Corner Indonesia (devopscorner.id)**
- License: **Apache v2**
