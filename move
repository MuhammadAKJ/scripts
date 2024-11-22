#!/bin/bash

# Source dirs
SOURCE_DIR="/home/shadow_walker/Desktop/Backup"
# Destination base dir
BASE_DIR="/home/shadow_walker/Desktop/Sorted"

# Destination dirs
PDF_DIR="${BASE_DIR}/Pdfs"
IMAGE_DIR="${BASE_DIR}/Images"
MOVIE_DIR="${BASE_DIR}/Movies"
MUSIC_DIR="${BASE_DIR}/Music"
ZIP_DIR="${BASE_DIR}/Zip"

# Ensure destination dirs exist
mkdir -p "$PDF_DIR" "$IMAGE_DIR" "$MOVIE_DIR" "$MUSIC_DIR" "$ZIP_DIR"

# File extensions
IMAGE_EXTENSIONS="jpg jpeg png"
MOVIE_EXTENSIONS="mp4 mkv avi mov flv wmv"
PDF_EXTENSION="pdf doc epub docx"
MUSIC_EXTENSION="mp3"
ZIP_EXTENSION="zip rar tgz gz"

# Function to move files based on extensions
move_files() {
  local extensions=($1) # convert to array
  local target_dir="$2"
  local count=0

  for ext in "${extensions[@]}"; do
    find "$SOURCE_DIR" -type f -iname "*.$ext" -exec mv {} "$target_dir" \;
    count=($count + 1)
  done
  echo "$count files moved ${target_dir}"
  
}

# Move files to respective folders
echo "Moving PDF files..."
move_files "$PDF_EXTENSION" "$PDF_DIR"

echo "Moving image files..."
move_files "$IMAGE_EXTENSIONS" "$IMAGE_DIR"

echo "Moving movie files..."
move_files "$MOVIE_EXTENSIONS" "$MOVIE_DIR"

echo "Moving music files..."
move_files "$MUSIC_EXTENSION" "$MUSIC_DIR"

echo "Moving zip files..."
move_files "$ZIP_EXTENSION" "$ZIP_DIR"
echo "File organization completed!"


