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
   git clone https://github.com/farouq-gfishi/Google-Drive-Backup-Script.git
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

## Cron Job

This script can be scheduled to run automatically using cron jobs. The cron job allows you to specify when and how often the script should execute, making it convenient for regular backups.

### Logging

The cron job output can be logged to a file to track its execution and any potential errors. This helps in monitoring the script's activity over time.

### Example

To schedule this script to run every Thursday at 4 PM and log the job output:

1. Open your crontab for editing:

   ```bash
   crontab -e
   ```
2. Add the following line to schedule the job:

   ```bash
   0 16 * * 4 /path/to/backup_script.sh <parent_folder_id> <local_folder_path> >> /path/to/logs/$(date +\%y\%m\%d).log 2>&1
   ```

Replace `/path/to/backup_script.sh`, `<parent_folder_id>`, `<local_folder_path>`, and `/path/to/logs/` with your actual paths.

### Explanation of the cron job line:

- `0 16 * * 4`: Runs every Thursday (4 is the day of the week in crontab, where 0 is Sunday).
- `>> /path/to/logs/$(date +\%y\%m\%d).log 2>&1`: Appends standard output and errors to a log file named with the current date (`yymmdd.log` format).

This cron job setup ensures that your backup script runs automatically at the specified time and logs its output for tracking and troubleshooting purposes.


