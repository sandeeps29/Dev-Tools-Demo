#!/bin/bash

# Enable error handling and logging
set -e
exec 2>&1

echo "=== Starting BeforeInstall script $(date) ==="

# Install Apache
echo "Installing Apache..."
if ! sudo yum install -y httpd; then
    echo "Failed to install Apache"
    exit 1
fi
echo "Apache installed successfully"

# Start Apache
echo "Starting Apache..."
if ! sudo systemctl start httpd; then
    echo "Failed to start Apache"
    exit 1
fi
echo "Apache started successfully"

# Enable Apache
echo "Enabling Apache..."
if ! sudo systemctl enable httpd; then
    echo "Failed to enable Apache"
    exit 1
fi
echo "Apache enabled successfully"

# Check Apache status
echo "Checking Apache status..."
sudo systemctl status httpd
echo "Apache status checked"

# Clean destination directory
echo "Cleaning /var/www/html/..."
if ! sudo rm -rf /var/www/html/*; then
    echo "Failed to clean /var/www/html/"
    exit 1
fi
echo "Directory cleaned successfully"

# Create directory if it doesn't exist
echo "Ensuring /var/www/html exists..."
sudo mkdir -p /var/www/html

# Set proper permissions
echo "Setting directory permissions..."
sudo chmod -R 755 /var/www/html
sudo chown -R apache:apache /var/www/html

echo "=== BeforeInstall script completed successfully $(date) ==="
