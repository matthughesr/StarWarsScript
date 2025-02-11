
# Use a base image with bash and curl, and jq  installed 
FROM ubuntu:latest

# Install necessary packages: curl, jq, and bash
RUN apt-get update && \
    apt-get install -y curl jq bash && \
    apt-get clean

# Copy the script to the container
COPY script.sh /usr/local/bin/script.sh

# Make the script executable
RUN chmod +x /usr/local/bin/script.sh

# Set the default command to run the script
CMD ["/usr/local/bin/script.sh"]
