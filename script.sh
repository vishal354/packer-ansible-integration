sudo apt update -y
sudo apt install pip -y

# Install Ansible on the control machine
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Install packer on the control machine
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get install packer -y

# Download the code for packer ansible integration
git clone https://github.com/vishal354/packer-ansible-integration.git
cd packer-ansible-integration/ansible

# Install awscli and setup the access keys using aws configure
sudo apt install awscli -y
aws configure

# How to make it work with packer
packer init .
packer validate .

