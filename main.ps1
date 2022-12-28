# Set the destination path for the external drive
$destinationPath = "$env:EXTERNAL_DRIVE_LETTER\Videos"

# Get the current date and format it as a string
$date = Get-Date -Format "yyyy-MM-dd"

# Create a new folder with the current date as the name
New-Item -ItemType Directory -Path "$destinationPath\Videos $date"

# Set the destination path for the new folder
$destinationPath = "$destinationPath\Videos $date"

# Get a list of all video files in the C drive
$videoFiles = Get-ChildItem -Path "C:\" -Filter "*.mp4", "*.avi", "*.mkv", "*.mov" -Recurse

# Move each video file to the new folder
foreach ($file in $videoFiles) {
  Move-Item -Path $file.FullName -Destination $destinationPath
}

# Set the SMTP server and port
$smtpServer = "smtp.gmail.com"
$smtpPort = 587

# Set the sender and recipient email addresses
$from = "sender@gmail.com"
$to = "recipient@gmail.com"

# Set the subject and body of the email
$subject = "Video files moved"
$body = "All video files have been moved to the $destinationPath folder on the external drive."

# Set the credentials for the SMTP server
$credential = Get-Credential

# Send the email using the Send-MailMessage cmdlet
Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -UseSsl -Credential $credential -From $from -To $to -Subject $subject -Body $body
