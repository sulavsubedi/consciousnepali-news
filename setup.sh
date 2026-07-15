#!/bin/bash
# ============================================
# Conscious Nepali — One-Command Setup Script
# Usage: bash setup.sh
# ============================================

set -e

echo "======================================"
echo "  Conscious Nepali — Setup Starting"
echo "======================================"

# Check Docker is installed
if ! command -v docker &> /dev/null; then
  echo "[ERROR] Docker not found. Please install Docker first."
  exit 1
fi

if ! command -v docker compose &> /dev/null; then
  echo "[ERROR] Docker Compose not found. Please install Docker Compose."
  exit 1
fi

# Copy .env if it doesn't exist
if [ ! -f .env ]; then
  echo "[INFO] Creating .env from .env.example..."
  cp .env.example .env
  echo "[WARN] Please edit .env with your real values before continuing."
  echo "       Then run: bash setup.sh again"
  exit 0
fi

# Pull latest images
echo "[INFO] Pulling Docker images..."
docker compose pull

# Start services
echo "[INFO] Starting Ghost CMS + MySQL + Nginx..."
docker compose up -d

# Wait for Ghost to be ready
echo "[INFO] Waiting for Ghost to start (30 seconds)..."
sleep 30

# Clone and build Headline theme
echo "[INFO] Installing Headline news theme..."
if [ ! -d headline-theme ]; then
  git clone https://github.com/TryGhost/Headline.git headline-theme
fi
cd headline-theme
npm install -g pnpm 2>/dev/null || true
pnpm install
pnpm zip
cd ..

echo ""
echo "======================================"
echo "  Setup Complete!"
echo "======================================"
echo ""
echo "  Ghost CMS is running at:"
echo "  Site:   http://localhost:2368"
echo "  Admin:  http://localhost:2368/ghost"
echo ""
echo "  Next steps:"
echo "  1. Open http://localhost:2368/ghost"
echo "  2. Complete the Ghost setup wizard"
echo "  3. Upload theme: headline-theme/dist/headline.zip"
echo "  4. Configure your domain in Settings > General"
echo "  5. Enable membership in Settings > Membership"
echo ""
echo "  Admin credentials (set in wizard):"
echo "  Name:  Sulav Subedi"
echo "  Email: (set your email in setup wizard)"
echo ""
