# ☕ Forwords Library Café - Website

A beautiful, responsive website for Forwords Library Café - where books meet coffee in the heart of Kochi, Kerala.

## 🌟 Features

- **Responsive Design** - Works perfectly on all devices
- **Modern UI** - Clean, professional layout with warm café aesthetics
- **Fast Loading** - Optimized CSS and efficient code structure
- **SEO Friendly** - Proper meta tags and semantic HTML
- **WhatsApp Integration** - Easy customer communication
- **Contact Form** - Table booking and inquiries

## 🚀 Deployment to Google Cloud

### Prerequisites

1. **Google Cloud Account** - [Sign up here](https://cloud.google.com/)
2. **Google Cloud CLI** - [Install here](https://cloud.google.com/sdk/docs/install)
3. **Google Cloud Project** - Create a new project in Google Cloud Console

### Quick Deployment

1. **Clone/Download** this repository to your local machine

2. **Update the deployment script** with your project details:
   ```bash
   # Edit deploy.sh and change:
   PROJECT_ID="your-actual-project-id"
   BUCKET_NAME="your-preferred-bucket-name"
   ```

3. **Authenticate with Google Cloud**:
   ```bash
   gcloud auth login
   gcloud config set project YOUR_PROJECT_ID
   ```

4. **Run the deployment script**:
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

5. **Your website will be live at**:
   ```
   https://storage.googleapis.com/YOUR_BUCKET_NAME/index.html
   ```

### Manual Deployment Steps

If you prefer to deploy manually:

1. **Create a bucket**:
   ```bash
   gsutil mb -p YOUR_PROJECT_ID -c STANDARD -l us-central1 gs://YOUR_BUCKET_NAME
   ```

2. **Configure for static hosting**:
   ```bash
   gsutil web set -m index.html -e 404.html gs://YOUR_BUCKET_NAME
   ```

3. **Make bucket public**:
   ```bash
   gsutil iam ch allUsers:objectViewer gs://YOUR_BUCKET_NAME
   ```

4. **Upload files**:
   ```bash
   gsutil -m cp -r *.html *.css gs://YOUR_BUCKET_NAME/
   ```

## 🎨 Customization

### Colors
The website uses CSS custom properties for easy color customization:
```css
:root {
  --color-brown-dark: #8B4513;    /* Dark brown */
  --color-brown-medium: #A0522D;  /* Medium brown */
  --color-brown-light: #CD853F;   /* Light brown */
  --color-beige: #F5F5DC;         /* Beige */
  --color-accent: #D4AF37;        /* Gold accent */
}
```

### Content
- **Home page**: Update hero text and features in `index.html`
- **Menu**: Modify menu items and prices in `menu.html`
- **About**: Edit your story in `about.html`
- **Contact**: Update contact details in `contact.html`

## 📱 Pages

- **Home** (`index.html`) - Hero section, features, special offers
- **Menu** (`menu.html`) - Coffee, food, and beverage offerings
- **About** (`about.html`) - Your café's story and philosophy
- **Contact** (`contact.html`) - Contact info and table booking form
- **404** (`404.html`) - Custom error page

## 🔧 Technical Details

- **HTML5** - Semantic markup
- **CSS3** - Modern styling with custom properties
- **Font Awesome** - Icons for enhanced visual appeal
- **Google Fonts** - Playfair Display (serif) and Source Sans Pro (sans-serif)
- **Responsive Grid** - CSS Grid and Flexbox for layouts

## 🌐 Domain Setup

To use a custom domain (e.g., `forwords.cafe`):

1. **Verify domain ownership** in Google Cloud Console
2. **Add custom domain** to your bucket
3. **Configure DNS** records as instructed
4. **Enable HTTPS** (automatic with custom domains)

## 📊 Performance

- **Optimized CSS** - Efficient selectors and minimal redundancy
- **Fast loading** - Optimized file sizes and structure
- **CDN ready** - Google Cloud Storage provides global CDN
- **Mobile optimized** - Responsive design for all screen sizes

## 🆘 Support

For deployment issues:
1. Check Google Cloud Console for error messages
2. Verify your project ID and bucket name
3. Ensure you have proper permissions
4. Check that gcloud CLI is properly installed

## 📄 License

This website is created for Forwords Library Café. All rights reserved.

---

**Forwords Library Café** - Where friendships begin and time slows down ☕📚
