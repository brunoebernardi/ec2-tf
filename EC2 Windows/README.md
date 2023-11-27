## Step-by-step


#### A. Generate SSH KEY before execution:

ssh-keygen -m PEM -t rsa -b 4096

##### NOTE: Remember to generate the correct folder location and name, preventing overwriting existing private keys.

#### B. Point a reference of your pub key at "terraform.tfvars file". Also, point to the AMI & AWS regions in this same file.

#### C. Set your region & AWS credentials in "providers.tf file" and on your work directory (Example: /.aws/credentials)

#### D. Validate and Start Execution:

terraform init ; terraform apply

#### E. After VM Creation, get the public IP from the output file and access using:

1. Go to AWS Console -> EC2 -> Windows instance -> Connect -> RDP Client -> Get password
2. Copy the data from your private key generated and get the Administrator Password
3. Download the RDP File or copy the Public IP to access
4. Get an RDP client, depending on your OS, to access the Windows VM

#### F. To Destroy the Environment:

terraform destroy -auto-approve
