## Step-by-step


#### A. Generate SSH KEY before execution:

ssh-keygen -t rsa -f ~/.ssh/aws

##### NOTE: Remember to generate the correct folder location and name, preventing overwriting existing private keys.

#### B. Point a reference of your pub key at "terraform.tfvars file". Also, point to the VM AMI and AWS regions in this file.

#### C. Set your region & AWS credentials in "providers.tf file" and on your work directory(Example: /.aws/credentials).

#### D. Validate and Start Execution:

terraform init ; terraform apply

#### E. After VM Creation, get the public IP from the output file and access using SSH:

ssh -i ~/.ssh/aws ubuntu@<VM_IP>

#### F. To Destroy the Environment:

terraform destroy -auto-approve
