# Base repository for deploying instances on AWS using Terraform 



## About The Project 

This repository is based on EC2 terraform templates for deploying Windows and Unix VMs on AWS. The main objective is to provide a simple and fast way of deploying instances on AWS for troubleshooting and generating test environments to approximate customer environments and carry out simulations. Most of the codebase is using HCL(Hashicorp Configuration Language).



## Prerequisites
   
1. Terraform should be installed on your local or remote computer where the repository is cloned. Please refer [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for installation instructions.


2. For Terraform to run operations on your behalf, you must install and configure the AWS CLI tool. Please refer [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions) for instructions.

3. Git should be installed on the local or remote computer used for cloning the repository, as mentioned above. Please refer to the git installation guide [here](https://github.com/git-guides/install-git).


## Getting Started

To get started, you can clone the git repository to a desired location in your local or remote computer:

git clone git@github.com:brunoebernardi/ec2-tf.git
