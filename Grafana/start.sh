#!/bin/bash

DIR_PATH="grafana-data"

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

docker run -it -d -p 3000:3000 -u root -v "$PWD/grafana-data:/var/lib/grafana" --env-file "$PWD/env.list" --name=grafana_cont grafana/grafana-oss