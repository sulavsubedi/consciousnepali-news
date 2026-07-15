# Conscious Nepali — News Portal

> Independent news from Nepal | Powered by Ghost CMS + Headline Theme

[![Ghost](https://img.shields.io/badge/Ghost-CMS-738A94?logo=ghost)](https://ghost.org)
[![Theme](https://img.shields.io/badge/Theme-Headline-black)](https://github.com/TryGhost/Headline)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)](docker-compose.yml)

## Overview

This repository contains the full Ghost CMS setup for **consciousnepali.com** — an independent Nepali news publication. It uses the official [TryGhost/Headline](https://github.com/TryGhost/Headline) theme, which is purpose-built for local and independent news portals.

### Key Features
- Ghost CMS with Headline news theme
- Full Docker Compose setup (Ghost + MySQL)
- Membership & newsletter support built-in
- Revenue-ready: subscriptions, paid tiers, AdSense injection
- News categories: Politics, Society, Opinion, Explainers, Diaspora
- SEO optimized, mobile responsive, fast-loading
- Ghost Admin panel at `/ghost`

---

## Quick Start (Docker)

### Prerequisites
- Docker & Docker Compose installed
- Domain: consciousnepali.com pointed to your server

### 1. Clone this repo

```bash
git clone https://github.com/sulavsubedi/consciousnepali-news.git
cd consciousnepali-news
```

### 2. Copy and configure environment

```bash
cp .env.example .env
# Edit .env with your values
nano .env
```

### 3. Start Ghost CMS

```bash
docker-compose up -d
```

Ghost will be available at:
- **Site:** http://localhost:2368
- **Admin Panel:** http://localhost:2368/ghost

### 4. Set up admin account

Open your browser and navigate to:
```
http://localhost:2368/ghost
```
Complete the setup wizard:
1. Enter site title: `Conscious Nepali`
2. Enter your name: `Sulav Subedi`
3. Enter admin email: *(your email)*
4. Set a strong password
5. Click **Last step** and you're in the admin panel

---

## Install Headline Theme

```bash
# Build theme zip from source
git clone https://github.com/TryGhost/Headline.git headline-theme
cd headline-theme
npm install -g pnpm
pnpm install
pnpm zip
# Output: dist/headline.zip
```

Then in Ghost Admin:
1. Go to **Settings > Design > Change theme**
2. Click **Upload theme**
3. Upload `headline-theme/dist/headline.zip`
4. Click **Activate**

---

## Ghost Admin Panel

Access the admin panel at `/ghost` on your domain:

| URL | Purpose |
|-----|---------|
| `consciousnepali.com/ghost` | Admin login |
| `consciousnepali.com/ghost/#/posts` | Manage posts |
| `consciousnepali.com/ghost/#/settings` | Site settings |
| `consciousnepali.com/ghost/#/members` | Manage members |
| `consciousnepali.com/ghost/#/newsletters` | Newsletters |

---

## Site Structure

```
consciousnepali-news/
├── docker-compose.yml        # Ghost + MySQL setup
├── ghost-config.production.json  # Production config
├── routes.yaml               # Ghost routing config
├── .env.example              # Environment variables template
├── setup.sh                  # One-command setup script
├── .gitignore
├── LICENSE
└── README.md
```

---

## News Categories

Configure these tags in Ghost Admin > Tags:

| Tag | Description |
|-----|-------------|
| `#news` | Breaking & general news |
| `#politics` | Political coverage |
| `#society` | Social issues & community |
| `#opinion` | Op-eds and analysis |
| `#explainers` | In-depth explainers |
| `#diaspora` | Nepali diaspora stories |
| `#economy` | Business & economy |

---

## Revenue Setup

### 1. Memberships & Subscriptions
In Ghost Admin > Settings > Membership:
- Enable free + paid tiers
- Connect Stripe for payments
- Set monthly/yearly pricing

### 2. Google AdSense
In Ghost Admin > Settings > Code Injection:
```html
<!-- Header -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
```

### 3. Newsletters
In Ghost Admin > Settings > Newsletters:
- Create a weekly digest newsletter
- Set up automated sending schedule

---

## Production Deployment

```bash
# Run the setup script on your VPS
bash setup.sh
```

Or manually:
```bash
# Install Ghost CLI
npm install ghost-cli@latest -g

# Install Ghost on your server
mkdir -p /var/www/consciousnepali
cd /var/www/consciousnepali
ghost install --url https://consciousnepali.com
```

---

## Admin Account Details

| Field | Value |
|-------|-------|
| **Site URL** | https://consciousnepali.com |
| **Admin URL** | https://consciousnepali.com/ghost |
| **Admin Name** | Sulav Subedi |
| **Role** | Owner/Administrator |
| **Theme** | Headline (TryGhost) |
| **CMS** | Ghost v5+ |

> Set your email and password during the Ghost setup wizard at `/ghost`

---

## Contributing

1. Fork this repo
2. Create a feature branch: `git checkout -b feature/my-change`
3. Commit changes: `git commit -m 'Add my change'`
4. Push: `git push origin feature/my-change`
5. Open a Pull Request

---

## License

MIT License — see [LICENSE](LICENSE) for details.

Theme by [TryGhost/Headline](https://github.com/TryGhost/Headline) — MIT License.

---

**Built with love for Nepal by [Sulav Subedi](https://github.com/sulavsubedi)**
