# DevOps Internship Assessment
Matthew Hughes

## Summary
The script.sh file is a bash script that will find all the ships and the coresponding pilots from the star wars API https://swapi.dev/

-The bash script uses the curl command to get the data from the API. Then it uses jq which is a tool that can easily get specifc data from a json response. I then loop though each starship and get the name of the pilots for that ship. Getting the name of the ship is pretty straight forward using jq. To get the name of the pilots for each ship I loop through the pilots array and do another curl and jq comand to get their names. To make using the script easier I took advantage of github actions to create the docker image and push it to GitHub Container Registry for easy access. 

## Instructions to run the container
1. Open terminal and ensure docker is installed
  -run "docker"
2. Run docker container
  -run "docker run ghcr.io/matthughesr/star-wars-ghcr:latest"

3. Sit back and watch the script run


## Production Deployment Considerations

### Container Orchestration & Scaling:
Deployment using orchestration tools (e.g., Kubernetes, Docker Swarm).
Strategies for scaling the application (e.g., auto-scaling based on load).

### Monitoring & Logging:

Tools and techniques to monitor the application’s health and performance.
Strategies for centralized logging (e.g., ELK Stack, Fluentd).

### CI/CD Pipeline:

How you would integrate your Docker build process into a CI/CD pipeline.
Steps for automated testing, security scanning, and deployment.

### Security & Reliability:

Security considerations (e.g., vulnerability scanning, minimal base images, secrets management).
Ensuring reliability and availability (e.g., health checks, redundancy, fault tolerance).

### Configuration Management:

Handling configuration settings for different environments (development, staging, production) using environment variables or configuration files.
