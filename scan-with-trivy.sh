#!/bin/bash

if [ -z "$1" ]; then
  echo "❌ No Docker image name provided."
  echo "Usage: ./scan-with-trivy.sh <docker-image-name>"
  exit 1
fi

DOCKER_IMAGE="$1"
REPORT_FILE="${DOCKER_IMAGE}-trivy-scan-report.txt"

if ! command -v trivy &> /dev/null; then
  echo "❌ Trivy is not installed. Please install Trivy before running this script."
  echo "Follow this guide to install it: https://aquasecurity.github.io/trivy/"
  exit 1
fi

echo "🔍 Scanning '${DOCKER_IMAGE}'..."
echo "📄 Scan results for '${DOCKER_IMAGE}':" > "$REPORT_FILE"
trivy image "$DOCKER_IMAGE" >> "$REPORT_FILE"
echo "✅ Scan for '${DOCKER_IMAGE}' completed."

echo "✅ Scan completed."
echo "📄 Report generated at: $REPORT_FILE"
