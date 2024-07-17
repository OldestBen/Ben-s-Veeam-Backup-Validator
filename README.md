## Ben's Veeam Backup Validator

## Overview

This PowerShell script allows you to validate Veeam backups by leveraging the Veeam Backup Validator executable. It supports validation through three methods: by backup file path, by restore point, or by job name. This script is designed to streamline the validation process, making it easy and efficient to ensure your backups are intact.
Features

  Validate by Backup File Path: Validate a specific backup file.
  Validate by Restore Point: Validate a restore point.
  Validate by Job Name: Validate the latest restore point for a specified job.

## Requirements

  Veeam Backup & Replication installed on the machine.
  Veeam PowerShell module (Veeam.Backup.PowerShell) installed.
  PowerShell with administrative privileges.

## Installation

  Ensure that Veeam Backup & Replication and the Veeam PowerShell module are installed on your machine.
  Download the script to your local machine.

## Usage

  Open PowerShell with administrative privileges.
  Navigate to the directory containing the script.
  Run the script using the command: .\VeeamBackupValidator.ps1.
  Follow the on-screen prompts to select your validation method and input the necessary information.

## Example

To validate a backup file:

  Run the script: .\VeeamBackupValidator.ps1
  Enter 1 when prompted to choose validation by backup file.
  Provide the full path to the backup file when prompted.

## License

This project is licensed under the GPLv3 License - see the LICENSE file for details.

