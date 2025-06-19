# Define Source and Backup Directory
$SOURCE_DIR = "D:\Users\disha\Documents"
$BACKUP_DIR = "D:\Users\disha\Backups"

# Define Log File
$LOG_FILE = "$BACKUP_DIR\backup_log.txt"

# Function to Write Log Messages
Function Write-Log {
    param (
        [string]$Message
    )
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Timestamp - $Message" | Out-File -Append -FilePath $LOG_FILE
}

# Create Backup Folder (if not exists)
If (!(Test-Path -Path $BACKUP_DIR)) {
    New-Item -ItemType Directory -Path $BACKUP_DIR
    Write-Log "Created Backup Directory: $BACKUP_DIR"
}

# Get Current Date & Time for timestamp
$TIMESTAMP = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$BACKUP_FILE = "backup_$TIMESTAMP.zip"
$BACKUP_PATH = "$BACKUP_DIR\$BACKUP_FILE"

# Start the backup process and log it
Write-Log "Backup process started for source: $SOURCE_DIR"

# Check if Source Exists
If (Test-Path -Path $SOURCE_DIR) {
    Try {
        # Compress and Save the Backup
        Compress-Archive -Path $SOURCE_DIR -DestinationPath $BACKUP_PATH -Force
        Write-Log "Backup completed successfully: $BACKUP_PATH"
    }
    Catch {
        Write-Log "Error during backup: $_"
    }
} Else {
    Write-Log "Error: Source directory does not exist: $SOURCE_DIR"
}

# Keep Only Last 5 Backups (Delete Older Ones)
$backups = Get-ChildItem -Path $BACKUP_DIR -Filter "backup_*.zip" | Sort-Object LastWriteTime -Descending
if ($backups.Count -gt 5) {
    $backups[5..$backups.Count] | Remove-Item -Force
    Write-Log "Old backups deleted, keeping the last 5."
}

Write-Log "Backup process finished."
