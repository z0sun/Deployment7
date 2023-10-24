<p align="center">
<img src="https://github.com/kura-labs-org/kuralabs_deployment_1/blob/main/Kuralogo.png">
</p>

## Deployment Instructions:
1. Follow the naming convention below for all resources created in AWS:
```
VPC:
- deplpoyment#-vpc-prod, example: deployment6-vpc-prod
Instances:
- Function#-prod, example: jenkinsServer01-prod
Security Groups:
- purposeSG, example: HttpAcessSG
Subnets:
- purposeSubnet#, example: publicSubnet01
Load Balancer:
- purpose-region, example: ALB-east
```
2.  Use Terraform to create 2 instances in your default VPC for a Jenkins manager and agent architecture (see below for more information)
3. The following must be installed:
```
Instance 1:
- Jenkins, software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
Instance 2:
- Terraform and default-jre
```
4. Create 1 VPC, cloudwatch, and configure ECS with Terraform. **MUST** have the following components in each VPC:
    - 2 AZ's
    - 2 Public Subnets
    - 2 Private Subnets
    - 1 NAT Gateway
    - 2 Containers
    - 2 Route Table
    - 1 ALB
    - Security Group Ports: 8000      
5. The Terraform resources you'll need for the ECS configurations:
```
- aws_ecs_cluster
- aws_cloudwatch_log_group
- aws_ecs_task_definition
- aws_ecs_service
- aws_lb_target_group
- aws_alb
- aws_alb_listener
```
6. Create a new Banking App image (Make sure you create and connect an RDS database to your container)  
7. Create a multibranch pipeline and run the Jenkinsfile 
8. Check your infrastructure and applications
9. Is your infrastructure secure? if yes or no, why? 
10. When you set your ECS service to 2 desired instances, what happens when you terminate 1 instance? Is this infrastructure fault-tolerant?  

