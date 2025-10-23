# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script into the image
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make sure the entrypoint script is executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the default command
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"] 
action.ymlname: "Print GitHub Actor and Repo Details"
description: "A custom action that shows details about the repo where the action is running."
runs:
  using: "docker"
  image: "Docker
