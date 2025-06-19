# Automated Backup Script (Windows PowerShell)

A PowerShell script to automate the backup of important directories by compressing them into timestamped ZIP files, with logging and retention management.

## 📂 Features
- Compresses the source directory into a timestamped ZIP file.
- Logs all backup actions and errors to a log file.
- Automatically creates the backup folder if it doesn't exist.
- Keeps only the latest 5 backups, deleting older ones.
- Easy to schedule using Windows Task Scheduler.

## ⚙️ How It Works
- Backs up: `D:\Users\disha\Documents`
- Stores backups: `D:\Users\disha\Backups`
- Creates backups as: `backup_YYYY-MM-DD_HH-mm-ss.zip`
- Log file: `D:\Users\disha\Backups\backup_log.txt`

## 📝 Usage
1️⃣ Open PowerShell as Administrator.

2️⃣ Run:
```powershell
.\backup.ps1
```
