Banking Application Deployment with Docker Image on AWS
Authored by Joseph White
<ins> Purpose </ins>
_________________
Our Banking Application is meticulously designed using advanced technologies such as Docker, Terraform, and Jenkins. This initiative is driven by the objective to establish a highly secure and efficient platform for managing substantial financial transactions. Docker facilitates a uniform and dependable setup, while Terraform proficiently orchestrates the infrastructure. The incorporation of Jenkins is critical for ensuring smooth and continuous updates, paramount in the banking sector's dynamic landscape.
Steps

<ins> 1) Git Clone Repository </ins>
________________
The integration of [Git](https://github.com/z0sun/runit/blob/main/gitclone.md) in the deployment process of our Banking Application is a deliberate and strategic decision. It serves as the backbone for a coherent and collaborative development workflow, ensuring that every code modification is rigorously tracked and scrutinized. This step is essential to uphold the security and reliability standards requisite in a banking platform.

<ins> 2) Terraform Files </ins>
_______________
Implementing the Jenkins environment through our [.tf](https://github.com/z0sun/Deployment7/blob/main/intTerraform/jenkinsdocterra.tf) file is a pivotal step in the deployment of our Banking App. This step harmoniously integrates Jenkins, Docker, and Terraform, optimizing our workflow. Jenkins excels in automating critical tasks like build and test processes, thereby elevating operational efficiency. Docker assures environmental consistency, and Terraform skillfully manages our cloud-based infrastructure. This phase is fundamental in refining our update processes, thus maintaining the resilience and currency of our application.

<ins> 3) Docker File </ins>
_______________
Central to our project, the [Dockerfile](https://github.com/z0sun/Deployment7/blob/main/dockerfile) acts as the blueprint for constructing the Docker image of our Banking Application, optimized for compatibility with an RDS database. This file is instrumental in ensuring a standard and replicable build process, encompassing all necessary steps, from setting up the application environment to installing dependencies, thereby guaranteeing a consistent and reliable deployment process.

<ins> 4) Jenkins Build </ins>
__________________
The establishment of a Jenkins manager and the strategic allocation of tasks to two distinct Jenkins nodes, one for [Docker](https://github.com/z0sun/Deployment7/blob/main/Docker%20Agent.png) and the other for [Terraform](https://github.com/z0sun/Deployment7/blob/main/Terraform%20Agent.png), marks a significant advancement in our deployment strategy. This structure permits an efficient workload distribution: the Docker node is dedicated to containerization tasks, assuring consistent packaging and deployment of our application, while the Terraform node adeptly administers infrastructure aspects. This bifurcation fortifies our CI/CD pipeline, substantially enhancing the velocity and caliber of our integration and deployment processes, and ensuring that our Banking Application is agile, robust, and scalable.
