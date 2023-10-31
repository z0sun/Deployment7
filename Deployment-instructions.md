<p align="center">
<img src="https://github.com/kura-labs-org/kuralabs_deployment_1/blob/main/Kuralogo.png">
</p>

## Deployment Instructions:
1. Create a dockerfile of your Banking App and place it in your repository (Make sure you use the banking app connected to the RDS database)
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
2.  Use Terraform to create 3 instances in your default VPC for a Jenkins manager and agents architecture (see below for more information)
3. The following must be installed:
```
Instance 1:
- Jenkins, software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
Instance 2:
- Docker, default-jre, software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
Instance 3:
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
6. Edit the Jenkinsfile with your Docker Hub username on line 4
7. Edit the Jenkinsfile on lines 31 and 42 with your image name
8. Generate an Access Token from your DockerHub
9. Enter your username and token into Jenkins global credentials
10. When you enter your username and password, you will also see an ID section; enter {your-username}-dockerhub **EXAMPLE: tsanderson77-dockerhub**
11. Now install the Docker Pipeline plugin on Jenkins
12. Create a multibranch pipeline and run the Jenkinsfile 
13. Check your infrastructure and applications
14. Is your infrastructure secure? if yes or no, why? 
15. What happens when you terminate 1 instance? Is this infrastructure fault-tolerant?
16. Which subnet were the containers deployed in? 

