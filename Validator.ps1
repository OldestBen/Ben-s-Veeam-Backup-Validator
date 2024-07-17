# Import Veeam PowerShell module
Import-Module Veeam.Backup.PowerShell

# Function to find the Veeam Backup Validator executable
function Get-ValidatorPath {
    $defaultPaths = @(
        "C:\Program Files\Veeam\Backup and Replication\Backup",
        "C:\Program Files (x86)\Veeam\Backup and Replication\Backup"
    )

    foreach ($path in $defaultPaths) {
        $validatorPath = Join-Path -Path $path -ChildPath "Veeam.Backup.Validator.exe"
        if (Test-Path $validatorPath) {
            return $validatorPath
        }
    }

    throw "Veeam.Backup.Validator.exe not found in default installation paths."
}

# Function to validate backup
function Validate-Backup {
    param (
        [string]$BackupFilePath,
        [string]$RestorePoint,
        [string]$JobName
    )

    $validatorPath = Get-ValidatorPath
    
    if ($BackupFilePath) {
        $args = "-file `"$BackupFilePath`""
    } elseif ($RestorePoint) {
        $args = "-restorepoint `"$RestorePoint`""
    } elseif ($JobName) {
        $args = "-job `"$JobName`""
    } else {
        Write-Host "You must provide either a backup file path, a restore point, or a job name."
        return
    }

    Write-Host "Running command: $validatorPath $args"
    Start-Process -FilePath $validatorPath -ArgumentList $args -NoNewWindow -Wait
}

# Prompt user for input
$choice = Read-Host "Do you want to validate by (1) Backup File, (2) Restore Point, or (3) Job Name? Enter 1, 2, or 3"

switch ($choice) {
    1 {
        $backupFilePath = Read-Host "Enter the full path to the backup file"
        Validate-Backup -BackupFilePath $backupFilePath
    }
    2 {
        $restorePoint = Read-Host "Enter the restore point"
        Validate-Backup -RestorePoint $restorePoint
    }
    3 {
        $jobName = Read-Host "Enter the job name"
        Validate-Backup -JobName $jobName
    }
    default {
        Write-Host "Invalid choice. Please run the script again and enter 1, 2, or 3."
    }
}

Write-Host "Validation process completed."
