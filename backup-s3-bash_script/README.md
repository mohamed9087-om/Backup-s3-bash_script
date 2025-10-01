#Automated File Backup to Local & AWS S3

This project is a Bash script that automates the process of creating backups from a local directory, storing them in a dedicated local backup folder, and then securely uploading them to an Amazon S3 bucket.

It’s designed to help developers, system administrators, and DevOps engineers maintain a reliable and automated backup workflow with minimal effort.

🚀 Features

✅ Automatically compresses files from a source directory.

✅ Stores backups locally with timestamped filenames.

✅ Uploads backup files directly to an AWS S3 bucket.

✅ Generates a log file to track backup activities.

✅ Includes error-handling for existing files and missing AWS CLI.

🛠️ Requirements

Before running the script, ensure you have:

Linux environment (tested on Amazon Linux EC2).

AWS CLI installed → Install Guide

AWS IAM user/role with S3 permissions

Configured AWS credentials using :
aws configure
📂 Project Structure :
/home/ec2-user/
│
├── bash/              # Source directory containing files
├── backup/            # Destination directory for backup files
│   └── logfile.log    # Backup process logs
└── backup.sh          # Main backup script

⚙️ Usage :
git clone https://github.com/your-username/file-backup-s3.git
cd file-backup-s3
Make the script executable :
chmod +x backup.sh
Run the script :
./backup.sh
📑 Example Output : 
tar: Removing leading `/' from member names
/home/ec2-user/bash/file0
/home/ec2-user/bash/file1
...

backup complete successfully. Backup file: /home/ec2-user/backup/file-backup-10-01-25_00_35_27.tar.gz

upload: backup/file-backup-10-01-25_00_35_27.tar.gz to s3://s3-new-bash-course99/file-backup-10-01-25_00_35_27.tar.gz

file uploaded successfully to the S3 bucket: s3-new-bash-course99

🔒 Security Note :
Ensure that your AWS credentials are not hardcoded inside the script.

Use IAM roles or environment variables for better security practices.

🌟 Future Improvements

Add cron jobs for automated scheduled backups.

Integrate email/Slack notifications after backup completion.

Support for multiple buckets or regions





