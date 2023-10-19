<p align="center">
<img src="https://github.com/kura-labs-org/kuralabs_deployment_1/blob/main/Kuralogo.png">
</p>

## Deployment Instructions:
1. Create 2 instances in your default VPC for a Jenkins manager and agent architecture (see below for more information)
2. The following must be installed:
```
Instance 1:
- Jenkins, software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
Instance 2:
- Terraform and default-jre
```
4. Create two VPCs with Terraform, 1 VPC in US-east-1 and the other VPC in US-west-2. **MUST** have the following components in each VPC:
    - 2 AZ's
    - 2 Public Subnets
    - 2 EC2's
    - 1 Route Table
    - Security Group Ports: 8000 and 22     
5. Create a script that will install and deploy the Banking application for each instance
```
- The following must be installed for the application to run: software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
- Once you activate the virtual environment, the following must be installed: pip install mysqlclient, pip install gunicorn
```
3. Now create an RDS database: [instructions here](https://scribehow.com/shared/How_to_Create_an_AWS_RDS_Database__zqPZ-jdRTHqiOGdhjMI8Zw)
4. Change the following MySQL endpoints to your endpoints:
   - The naming scheme you'll need to enter in each file:
       
   - database.py:
     ![image](https://github.com/kura-labs-org/c4_deployment-6/blob/main/database.png)
     
   - load_data.py
     ![image](https://github.com/kura-labs-org/c4_deployment-6/blob/main/load.png)
     
   - app.py
     ![image](https://github.com/kura-labs-org/c4_deployment-6/blob/main/app.png)
     
4. **Note:** Once you've deployed the application the first time, you will not need to load the database files again
5. Configure your AWS credentials in Jenkins: [instructions here](https://scribehow.com/shared/How_to_Securely_Configure_AWS_Access_Keys_in_Jenkins__MNeQvA0RSOWj4Ig3pdzIPw)
6. Now place your Terraform files for US-east-1 in the inTerraform directory
7. Create a multibranch pipeline and run the Jenkinsfile 
8. Check your infrastructure and applications (test the applications)
9. Once you've deployed to US-east-1, place your terraform files of US-west-2 in the intTerraform2 directory
10. Figure out how to edit the Jenkinsfile to deploy US-west-2
11. Once you've deployed to both regions, create an application load balancer for US-east-1 and US-west-2: [instructions here](https://scribehow.com/shared/Creating_Load_Balancer_with_Target_Groups_for_EC2_Instances__WjPUNqE4SLCpkcYRouPjjA)
12. With both infrastructures deployed, is there anything else we should add to our infrastructure?  

