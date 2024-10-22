# Spring PetClinic with Docker, Docker Compose, Kubernetes, CI/CD, and Ansible

This project demonstrates the deployment of the Spring PetClinic application using Docker, Docker Compose for local testing, and Kubernetes for orchestration. It also includes CI/CD integration with Jenkins and automation of the installation process using Ansible. The setup features persistent storage, environment configuration using ConfigMaps and Secrets, and two deployments: one for the PetClinic application and one for MySQL.

## Prerequisites

- Docker
- Docker Compose
- Kubernetes cluster (Minikube)
- kubectl CLI tool
- Ansible
- Jenkins

## Getting Started

### Docker

A custom Docker image has been created for the Spring PetClinic application, allowing for easy containerization. The image is named `hossam136/spring-petclinic-image`, based on the official repository: [spring-petclinic](https://github.com/spring-projects/spring-petclinic.git).

### Docker Compose

For local testing, a `docker-compose-1.yml` is provided, which sets up the Spring PetClinic application along with a MySQL database.

#### Steps to Run Locally

1. Clone the repository:

   ```bash
   git clone https://github.com/spring-projects/spring-petclinic.git
   cd spring-petclinic

2. Build the Docker image:
   
   ```bash
   docker build -t hossam136/spring-petclinic-image .
   
3. Run the application with Docker Compose:

   ```bash
   docker-compose up

The application should be available at http://localhost:8080.

### Kubernetes

The project is also configured for orchestration using Kubernetes, with the following components:

- **ConfigMap**: Holds environment variables for the application.
- **Secrets**: Stores sensitive information like database credentials.
- **Persistent Volume (PV) and Persistent Volume Claim (PVC)**: Ensures data persistence for the MySQL database.
- **Deployments**: Separate deployments for the Spring PetClinic application and the MySQL database.

**Steps to Deploy on Kubernetes**:

1. Build and push the Docker image to a container registry (if necessary).
   ```bash
   docker push hossam136/spring-petclinic-image
 
 2. Apply the Kubernetes configurations:

   - **Secrets**:
     ```bash
     kubectl apply -f k8s/secret.yml

   - **ConfigMap**:
     ```bash
     kubectl apply -f k8s/configmap.yml
    
   - **Persistent Volume and Persistent Volume Claim**:
     ```bash
     kubectl apply -f k8s/pv.yml
     kubectl apply -f k8s/pvc.yml

   - **Deployments**:
     ```bash
     kubectl apply -f k8s/deployment-app.yml
     kubectl apply -f k8s/deployment-mysql.yml

3. Verify that the pods are running:

   ```bash
   kubectl get pods

4. Once the pods are running, access the Spring PetClinic application via the Kubernetes service at the assigned external IP or port-forwarding (depending on your setup).
   Example:
   ```bash
   kubectl port-forward svc/spring-petclinic 8080:8080

Access the application at http://localhost:8080.

### CI/CD Integration with Jenkins

The project now includes CI/CD integration using Jenkins. A Jenkins pipeline has been created to automate the build, test, and deployment processes.

**CI/CD Stages**

1. **Git CheckOut**: Clone the repository from Git.
2. **Build Source Code**: Compile the source code using:
   ```bash
   mvn clean compile
3. **Run Unit Tests**: Execute unit tests with:
   ```bash
   mvn test
4. **Build the Package**: Package the application using:
   ```bash
   mvn package
5. **Build & Tag the Docker Image**: Create a Docker image with a specific tag:
   ```bash
   docker build -t hossam136/spring-petclinic-image .
6. **Push the Docker Image to Docker Hub**: Upload the image to Docker Hub:
   ```bash
   docker push hossam136/spring-petclinic-image
7. **Run Docker Compose**: Start the application using Docker Compose:
   ```bash
   docker compose up -d
8. **Send Email Notifications**: Configure Jenkins to send email notifications on build success or failure.
9. **Tear Down the Docker Environment**: Clean up the Docker environment:
   ```bash
   docker-compose -f docker-compose-1.yml down
   rm -rf target
### Ansible Automation
Ansible is used to automate the installation of the necessary software, including Docker, Jenkins, Maven, and Java. Ansible playbooks streamline the setup process, ensuring all dependencies are installed and configured.

**Sample Ansible Playbook**

The playbook installs:
- Docker
- Jenkins
- Maven
- Java

## Configuration Files

- **Dockerfile**: Used to build the Spring PetClinic application into a Docker image.
- **docker-compose.yml**: Defines services for local testing with Docker Compose.
  
### Kubernetes Files:
- **secret.yml**: Defines Kubernetes Secrets for secure storage of sensitive data.
- **configmap.yml**: Configures environment variables for the application.
- **pv.yml** and **pvc.yml**: Define the Persistent Volume and Persistent Volume Claim for MySQL.
- **deployment-app.yml** and **deployment-mysql.yml**: Define Kubernetes Deployments for the Spring PetClinic app and MySQL.

## Conclusion

This setup provides a robust, containerized environment for running the Spring PetClinic application locally using Docker Compose and in production-like environments using Kubernetes. The use of CI/CD with Jenkins and Ansible for automation ensures secure, efficient, and reliable orchestration of the application and database.

