# 📦 terraform-aws-ec2

This repository contains Terraform configuration files to provision an AWS EC2 instance using **Infrastructure as Code (IaC)**. It automates the complete setup process, allowing you to launch and manage EC2 instances efficiently, consistently, and with minimal manual intervention.

---

## ✅ Features

- 🚀 Creates an EC2 instance on AWS using Terraform
- ⚙️ Supports custom instance types, AMIs, and key pairs
- 🏷️ Allows tagging and user data provisioning
- 📄 Easily configurable using `terraform.tfvars`
- ♻️ Modular and reusable codebase

---

## 🛠️ Technologies Used

- [Terraform](https://www.terraform.io/) (v1.x)
- [AWS EC2](https://aws.amazon.com/ec2/)
- [AWS Provider for Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest)

---

## 🚀 Use Cases

- Quick EC2 provisioning for development or testing environments
- Part of larger infrastructure setups using Terraform modules
- Learning and experimentation with Terraform + AWS

---

## 📂 Project Structure

terraform-aws-ec2/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── install_nginx.sh
├── .gitignore
└── README.md


---

## ▶️ Getting Started

### 1. Initialize Terraform
```bash
terraform init


terraform plan
terraform apply


## 📌 Notes on Version Control and Cleanup

To ensure security and prevent large file issues:

- The `.terraform/` directory is excluded using `.gitignore` to avoid committing downloaded providers and caches.
- Any previously committed large files (e.g., provider binaries) were removed using [`git filter-repo`](https://github.com/newren/git-filter-repo).
- **Private keys** (e.g., `.pem`) are **never included** in this repository to protect sensitive access credentials.

---

## 🔒 Security Best Practices

- Never commit your `.pem` files, secrets, or `*.tfvars` files containing credentials.
- Always use **environment variables** or **secret managers** (like [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/)) to manage sensitive data in production environments.
