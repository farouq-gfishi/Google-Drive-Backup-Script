# Google Drive Backup Script

This Bash script automates the process of uploading files and folders to Google Drive using the `gdrive` command-line tool.

## Features

- **File Upload:** Uploads individual files to a specified Google Drive folder.
- **Folder Upload:** Creates a new folder on Google Drive and uploads its contents recursively.
- **Duplicate Handling:** Updates existing files if they have the same name.

## Prerequisites

Before using this script, ensure you have the following:

- **gdrive CLI:** Install and configure the `gdrive` command-line tool. Instructions can be found [here](https://github.com/prasmussen/gdrive).
- **Google Drive API:** Enable the Google Drive API and obtain OAuth credentials for `gdrive`.

## Installation

1. Clone this repository or download the script directly.

   ```bash
   git clone <repository_url>
   ```
2. Make the script executable.

   ```bash
   chmod +x backup_script.sh
   ```
3. Ensure gdrive is correctly configured with OAuth credentials.

## Usage

To use the script, run it with the following command:

  ```bash
  ./backup_script.sh <parent_folder_id> <folder_path>
  ```
- **parent_folder_id:** The Google Drive folder ID where files and folders will be uploaded.
- **folder_path:** The local folder path containing files and folders to upload.

## Examples

  ```bash
  ./backup_script.sh abcdef1234567890 /path/to/local/folder
  ```
This command will recursively upload all files and folders from **/path/to/local/folder** to the Google Drive folder with ID **abcdef1234567890**.



