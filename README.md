# Azure Container Apps - Web Analytics Platform

This project demonstrates a fully automated cloud-native deployment on Microsoft Azure using Infrastructure as Code and CI/CD best practices. Terraform is used to provision and manage all cloud infrastructure, enabling scalable, repeatable and reliable deployments. The application is containerised using Docker and deployed to Azure Container Apps within a secure network architecture. Traffic is securely routed through Azure Front Door using HTTPS to provide secure external access. GitHub Actions is used to automate the build and deployment pipeline.

## Key Features
- Provisioned cloud infrastructure using Terraform following Infrastructure as Code best practices
- Built a CI/CD pipeline using GitHub Actions to automate application build and deployment processes
- Containerised the application using Docker with multi-stage builds to reduce image size and optimise deployments
- Configured a remote Terraform backend using Azure Storage to securely store and manage Terraform state files
- Deployed a secure Azure Container Apps environment for hosting containerised workloads
- Implemented private networking using VNets and subnets for secure communication between resources
- Deployed a private Azure PostgreSQL Flexible Server with no direct public internet exposure
- Stored and managed container images securely within Azure Container Registry (ACR)
- Integrated Azure Key Vault for secure secret and configuration management
- Configured Azure Front Door for HTTPS routing, load balancing and improved application performance

## App 
<img width="820" height="391" alt="image" src="https://github.com/user-attachments/assets/4b1fcaf4-202b-4447-bcf3-8751ea89bf7d" />
