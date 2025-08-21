# 🚀 Quick Start - Deploy to Google Cloud in 5 Minutes!

## ⚡ Super Quick Setup

### 1. **Get Your Google Cloud Project ID**
- Go to [Google Cloud Console](https://console.cloud.google.com/)
- Create a new project or select existing one
- Copy the Project ID (looks like: `my-cafe-project-123`)

### 2. **Update Configuration**
Edit `config.env` and change:
```bash
PROJECT_ID=your-actual-project-id-here
BUCKET_NAME=forwords-cafe-website
```

### 3. **Install Google Cloud CLI**
```bash
# macOS (using Homebrew)
brew install google-cloud-sdk

# Or download from: https://cloud.google.com/sdk/docs/install
```

### 4. **Login & Deploy**
```bash
# Login to Google Cloud
gcloud auth login

# Set your project
gcloud config set project YOUR_PROJECT_ID

# Deploy your website!
./deploy.sh
```

### 5. **Your website is live!** 🌐
Visit: `https://storage.googleapis.com/forwords-cafe-website/index.html`

---

## 🔧 If Something Goes Wrong

### Check these common issues:
- ✅ Google Cloud CLI installed? (`gcloud --version`)
- ✅ Logged in? (`gcloud auth list`)
- ✅ Project set? (`gcloud config get-value project`)
- ✅ Project ID correct in `config.env`?

### Need help?
- Check the full `README.md` for detailed instructions
- Look at Google Cloud Console for error messages
- Ensure you have billing enabled on your Google Cloud project

---

## 💰 Cost Estimate
- **Storage**: ~$0.02/month for website files
- **Bandwidth**: ~$0.12/GB (first 1GB free)
- **Total**: Usually under $1/month for a café website!

---

**Ready to go live? Run `./deploy.sh` and your café website will be on the internet!** ☕📚
