# Banking Application Deployment with Docker image on AWS

## By Joseph White
-----

# Purpose

### This Banking App is designed using modern tech like Docker, Terraform, and Jenkins, aiming to create a secure and efficient banking platform. With a focus on making it safe for handling lots of transactions, which is important in banking. The app uses Docker for easy and consistent setup, and Terraform helps manage the infrastructure well. Adding Jenkins to the mix has been great for keeping the app updated smoothly. 
------

# Steps 
## 1) Git Clone Repo 

Incorporating [Git](https://github.com/z0sun/runit/blob/main/gitclone.md) steps in deploying our Banking App is essential for maintaining an organized, collaborative workflow. It ensures that all code changes are properly tracked and reviewed, critical for a secure and reliable banking platform.
-----

## 2) Terraform Files

Setting up the Jenkins environment [.tf file](https://github.com/z0sun/Deployment7/blob/main/intTerraform/jenkinsdocterra.tf) was a key move in rolling out our Banking App. It's where we got Jenkins, Docker, and Terraform into the mix. Jenkins is awesome for automating routine tasks like building and testing the app, which saves us a ton of time. Docker comes in handy to keep our environments consistent. And Terraform is a lifesaver for handling our cloud setup in a neat and organized way. This step was crucial because it streamlined update processes, making things a lot smoother and keeping our app solid and up-to-date. 
-------

## 3) Jenkins Build 

In our deployment process, the third step was adding the Jenkins manager and two Jenkins nodes, with one node on the Docker instance and the other on the Terraform instance. This setup allowed us to distribute the workload efficiently: the Docker node focuses on containerization tasks, ensuring our app is packaged and deployed consistently, while the Terraform node handles infrastructure changes smoothly and reliably. By splitting these responsibilities, we ensured a more robust CI/CD pipeline, enhancing both the speed and quality of our continuous integration and deployment processes. This architecture is crucial for keeping our Banking App's deployment agile, reliable, and scalable.

