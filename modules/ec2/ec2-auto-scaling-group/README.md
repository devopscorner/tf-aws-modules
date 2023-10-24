# Terraform Module EC2 Ubuntu 22.04 Autoscalinng

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.50.0, < 5.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.50.0, < 5.7 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.selected](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.selected](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_eip.ec2](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/eip) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/instance) | resource |
| [aws_launch_template.selected](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.selected](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ssh](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.web](https://registry.terraform.io/providers/opentofu/aws/latest/docs/resources/security_group_rule) | resource |
| [terraform_remote_state.core_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The ID of the Ubuntu 22.04 AMI | `string` | `"ami-0d21214905506a7f4"` | no |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | The name of the Autoscaling Group | `string` | n/a | yes |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS Account ID to deploy the EC2 Instance in | `string` | n/a | yes |
| <a name="input_aws_account_profile"></a> [aws\_account\_profile](#input\_aws\_account\_profile) | The AWS Profile to deploy the EC2 Instance in | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the EC2 Instance in | `string` | n/a | yes |
| <a name="input_aws_zone"></a> [aws\_zone](#input\_aws\_zone) | The AWS zone to deploy the EC2 Instance in | `string` | n/a | yes |
| <a name="input_data_volume_size"></a> [data\_volume\_size](#input\_data\_volume\_size) | The size of the EBS volume (in GB) for additional partition | `number` | n/a | yes |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The desired capacity of the Autoscaling Group | `number` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br>  "default": "DEF",<br>  "lab": "RND",<br>  "prod": "PROD",<br>  "staging": "STG"<br>}</pre> | no |
| <a name="input_ingress_port"></a> [ingress\_port](#input\_ingress\_port) | The port for ingress traffic in the security group | `number` | n/a | yes |
| <a name="input_ingress_protocol"></a> [ingress\_protocol](#input\_ingress\_protocol) | The protocol for ingress traffic in the security group | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the EC2 instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The EC2 instance type | `string` | n/a | yes |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | The name of the EC2 key pair | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum number of instances in the Autoscaling Group | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The minimum number of instances in the Autoscaling Group | `number` | n/a | yes |
| <a name="input_remote_tfstate_bucket"></a> [remote\_tfstate\_bucket](#input\_remote\_tfstate\_bucket) | Name of bucket to load references tfstate | `string` | `"devopscorner-tf-remote-state"` | no |
| <a name="input_remote_tfstate_path"></a> [remote\_tfstate\_path](#input\_remote\_tfstate\_path) | Path remote references of .tfstate in Bucket | `string` | `"core/terraform.tfstate"` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the EBS volume (in GB) for root partition | `number` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the EC2 instance security group | `string` | n/a | yes |
| <a name="input_static_ip_name"></a> [static\_ip\_name](#input\_static\_ip\_name) | The name of the EC2 static IP | `string` | n/a | yes |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The ARN of the ALB target group | `string` | n/a | yes |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"devopscorner-tf-remote-state"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"devopscorner-tf-state-lock"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"ec2/terraform.tfstate"` | no |
| <a name="input_userdata"></a> [userdata](#input\_userdata) | The userdata script for EC2 instance configuration | `string` | n/a | yes |
| <a name="input_userdata_file"></a> [userdata\_file](#input\_userdata\_file) | The path to the userdata file | `string` | `"./userdata/ubuntu.sh"` | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br>  "default": "default",<br>  "lab": "rnd",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_arn"></a> [autoscaling\_group\_arn](#output\_autoscaling\_group\_arn) | The ARN of the Autoscaling Group |
| <a name="output_autoscaling_group_name"></a> [autoscaling\_group\_name](#output\_autoscaling\_group\_name) | The name of the Autoscaling Group |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the created EC2 instance |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the created EC2 instance security group |
<!-- END_TF_DOCS -->