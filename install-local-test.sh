#!/bin/bash
# Rails Docker Generator Installer - Local Test Version
set -e

INSTALL_DIR="$HOME/.rails-docker-gen"
BIN_DIR="$HOME/.local/bin"
SOURCE_DIR="/Users/mac-mini-03/project/rails-new-with-docker-compose"

echo "🚀 Installing Rails Docker Generator..."

# Create directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$INSTALL_DIR/config"

# Copy files locally
echo "📦 Copying files..."
cp "$SOURCE_DIR/generate_rails_project.sh" "$INSTALL_DIR/generate_rails_project.sh"
cp "$SOURCE_DIR/Dockerfile" "$INSTALL_DIR/Dockerfile"
cp "$SOURCE_DIR/docker-compose.yml" "$INSTALL_DIR/docker-compose.yml"
cp "$SOURCE_DIR/entrypoint.sh" "$INSTALL_DIR/entrypoint.sh"
cp "$SOURCE_DIR/Gemfile" "$INSTALL_DIR/Gemfile"
cp "$SOURCE_DIR/Gemfile.lock" "$INSTALL_DIR/Gemfile.lock"
cp "$SOURCE_DIR/config/database.yml" "$INSTALL_DIR/config/database.yml"

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
