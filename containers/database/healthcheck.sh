#!/bin/bash

# Check if PostgreSQL is accepting connections
pg_isready -h localhost -p 5432

# If pg_isready returns a non-zero exit code, the container is not healthy
if [ $? -ne 0 ]; then
    echo "PostgreSQL is not ready"
    exit 1
fi

echo "PostgreSQL is ready"
exit 0
