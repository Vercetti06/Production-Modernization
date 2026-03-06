
---


```markdown
# EcoStream — Operations Runbook

This runbook defines operational procedures for safe deployments, disaster recovery, and scalability.

---

## 🚀 Deployment Flow  
### “How do we deploy on a Friday without fear?”

1. Developer pushes code to GitHub main branch
2. CI pipeline builds Docker image
3. Smoke tests executed
4. Image deployed to Development environment
5. QA validation in Staging
6. Manual approval gate
7. Production deployment triggered
8. Load Balancer routes traffic to new instances

### Rollback Procedure
- Re-deploy previous stable Docker image
- Auto Scaling replaces faulty instances
- Zero-downtime rollback supported

---

## 🛑 Disaster Recovery  
### “What happens if the database vanishes?”

### Scenario 1 — Instance Failure
- RDS Multi-AZ failover activates automatically
- Standby replica becomes primary
- No manual intervention required
- Downtime: ~1–2 minutes

### Scenario 2 — Full Database Loss
1. Restore from latest automated snapshot
2. New DB instance created
3. Application endpoint updated
4. Service resumes

### Backup Strategy
- Daily automated backups
- 7-day retention
- Point-in-time recovery enabled

---

## 📈 Scaling Strategy  
### “How do we handle 10x traffic tomorrow?”

### Horizontal Scaling
- Application Load Balancer distributes traffic
- Auto Scaling Group launches additional EC2 instances
- Stateless app design supports elasticity

### Scaling Triggers
- CPU utilization threshold
- Increase in request count
- Network throughput spikes

### Capacity Limits
- Minimum instances: 2
- Maximum instances: 6
- Dynamic scale-out policy

---

## 🔍 Monitoring & Alerts

### Metrics Monitored
- CPU utilization
- Memory usage
- Request latency
- HTTP 5xx error rate

### Alerting
- CloudWatch Alarms
- SNS email notifications

---

## 🔐 Security Operations

- No direct internet access to private tiers
- IAM roles used instead of credentials
- Secrets stored in AWS Secrets Manager
- Security Groups enforce least privilege

---

## 🧩 Environment Management

| Environment | Purpose |
|------------|---------|
| Dev | Development testing |
| Staging | Pre-production validation |
| Prod | Live workloads |

Terraform workspaces maintain isolation and state separation.
