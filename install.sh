#!/usr/bin/env bash
set -e

REPO="frotaur/mdview"
VERSION="1.0.0"
INSTALL_DIR="${HOME}/.local/bin"

# Platform detection
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case "$ARCH" in
  x86_64)        ARCH="x86_64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *)
    echo "Error: unsupported architecture: $ARCH"
    exit 1
    ;;
esac

echo "=> Installing mdview ${VERSION} (${OS}/${ARCH})..."
mkdir -p "$INSTALL_DIR"

TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

curl -sSL "https://github.com/${REPO}/releases/download/v${VERSION}/mdview_${VERSION}_${OS}_${ARCH}.tar.gz" \
  -o "$TMP/mdview.tar.gz"

tar -xzf "$TMP/mdview.tar.gz" -C "$TMP"
mv "$TMP/mdview" "$INSTALL_DIR/mdview"
chmod +x "$INSTALL_DIR/mdview"

echo "=> mdview installed to $INSTALL_DIR/mdview"

# Check if INSTALL_DIR is in PATH
if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo "=> Add $INSTALL_DIR to your PATH:"
  echo "   export PATH=\"$INSTALL_DIR:\$PATH\""
fi

echo "=> Run 'mdview <file.md>' to render a markdown file in your terminal"
