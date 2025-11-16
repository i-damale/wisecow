	# Base image (Ubuntu 20.04 has fortune-mod and cowsay in default repos)
FROM ubuntu:20.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Add /usr/games to PATH so cowsay and fortune run without full paths
ENV PATH="/usr/games:${PATH}"

# Install required packages
# cowsay       → ASCII cow output
# fortune-mod  → random quotes
# netcat       → used by wisecow to serve requests
# bash         → ensures script runs properly
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat bash && \
    apt-get clean

# App directory inside the container
WORKDIR /app

# Copy the application script into the container
COPY wisecow.sh .

# Remove any Windows-style line endings (if present) and allow execution
RUN sed -i 's/\r$//' wisecow.sh && \
    chmod +x wisecow.sh

# Wisecow listens on port 4499
EXPOSE 4499

# Start the application
CMD ["./wisecow.sh"]

