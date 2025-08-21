#!/bin/bash

# Forwords Library Café - Google Cloud Deployment Script
# This script deploys your website to Google Cloud Storage

echo "☕ Deploying Forwords Library Café to Google Cloud Storage..."

# Set your Google Cloud project ID here
PROJECT_ID="forwords-cafe-website"
BUCKET_NAME="forwords-cafe-website"
REGION="us-central1"

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ Error: Google Cloud CLI (gcloud) is not installed."
    echo "Please install it from: https://cloud.google.com/sdk/docs/install"
    exit 1
fi

# Check if user is authenticated
if ! gcloud auth list --filter=status:ACTIVE --format="value(account)" | grep -q .; then
    echo "🔐 Please authenticate with Google Cloud first:"
    echo "gcloud auth login"
    exit 1
fi

# Set the project
echo "📋 Setting Google Cloud project to: $PROJECT_ID"
gcloud config set project $PROJECT_ID

# Create bucket if it doesn't exist
echo "🪣 Creating/checking bucket: $BUCKET_NAME"
gsutil mb -p $PROJECT_ID -c STANDARD -l $REGION gs://$BUCKET_NAME 2>/dev/null || echo "Bucket already exists"

# Configure bucket for static website hosting
echo "🌐 Configuring bucket for static website hosting..."
gsutil web set -m index.html -e 404.html gs://$BUCKET_NAME

# Make bucket publicly readable
echo "🔓 Making bucket publicly readable..."
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME

# Upload website files
echo "📤 Uploading website files..."
gsutil -m cp -r *.html gs://$BUCKET_NAME/
gsutil -m cp -r *.css gs://$BUCKET_NAME/

# Set cache headers for better performance
echo "⚡ Setting cache headers for performance..."
gsutil -m setmeta -h "Cache-Control:public, max-age=3600" gs://$BUCKET_NAME/*.css
gsutil -m setmeta -h "Cache-Control:public, max-age=3600" gs://$BUCKET_NAME/*.js
gsutil -m setmeta -h "Cache-Control:public, max-age=86400" gs://$BUCKET_NAME/*.html

echo ""
echo "🎉 Deployment complete!"
echo ""
echo "🌐 Your website is now live at:"
echo "   https://storage.googleapis.com/$BUCKET_NAME/index.html"
echo ""
echo "📱 To set up a custom domain, follow these steps:"
echo "   1. Go to Google Cloud Console > Storage > Browser"
echo "   2. Select your bucket: $BUCKET_NAME"
echo "   3. Go to 'Permissions' tab"
echo "   4. Add your domain verification"
echo ""
echo "💡 For automatic deployments, you can run this script whenever you update your website."
