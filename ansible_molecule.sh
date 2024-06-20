#!/bin/bash

# Function to check if a command exists
command_exists () {
    command -v "$1" &> /dev/null ;
}

# Update package list and install prerequisites
sudo apt update
sudo apt install -y python3 python3-pip python3-venv

# Create a virtual environment for Ansible and Molecule
python3 -m venv ansible-molecule-env
source ansible-molecule-env/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install Ansible
pip install ansible

# Install Molecule with Docker support
pip install molecule[docker]

# Install Docker if not already installed
if ! command_exists docker; then
    echo "Docker not found, installing Docker..."
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce
    sudo usermod -aG docker $USER
    echo "Docker installed. You might need to log out and log back in for Docker to work properly."
else
    echo "Docker is already installed."
fi

# Verify installations
echo "Verifying installations..."

# Check Ansible
if command_exists ansible; then
    echo "Ansible is installed:"
    ansible --version
else
    echo "Ansible is not installed correctly."
fi

# Check Molecule
if command_exists molecule; then
    echo "Molecule is installed:"
    molecule --version
else
    echo "Molecule is not installed correctly."
fi

# Check Docker
if command_exists docker; then
    echo "Docker is installed:"
    docker --version
else
    echo "Docker is not installed correctly."
fi

# Print success message
echo "To use Ansible and Molecule, activate the virtual environment with: source ansible-molecule-env/bin/activate"
