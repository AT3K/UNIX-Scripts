# Hardlink Sync 🛠️

`Hardlink Sync` is a Bash script designed to create hard links between files in a source directory and a destination directory. The script ensures that files are synchronized by creating hard links where files are identical and skipping files that are already present and identical in the destination directory.

## Table of Contents
- [Features ✨](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#features-)
- [Requirements 📦](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#requirements-)
- [Permissions 🔐](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#permissions-)
- [Usage 🚀](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#usage-)
- [Configuration ⚙️](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#configuration-)
- [Script Output 📄](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#script-output-)
- [Difference Between Hard Links and Symbolic Links (`ln -s`) 🔗](https://github.com/AT3K/UNIX-Scripts/tree/main/hardlink_sync#difference-between-hard-links-and-symbolic-links-ln--s-)

## Features ✨

- **Hard Linking** 🔗: Creates hard links from a source directory to a destination directory.
- **Duplicate Detection** 🔍: Skips files that are already present and identical in the destination directory.
- **Progress Reporting** 📊: Provides detailed progress and status updates during execution.

## Requirements 📦

The script requires the following tools:

- **Bash**: Typically pre-installed on Unix-like systems.
- **find**: To locate files and directories.
- **ln**: For creating hard links.
- **cmp**: To compare files.

These tools are usually pre-installed on most Unix-like systems. If not, you can install them as follows:

- **Ubuntu/Debian**:
```
sudo apt install bash findutils coreutils
```
- **CentOS/RHEL**:
```
sudo yum install bash findutils coreutils
```
- **macOS**: 
  - Pre-installed

## Permissions 🔐

Ensure you have the necessary permissions to:

- **Read** 👁️: Access files in the source directory.
- **Write** 📝: Create files and directories in the destination directory.

Make sure you have sufficient permissions to read from the source directory and write to the destination directory for the script to function correctly.

## Usage 🚀

1. **Make the Script Executable**

   ```sh
   chmod +x hardlink_sync.sh
   ```

3. **Edit the Configuration**

   Open the `hardlink_sync.sh` script and update the `SOURCE_DIR` and `DEST_DIR` variables to specify your source and destination directories.

4. **Run the Script**

   ```sh
   ./hardlink_sync.sh
   ```

## Configuration ⚙️

- **SOURCE_DIR**: Set this variable to the path of the source directory containing the files you want to link.
- **DEST_DIR**: Set this variable to the path of the destination directory where the hard links will be created.

Example:
```bash
SOURCE_DIR="/path/to/source"
DEST_DIR="/path/to/destination"
```

## Script Output 📄

### When Hard Links Are Created:
```
🌟 Starting the Hard Link Process... 🌟

🔄 Processed 10 of 10 files (Skipped: 9)

🎉 Process Completed! 🎉

📁 Total hard links created: 1

📂 Hard linked files:
  - test.txt

🗂️ Total duplicate files skipped 9
```
### When No Hard Links Are Created:
```
🌟 Starting the Hard Link Process... 🌟

🔄 Processed 10 of 10 files (Skipped: 10)

🎉 Process Completed! 🎉

🚫 No hard links were created.

🗂️ Total duplicate files skipped: 10
```

## Difference Between Hard Links and Symbolic Links (`ln -s`) 🔗

- **Hard Links**:
  - Directly reference the same data as the original file.
  - Both the original and hard link share the same inode and data.
  - Only work within the same file system and cannot link directories.
  - Data remains until all hard links are deleted.
  - **Why use a hard link?**  
    Hard links are useful when you want to create multiple references to the same data while ensuring the file remains accessible as long as at least one hard link exists. This is helpful when maintaining file consistency and saving space, as no new data is duplicated.

- **Symbolic (Soft) Links** (`ln -s`):
  - Point to the file's *path*, not the actual data.
  - Can link across different file systems and can link directories.
  - If the original file is deleted or moved, the symlink becomes broken.
  - **Why use a symbolic link?**  
    Symlinks are useful when you want a flexible link to a file or directory, even across different file systems. They act like shortcuts and are more versatile in pointing to files or directories that may change locations.
