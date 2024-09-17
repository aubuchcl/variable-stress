# Use an official lightweight Debian image
FROM debian:bullseye-slim

# Install stress-ng and other dependencies
RUN apt-get update && \
    apt-get install -y stress-ng bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the stress test script into the container
COPY stress_test.sh .

# Make the script executable
RUN chmod +x stress_test.sh

# Set the default command to run the stress test script
CMD ["./stress_test.sh"]

