# Generate SSH KEY before execution. After that, point a reference of your pub key at terraform.tfvars file.
# Remember to generate to a correct folder location and name, preventing overwrite of existent private keys
1. ssh-keygen -m PEM -t rsa -b 4096
2. Set your region & AWS credentials in providers.tf file

# Execution
1. terraform init
2. terraform plan
3. terraform apply

# Post Execution get the public IP from output file and access using
1. Go to AWS Console -> EC2 -> Windows instance -> Connect -> RDP Client -> Get password
2. Copy the data from your private key generated and get the Administrator Password
3. Download the RDP File or copy the Public IP to access
4. Get a RDP client depend on your OS to access the Windows VM

# Destroy
1. terraform destroy -auto-approve
