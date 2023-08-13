
# Deploying a WebServer on AWS

This project focuses on deploying coalfire first draft infrastructure on AWS provisioned through terraform. The architecture designed and executed is given below
![](coalfire_infra.png)

This infra consists of a standalone networking, compute & storage stack including which are as follows:

- **Networking:**  VPC, Public & Private Subnets, IGW, NGW, ALB, Route Tables & Associations
- **Compute:**  EC2, Redis
- **Storage:** RDS

## Accessing the application

You will hit the load balancer to view the app running on it. 


## Deploying a fresh Terraform script on AWS

Follow the steps given below to deploy a fresh end to end infra provisioned by terraform 

## Terraform Initialization
Open the Terraform Main Folder in the VSCode and in the root directory [ which
contains other directories like modules, template etc. ] ,

type the command given below for terraform initialization:

- terraform init

## Terraform Apply
Once terraform is initialized, run the command below to see which resources would get
deployed if terraform script runs successfully:

- terraform plan

The variable configuratiom files is **terraform.auto.tfvars** and you can change the attribute 
paramaters value over there of your own choice.  

To deploy infrastructure, run the command below in in root folder

- terraform apply

**NOTE**: Remember to run above command in /root-directory folder , Else it will give
ERROR due to File Location Issue.

After the command starts to run, terraform will show resources being created and will
ask permission from you to build up resources.

Type -- **yes** -- and AWS infrastructure will start to build up and get deployed.

## Terraform Destroy
If you want to destroy the terraform, type the command below:

- terraform destroy

On running this, terraform will show resources being destroyed and will
ask permission from you to clean up resources.

Type -- **yes** -- and AWS infrastructure will start to clean up and resources will be destroyed.

## SSH into an EC2 Instance

- Locate the already created wpserver-ohio-keypair present in your terraform code repository
- Go to the EC2 console in AWS
- Click and open the window's bastion instance
- Click on the connect option
- Go to the **connect using RDP** option 
- Follow the steps given like changing the key permission 
- From here, SSH to the redhat instance using SSH tools like **Putty**
- Do ssh and type yes when you hit the command and you will be inside the instance

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.19.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/alb | n/a |
| <a name="module_bastion_instance_1"></a> [bastion\_instance\_1](#module\_bastion\_instance\_1) | ./modules/ec2 | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | ./modules/securitygp | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |
| <a name="module_wpserver_ec2_1"></a> [wpserver\_ec2\_1](#module\_wpserver\_ec2\_1) | ./modules/ec2 | n/a |
| <a name="module_wpserver_ec2_2"></a> [wpserver\_ec2\_2](#module\_wpserver\_ec2\_2) | ./modules/ec2 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `any` | n/a | yes |
| <a name="input_db_instance_password"></a> [db\_instance\_password](#input\_db\_instance\_password) | n/a | `string` | `"gencoderstagedb"` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | n/a | `any` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->