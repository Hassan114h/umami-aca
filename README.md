# Azure Container Apps - Web Analytics Platform

This project deploys the open-source **Umami analytics platform** on Microsoft Azure using a fully automated cloud-native architecture. The infrastructure is provisioned and managed with **Terraform**, while **GitHub Actions** automates the CI/CD pipeline for consistent deployments. The Umami application is containerised with **Docker** and deployed to **Azure Container Apps** within a secure private networking environment. External traffic is securely routed through **Azure Front Door** using HTTPS.

## Key Features

- Provisioned Azure infrastructure using **Terraform** following **Infrastructure as Code (IaC)** best practices, using modularised Terraform code and Azure Blob Storage for remote state management
- Built a fully automated **CI/CD pipeline** using **GitHub Actions** to handle application build, deployment, and infrastructure provisioning
- Containerised the **Umami analytics application** using **Docker** with **multi-stage builds** to optimise image size and deployment efficiency
- Deployed the application to **Azure Container Apps (ACA)** for scalable and serverless container hosting
- Implemented secure private networking using **Azure Virtual Networks (VNets)** and **subnets** to isolate cloud resources
- Deployed an **Azure PostgreSQL Flexible Server** within a private network, preventing direct public internet access to the database
- Stored and managed container images using **Azure Container Registry (ACR)**
- Integrated **Azure Key Vault** for secure management of application secrets and sensitive configuration values
- Configured **Azure Front Door** to provide secure HTTPS routing, external access, and global traffic distribution
- Integrated **Grype**, **TFLint**, and **TFSec** into the CI/CD pipelines to detect container vulnerabilities and Terraform security misconfigurations before deployment

---

## Architecture Diagram 
<img width="1038" height="754" alt="image" src="https://github.com/user-attachments/assets/61bc2af7-f72e-45e9-84f2-d54e7b03f1a9" />

---

## App 
<img width="800" height="419" alt="ezgif-7f6faf77806e68e2" src="https://github.com/user-attachments/assets/90b4cfa0-b3bc-4e8b-ab44-b16e785cd0f0" />
