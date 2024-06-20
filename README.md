# Ansible Molecule Installation Script

This repository contains a bash script to install Ansible, Molecule, and Docker on a Debian-based system (such as Ubuntu). 

## Prerequisites

- A Debian-based system (e.g., Ubuntu)
- sudo privileges

## Installation

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/your-username/your-repository.git
    cd your-repository
    ```

2. **Make the Script Executable:**

    ```bash
    chmod +x install_ansible_molecule.sh
    ```

3. **Run the Script:**

    ```bash
    ./install_ansible_molecule.sh
    ```

## Purpose of the Script

The `install_ansible_molecule.sh` script automates the installation and setup of the following components:

- **Ansible**: A powerful IT automation tool.
- **Molecule**: A testing framework for Ansible roles, providing a way to develop and test roles with multiple scenarios.
- **Docker**: A containerization platform used by Molecule for testing.

The script performs the following tasks:
- Updates the package list and installs necessary prerequisites.
- Creates a Python virtual environment for isolating Ansible and Molecule installations.
- Installs and upgrades `pip`.
- Installs Ansible and Molecule with Docker support.
- Installs Docker if it is not already installed.
- Verifies the installation of Ansible, Molecule, and Docker.

## Usage

After running the script, activate the virtual environment to use Ansible and Molecule:

```bash
source ansible-molecule-env/bin/activate
