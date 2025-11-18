#Base image (Changed from Ubuntu 22.04 to Ubuntu 20.04 since the later has fortune-mod and cowsay in default repos)
FROM ubuntu:20.04

#No interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

#Add /usr/games to PATH for cowsay and fortune to run without full paths
ENV PATH="/usr/games:${PATH}"

# Install required packages
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd bash && \
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

