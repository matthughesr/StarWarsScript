# DevOps Internship Assessment
Matthew Hughes

## Summary
This solution will find all the ships and the corresponding pilots from the star wars API https://swapi.dev/. The solution is packaged into a Docker image and pushed to GitHub Container Registry using GitHub actions

-To achieve this result a bash script is used.The bash script uses the curl command to get the data from the API. Then it uses jq which is a tool that can easily get specific data from a json response. It then loops through each starship and gets the name of the pilots for that ship. Getting the name of the ship is pretty straight forward using jq. To get the name of the pilots for each ship it loops through the pilots array and does another curl and jq command to get their names. Once it reaches the end of the page it moves onto the next page until done. To make using the script easier I took advantage of github actions to create the docker image and push it to GitHub Container Registry for easy access. 

## Instructions to run the container
1. Open terminal and ensure docker is installed
  -run "docker"
2. Run docker container
  -run "docker run ghcr.io/matthughesr/star-wars-ghcr:latest"

3. Sit back and watch the script run



## Production Deployment Considerations

### Container Orchestration & Scaling:
If I were to deploy this solution in a production environment I would use Kubernetes. Although the setup will be more difficult than Docker Swarm it will be a great solution long term. Kubernetes comes with auto scaling which adjusts the number of running pods based on the current traffic which will make your life easier. Kubernetes provides services that can manage traffic distribution across pods.

### Monitoring & Logging:
The good thing about Kubernetes is it comes with built-in monitoring and logging. These tools can help monitor resource usage and performance of the application, they also ensure the health of the application through self healing. For centralized logging the ELK Stack is a good option. It will collect and analyze logs from the script's execution in one centralized location making troubleshooting easier. 

### CI/CD Pipeline /Configuration Management:
GitHub offers some great tools to integrate the Docker build processes. Using GitHub actions makes life much easier when developing applications and helps keep things up to date. This specific solution takes advantage of GitHub actions and GitHub Container Registry to automatically build the Docker Image and push it to GitHub Container Registry when changes are made to the repository. This ensures the docker image is always up to date with minimal effort. GitHub Container Registry is very helpful in publishing my Docker Image so that I can share with it with others easily

### Security & Reliability:
In this solution I took advantage of GitHub secrets to store my personal access token in a safe manner so I can login into GitHub. Kubernetes offers enterprise-grade security through various security controls which are essential to production. This solution would take advantage of their network security and health checks to make sure everything is running securely and as it should. 





