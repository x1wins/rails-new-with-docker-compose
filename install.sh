#!/bin/bash
# Rails Docker Generator Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/x1wins/rails-new-with-docker-compose/main/install.sh | bash

set -e

INSTALL_DIR="$HOME/.rails-docker-gen"
BIN_DIR="$HOME/.local/bin"
REPO_URL="https://raw.githubusercontent.com/x1wins/rails-new-with-docker-compose/main"

echo "🚀 Installing Rails Docker Generator..."

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed"
    echo ""
    echo "Please install Docker first:"
    echo "  macOS: https://docs.docker.com/desktop/install/mac-install/"
    echo "  Linux: https://docs.docker.com/engine/install/"
    echo "  Windows: https://docs.docker.com/desktop/install/windows-install/"
    exit 1
fi

# Check for Docker Compose
if ! docker compose version &> /dev/null && ! command -v docker-compose &> /dev/null; then
    echo "❌ Error: Docker Compose is not installed"
    echo ""
    echo "Docker Compose is usually included with Docker Desktop."
    echo "If using Docker Engine, install it separately:"
    echo "  https://docs.docker.com/compose/install/"
    exit 1
fi

# Check if Docker daemon is running
if ! docker info &> /dev/null; then
    echo "⚠️  Warning: Docker daemon is not running"
    echo "Please start Docker and try again"
    exit 1
fi

echo "✅ Docker and Docker Compose found"

# Create directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$INSTALL_DIR/config"

# Download files
echo "📦 Downloading files..."
curl -fsSL "$REPO_URL/generate_rails_project.sh" -o "$INSTALL_DIR/generate_rails_project.sh"
curl -fsSL "$REPO_URL/Dockerfile" -o "$INSTALL_DIR/Dockerfile"
curl -fsSL "$REPO_URL/docker-compose.yml" -o "$INSTALL_DIR/docker-compose.yml"
curl -fsSL "$REPO_URL/entrypoint.sh" -o "$INSTALL_DIR/entrypoint.sh"
curl -fsSL "$REPO_URL/Gemfile" -o "$INSTALL_DIR/Gemfile"
curl -fsSL "$REPO_URL/Gemfile.lock" -o "$INSTALL_DIR/Gemfile.lock"
curl -fsSL "$REPO_URL/config/database.yml" -o "$INSTALL_DIR/config/database.yml"

chmod +x "$INSTALL_DIR/generate_rails_project.sh"

# Create wrapper script
cat > "$BIN_DIR/rails-docker-gen" << 'EOF'
#!/bin/bash
CURRENT_DIR="$(pwd)"
cd "$HOME/.rails-docker-gen"
./generate_rails_project.sh "$1" "$CURRENT_DIR"
EOF

chmod +x "$BIN_DIR/rails-docker-gen"

echo "✅ Installation complete!"
echo ""
echo "Add to your PATH if not already:"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
echo "Usage:"
echo "  rails-docker-gen my-project"
