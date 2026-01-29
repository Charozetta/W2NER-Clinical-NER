#!/bin/bash

# Download pre-trained W2NER Clinical NER model
# Usage: bash download_model.sh

set -e

echo "🏥 W2NER Clinical NER - Model Download"
echo "========================================"
echo ""

MODEL_DIR="models"
mkdir -p "$MODEL_DIR"

# Model URL (update with your actual release URL)
MODEL_URL="https://github.com/YOUR_USERNAME/W2NER-Clinical-NER/releases/download/v1.0/guidelines_ru_model.pt"
CONFIG_URL="https://github.com/YOUR_USERNAME/W2NER-Clinical-NER/releases/download/v1.0/guidelines_ru.json"

MODEL_FILE="$MODEL_DIR/guidelines_ru_model.pt"
CONFIG_FILE="$MODEL_DIR/guidelines_ru.json"

# Check if model already exists
if [ -f "$MODEL_FILE" ]; then
    echo "⚠️  Model file already exists: $MODEL_FILE"
    read -p "Do you want to re-download? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Download cancelled."
        exit 0
    fi
fi

# Download model
echo "📥 Downloading model (~707 MB)..."
if command -v wget &> /dev/null; then
    wget -O "$MODEL_FILE" "$MODEL_URL" --progress=bar:force
elif command -v curl &> /dev/null; then
    curl -L -o "$MODEL_FILE" "$MODEL_URL" --progress-bar
else
    echo "❌ Error: Neither wget nor curl is available."
    echo "Please install wget or curl to download the model."
    exit 1
fi

# Download config
echo "📥 Downloading config..."
if command -v wget &> /dev/null; then
    wget -O "$CONFIG_FILE" "$CONFIG_URL" -q
elif command -v curl &> /dev/null; then
    curl -L -o "$CONFIG_FILE" "$CONFIG_URL" -s
fi

echo ""
echo "✅ Download complete!"
echo ""
echo "Model saved to: $MODEL_FILE"
echo "Config saved to: $CONFIG_FILE"
echo ""
echo "File sizes:"
ls -lh "$MODEL_FILE" "$CONFIG_FILE"
echo ""
echo "🚀 You can now use the model with:"
echo "   python inference.py --model $MODEL_FILE"
