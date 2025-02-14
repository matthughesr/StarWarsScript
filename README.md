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
If I were to deploy this solution in a production enviroment I would use Docker Swarm for a quick easy solution.  Docker swarm is build into docker so it will be easier set up and is ideal for simple solutions like this. It also has built in load balancing to distribute traffic across multiple containers. Docker swarm does support scaling although it does require you to do it manually. Long term Kubernetes is a better option. Although setup will be longer it will yeild good results long term. A key differnece compared to Docker Swarm is Kubernetes comes with auto scaling which will make your life easier but it does not come with auto load balancing.


### Monitoring & Logging:
The good thing about Kubernetes is it comes with built in monitoring and logging. 
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
