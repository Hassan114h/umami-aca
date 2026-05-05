The deployment is fully automated on Microsoft Azure using Infrastructure as Code and CI/CD best practices. Terraform is used to provision all required cloud resources, including a secure Azure Container Apps environment, networking components, and a private PostgreSQL database with no public internet exposure. The application is containerised using Docker and stored securely in Azure Container Registry.

A CI/CD pipeline is implemented using GitHub Actions, automating the build and deployment process.

Traffic is routed through Azure Front Door, enabling secure HTTPS access, global load balancing, and improved application performance. DNS resolution is managed externally, allowing seamless integration with a custom domain.


## App 
<img width="820" height="391" alt="image" src="https://github.com/user-attachments/assets/4b1fcaf4-202b-4447-bcf3-8751ea89bf7d" />
