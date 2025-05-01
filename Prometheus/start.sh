#!/bin/bash

DIR_PATH="prometheus-data"

# Check if the directory exists
if [ -d "$DIR_PATH" ]; then
    echo "Directory '$DIR_PATH' already exists."
else
    echo "Directory '$DIR_PATH' does not exist. Creating it now..."
    
    # Attempt to create the directory
    mkdir -p "$DIR_PATH"
    
    # Check if the creation was successful
    if [ $? -eq 0 ]; then
        echo "Directory '$DIR_PATH' created successfully."
    else
        echo "Error: Failed to create directory '$DIR_PATH'."
        exit 1
    fi
fi

docker run -it -d -p 9090:9090 -u root -v "$PWD/prometheus.yml:/etc/prometheus/prometheus.yml" -v "$PWD/prometheus-data:/prometheus" --name=prom_cont prom/prometheus