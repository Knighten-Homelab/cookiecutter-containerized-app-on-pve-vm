# Homelab - Cookiecutter Template For Containerized  App Deployed On A PVE VM

This repo is used with [cookiecutter](https://github.com/cookiecutter/cookiecutter) to create templated projects for deploying a containerized application on a Proxmox Virtual Environment (PVE) VM. It is designed to quickly and efficiently bootstrap new projects in the Knighten-Homelab organization.

## Template Features
- **Devcontainer**: A development container containing terraform, ansible, and hashicorp vault CLI.
- **Terraform**: Terraform configuration files to create a VM on PVE, setup for dual environments (test, prod).
- **Ansible**: Ansible playbooks to create AWX resources and an Ansible role to install and configure the application.
- **GitHub Actions**: Multiple GitHub Actions workflows that provide a GitOps experience.
- **README Generation**: A README file is generated based on the provided project name and description.
- **Architecture Diagram**: An architecture diagram template to be extended with any app‑specific details.

The template is designed to be flexible and extensible, allowing you to easily add or modify features as needed. By default it will deploy a hello‑world containerized application, but you can easily modify the template to deploy any containerized application that is needed. In most instances, you will focus on modifying the provided ansible role to install and configure the application. You will mostly focus on the docker-compose template file and the tasks in the ansible role.

## Usage

To use this template, you need to have [cookiecutter](https://cookiecutter.readthedocs.io/en/latest/installation.html) installed. You can install it using pip:

```bash
pip install cookiecutter
```
Then, you can create a new project using the template by running the following command:

```bash
cookiecutter gh:Knighten-Homelab/cookiecutter-containerized-app-on-pve-vm
```

This repo contains a devcontainer that will automatically install cookiecutter for you. To use the devcontainer, open the project in VSCode and select "Reopen in Container" from the command palette. Once the container is running, you can run the `cookiecutter` command from the terminal.

## Development

When developing this template, you can use the commands in the provided Makefile to build and test the template. The Makefile contains the following targets:
- `generate`: Generate a new project using the template.
- `test`: Generates a new project using the template using the `--no-input` flag.

As you add features to this template, periodically run `make test` and verify the generated files are correct. This will help ensure that the template is working as expected and that any changes you make do not break existing functionality.