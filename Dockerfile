
# Use 22.04 because it is well maintained and good with docker
FROM ubuntu:22.04   

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
