#!/bin/bash

# Define the source and destination directories.
# Replace (Source) and (Dest) with actual directory paths.
SOURCE_DIR="/path/to/source"
DEST_DIR="/path/to/destination"

# Initialize counters for tracking the number of links created and skipped.
link_count=0
skip_count=0

# Array to store names of files that were hard linked.
hard_linked_files=()

# Create the destination directory if it doesn't already exist.
mkdir -p "$DEST_DIR"

# Calculate the total number of files to process in the source directory.
total_files=$(find "$SOURCE_DIR" -type f | wc -l)
processed_files=0

# Notify the user that the process is starting.
echo -e "\n🌟 Starting the Hard Link Process... 🌟\n"

# Iterate over all files in the source directory using `find` with null-terminated strings for safety.
while IFS= read -r -d '' SOURCE_FILE; do
    # Determine the relative path of the file from the source directory.
    REL_PATH="${SOURCE_FILE#$SOURCE_DIR/}"
    
    # Construct the path for the destination file.
    DEST_FILE="$DEST_DIR/$REL_PATH"
    
    # Create the necessary directory structure in the destination directory if it doesn't exist.
    mkdir -p "$(dirname "$DEST_FILE")"
    
    # Check if the destination file exists.
    if [ -e "$DEST_FILE" ]; then
        # If the destination file exists, compare it with the source file.
        if cmp -s "$SOURCE_FILE" "$DEST_FILE"; then
            # If the files are identical, increment the skip count and continue to the next file.
            ((skip_count++))
            ((processed_files++))
            # Display progress on the same line.
            printf "\r🔄 Processed %d of %d files... (Skipped: %d)" "$processed_files" "$total_files" "$skip_count"
            continue
        fi
    fi
    
    # Create a hard link in the destination directory.
    ln "$SOURCE_FILE" "$DEST_FILE"
    
    # Increment the link count.
    ((link_count++))

    # Add the name of the file that was hard linked to the array.
    hard_linked_files+=("$(basename "$SOURCE_FILE")")

    # Increment the count of processed files.
    ((processed_files++))
    
    # Display progress on the same line.
    printf "\r🔄 Processed %d of %d files... (Skipped: %d)" "$processed_files" "$total_files" "$skip_count"
done < <(find "$SOURCE_DIR" -type f -print0)

# Ensure the last line of progress is complete and move to a new line before printing final status
printf "\n"

# Print the final status with a touch of style.
echo -e "\n🎉 Process Completed! 🎉\n"

# Print the total number of hard links created, if any.
if [ "$link_count" -gt 0 ]; then
    echo "📁 Total hard links created: $link_count"
    
    # Add a gap before showing the names of the hard-linked files.
    echo
    echo "📂 Hard linked files:"
    for file in "${hard_linked_files[@]}"; do
        echo "  - $file"
    done
else
    # If no hard links were created, print the appropriate message.
    echo "🚫 No hard links were created."
fi

# Add a gap before showing the skipped files information.
echo

# Print the total number of duplicate files skipped.
if [ "$skip_count" -gt 0 ]; then
    echo "🗂️ Total duplicate files skipped: $skip_count"
fi
