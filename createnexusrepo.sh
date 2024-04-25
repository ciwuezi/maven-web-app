#!/bin/bash

set -e

NEXUS_URL="http://localhost:8081"
NEXUS_USERNAME="admin"
NEXUS_PASSWORD="admin123"
REPO_JSON_FILE="snapshot-repo.json"

create_repository() {
    local repo_json_file=$1

    curl -X POST -u "$NEXUS_USERNAME:$NEXUS_PASSWORD" -H "Content-Type: application/json" \
    -d @"$repo_json_file" "$NEXUS_URL/service/rest/beta/repositories"
}

create_repository "$REPO_JSON_FILE"

echo "Snapshot repository created successfully."
