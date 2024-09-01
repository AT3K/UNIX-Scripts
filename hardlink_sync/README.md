# Hardlink Sync

## Description

`Hardlink Sync` is a script designed to create hard links between files in a source directory and a destination directory. It synchronizes files by creating hard links where files are identical and skips files that are already present and identical in the destination directory.

## Features

- Creates hard links from a source directory to a destination directory.
- Skips files that are already present and identical in the destination directory.
- Reports the number of links created and files skipped.

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/AT3K/UNIX-Scripts.git
    ```

2. Navigate to the repository directory:
    ```sh
    cd UNIX-Scripts/hardlink_sync
    ```

3. Make the script executable:
    ```sh
    chmod +x hardlink_sync.sh
    ```

4. Run the script:
    ```sh
    ./hardlink_sync.sh
    ```

## Configuration

Update the `SOURCE_DIR` and `DEST_DIR` variables in the `hardlink_sync.sh` script to point to your source and destination directories.

