## Step-by-step


#### A. Generate SSH KEY before execution:

ssh-keygen -t rsa -f ~/.ssh/aws

#### B. Point a reference of your pub key at "terraform.tfvars file". Remember to generate to a correct folder location and name, preventing overwrite of existent private keys. Also, point the VM AMI & AWS region.

#### C. Set your region & AWS credentials in "providers.tf file" & on your work directory (Example: /.aws/credentials)

#### D. Validate & Start Execution:

terraform init ; terraform apply

#### E. After VM Creation, get the public IP from output file and access using SSH:

ssh -i ~/.ssh/aws ubuntu@<VM_IP>

#### F. To Destroy the environment:

terraform destroy -auto--approve
