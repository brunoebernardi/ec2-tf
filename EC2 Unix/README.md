# Generate SSH KEY before execution. After that, point a reference of your pub key at terraform.tfvars file.
# Remember to generate to a correct folder location and name, preventing overwrite of existent private keys
ssh-keygen -t rsa -f ~/.ssh/aws

# Set your region & AWS credentials in providers.tf file & on your work directory (Example: ˜/.aws/credentials)

# Execution
terraform init
terraform plan
terraform apply

# Post Execution get the public IP from output file and access using
ssh -i ~/.ssh/aws ubuntu@<IP>

# Destroy
terraform destroy
