# EcoStream — Production Infrastructure Modernization (AWS DevOps Assignment)

## 📌 Overview

EcoStream is a green-energy monitoring platform preparing for rapid scale from 5,000 to 500,000 users.  
This project modernizes the legacy “all-in-one” setup into a secure, automated, and production-ready cloud architecture on AWS.

The solution implements a **Software Factory** model where code moves safely from development to production through automated pipelines and infrastructure is managed as code.

---

## 🏗️ Architecture Summary

The platform uses a secure and scalable **3-Tier AWS Architecture**.

### Network Layer
- Amazon VPC (isolated network boundary)
- Public Subnets
  - Application Load Balancer (internet facing)
- Private Subnets
  - Application Tier (EC2 Auto Scaling Group)
  - Data Tier (Amazon RDS)

### Traffic Flow
User → Internet → Load Balancer → Private App Servers → Private Database

### Compute Layer
- EC2 instances in Auto Scaling Group
- Stateless application containers
- Horizontal scaling enabled

### Data Layer
- Amazon RDS (PostgreSQL)
- Multi-AZ high availability
- Automated backups
- Encrypted storage

---

## 🧩 Multi-Environment Strategy (Isolation)

To prevent development activity from impacting production:

| Environment | Purpose |
|------------|---------|
| Development | Feature testing |
| Staging | Pre-production validation |
| Production | Live user traffic |

### Implementation
- Terraform Workspaces
- Separate state files
- Environment-specific variable files
- Environment-based resource naming

This ensures strict operational isolation.

---

## ⚙️ Infrastructure as Code

All infrastructure is provisioned using Terraform.

### Managed Resources
- VPC, Subnets, Internet Gateway
- Security Groups (least-privilege rules)
- Application Load Balancer
- Launch Templates
- Auto Scaling Groups
- Amazon RDS
- DB Subnet Groups

Benefits:
- Version controlled infrastructure
- Reproducible environments
- Safe rollbacks
- Automated provisioning

---

## 🚀 CI/CD Pipeline

GitHub Actions pipeline replaces manual SSH deployments.

### Pipeline Flow
1. Developer pushes code to GitHub
2. Docker image is built
3. Smoke tests executed
4. Deploy to Development
5. Manual approval gate
6. Deploy to Production

This ensures safe and auditable releases.

---

## 🔐 Security Design

### Network Security
- Only Load Balancer is public
- App and DB tiers are private
- No direct SSH access from internet

### Access Control
- IAM roles for services
- No static credentials
- Principle of least privilege

### Secrets Management
- AWS Secrets Manager / Parameter Store
- No secrets in source code

---

## 📊 Observability

Monitoring and alerting stack:

- Amazon CloudWatch Logs
- CloudWatch Metrics
- CloudWatch Alarms
- SNS Notifications

Key Metrics:
- CPU utilization
- Memory usage
- Request latency
- HTTP 5xx errors

---

## 📈 Scalability

Auto Scaling Group ensures elasticity:

- Min instances: 2
- Desired: 3
- Max: 6

Scale triggers:
- CPU utilization
- Traffic increase

Stateless design enables horizontal scaling.

---

## 🗄️ Database Reliability

- Amazon RDS Multi-AZ deployment
- Automated daily backups
- Point-in-time recovery
- Storage encryption (KMS)

---

## 🐳 Application Containerization

- Python Flask application
- Dockerized for portability
- Gunicorn production server
- Health endpoint enabled

---

## 📁 Repository Structure

