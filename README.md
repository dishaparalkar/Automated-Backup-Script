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
1. Go to :
   ```
   cd D:\backup_project
   ```
2️. Run:
```powershell
.\backup.ps1
```
![ss1](https://github.com/user-attachments/assets/06bd52e7-43e3-4c82-8ff6-5155bf96204c)

![ss2](https://github.com/user-attachments/assets/40b46636-3390-4ca2-a1ee-0eba6e3e8d01)
