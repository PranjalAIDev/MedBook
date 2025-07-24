#!/bin/bash

# Build script for MedBook deployment

echo "Starting MedBook build process..."

# Navigate to frontend directory and build
echo "Building frontend..."
cd frontend

# Clean install dependencies
echo "Installing frontend dependencies..."
npm ci --legacy-peer-deps || npm install --legacy-peer-deps

# Build the frontend
echo "Building frontend application..."
npm run build

# Check if build was successful
if [ -f "dist/index.html" ]; then
    echo "Frontend build successful!"
else
    echo "Frontend build failed - dist/index.html not found"
    exit 1
fi

# Navigate to rag-backend and install dependencies
echo "Installing backend dependencies..."
cd ../rag-backend
npm ci || npm install

echo "Build process completed successfully!"
