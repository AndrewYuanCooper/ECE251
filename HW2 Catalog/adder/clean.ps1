<#
 # File: 	clean.ps1
 # Author: 	Prof. Rob Marano
 # Build and test file for Verilog on Windows using PowerShell
 # Note: icarus verilog and gtkwave must be installed
 #>

# $COMPONENT is named in config.ps1
# Do not forget to add that file in the same directory as this file and set the variable
$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
try {
    . ("$ScriptDirectory\config.ps1")
}
catch {
    Write-Host "Error while loading supporting PowerShell Scripts"
    [Environment]::Exit(1)
}

# Clean up from last run
Write-Output "Removing files: $filesToRemove"
$filesToRemove | ForEach-Object { Remove-Item -Path $_ -Force -ErrorAction SilentlyContinue -Confirm:$false}

Write-Output "Finished cleaning up files."
