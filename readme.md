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
