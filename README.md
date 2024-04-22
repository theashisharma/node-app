Deploying a Kubernetes Cluster using GitHub Actions

This repository provides a GitHub Actions workflow to deploy a Kubernetes cluster and manage applications on it. The workflow uses Minikube for local Kubernetes cluster setup and kubectl for interacting with the cluster.

Prerequisites
GitHub repository with your Kubernetes configuration files (e.g., deployments, services)
docker installed on your local machine
Minikube installed on your local machine
kubectl installed on your local machine


Setting up GitHub Actions Workflow
* Create a new directory in your repository for storing GitHub Actions workflow files.
* Image is built using Dockerfile and pushed to public dockerhub repository.
* Create a new file named deploy.yml in the .github/workflows directory which inclues configuration of Kubernetes clusters, services, deployment and docker images used.
* Replace path/to/your/kubernetes/config/files with the path to your Kubernetes configuration files in node-app.yaml.
* Commit and push the changes to your repository to trigger the GitHub Actions workflow.**