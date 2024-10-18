# Spring PetClinic with Docker, Docker Compose, and Kubernetes

This project demonstrates the deployment of the Spring PetClinic application using Docker, Docker Compose for local testing, and Kubernetes for orchestration. The setup includes persistent storage, environment configuration using ConfigMaps and Secrets, and two deployments: one for the PetClinic application and one for MySQL.

## Prerequisites

- Docker
- Docker Compose
- Kubernetes cluster (e.g., Minikube)
- kubectl CLI tool

## Getting Started

### Docker

A custom Docker image has been created for the Spring PetClinic application, allowing for easy containerization. The image is named `hossam136/spring-petclinic-image`, based on the official repository: [spring-petclinic](https://github.com/spring-projects/spring-petclinic.git).

### Docker Compose

For local testing, a `docker-compose.yml` is provided, which sets up the Spring PetClinic application along with a MySQL database.

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
    '''bash
    kubectl apply -f k8s/secret.yml

    - **ConfigMap**:
    '''bash
    kubectl apply -f k8s/configmap.yml
    
    - **Persistent Volume and Persistent Volume Claim**:
    '''bash
    kubectl apply -f k8s/pv.yml
    kubectl apply -f k8s/pvc.yml

    - **Deployments**:
    '''bash
    kubectl apply -f k8s/deployment-app.yml
    kubectl apply -f k8s/deployment-mysql.yml

3. Verify that the pods are running:
   '''bash
   kubectl get pods

5. Once the pods are running, access the Spring PetClinic application via the Kubernetes service at the assigned external IP or port-forwarding (depending on your setup).
   Example:
   '''bash
   kubectl port-forward svc/spring-petclinic 8080:8080

Access the application at http://localhost:8080.
