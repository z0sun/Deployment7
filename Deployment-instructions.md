<p align="center">
<img src="https://github.com/kura-labs-org/kuralabs_deployment_1/blob/main/Kuralogo.png">
</p>

## Deployment Instructions:
1. Create a new Banking App image and push it to Docker Hub (Make sure you create and connect an RDS database to your app)
2. Change the following resources name tags or name values below:
```
main.tf:
- #Cluster name
- #Task Definition: Family
- container_definitions:
    - name
    - image
    - containerPort
- execution_role_arn
- task_role_arn
- #ECS Service name
- container_name
- container_port

ALB.tf
- #Traget Group name
- port
- #Application Load Balancer name


```
2.  Use Terraform to create 2 instances in your default VPC for a Jenkins manager and agent architecture (see below for more information)
3. The following must be installed:
```
Instance 1:
- Jenkins, software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
Instance 2:
- Terraform and default-jre
```
4. Observe the VPC.tf file and make sure the below resources are being created: 
    - 2 AZ's
    - 2 Public Subnets
    - 2 Private Subnets
    - 1 NAT Gateway
    - 2 Route Table
    - Security Group Ports: 8000
    - Security Group Ports: 80     
5. Observe the Terraform resources in the main.tf and ALB.tf:
```
- aws_ecs_cluster
- aws_cloudwatch_log_group
- aws_ecs_task_definition
- aws_ecs_service
- aws_lb_target_group
- aws_alb
- aws_alb_listener
``` 
6. Create a multibranch pipeline and run the Jenkinsfile 
7. Check your infrastructure and applications
8. Is your infrastructure secure? if yes or no, why? 
9. What happens when you terminate 1 instance? Is this infrastructure fault-tolerant?  

