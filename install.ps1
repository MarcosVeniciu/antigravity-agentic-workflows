<#
.SYNOPSIS
    Native installer for the Antigravity Agentic Workflows ecosystem (Windows / PowerShell).

.DESCRIPTION
    Copies and synchronizes prompts, workflows, and skills from the repository into the global
    scope (~/.gemini) or a specific project directory (.agents/).
    Includes safety safeguards with timestamped backups (YYYYMMDD_HHMM).

.PARAMETER Global
    Installs to global user scope (~/.gemini).

.PARAMETER Project
    Path to project directory where customizations will be installed (.agents/ and GEMINI.md).

.PARAMETER Force
    Overwrites existing files without terminal confirmation (still creates timestamped backups).

.PARAMETER NoBackup
    Disables creating the timestamped backup directory.

.PARAMETER DryRun
    Simulates the installation and displays all actions without modifying files on disk.

.EXAMPLE
    .\install.ps1 -Global
    Installs into global scope (~/.gemini).

.EXAMPLE
    .\install.ps1 -Project "C:\Projects\my-app"
    Installs into a specific project.

.EXAMPLE
    .\install.ps1 -Global -DryRun
    Simulates global installation listing all affected files.
#>

[CmdletBinding()]
param (
    [switch]$Global,
    [string]$Project,
    [switch]$Force,
    [switch]$NoBackup,
    [switch]$DryRun
)

# Set UTF-8 encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Base repository locations
$RepoRoot = $PSScriptRoot
$SourcePrompts = Join-Path $RepoRoot "prompts"
$SourceWorkflows = Join-Path $RepoRoot "workflows"
$SourceSkills = Join-Path $RepoRoot "skills"
$SourceGeminiRule = Join-Path $SourcePrompts "gemini.md"

# Validate sources
if (-not (Test-Path $SourceWorkflows) -or -not (Test-Path $SourceSkills)) {
    Write-Host "[ERROR] 'workflows' or 'skills' directories not found in: $RepoRoot" -ForegroundColor Red
    Write-Host "Make sure you are running the script from the root of the cloned/extracted repository." -ForegroundColor Yellow
    exit 1
}

# Colors and formatting
function Write-Header {
    param([string]$Text)
    Write-Host ""
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host "  $Text" -ForegroundColor Cyan
    Write-Host ("=" * 60) -ForegroundColor Cyan
}

function Write-Success { param([string]$Text) Write-Host "  [OK] $Text" -ForegroundColor Green }
function Write-Info    { param([string]$Text) Write-Host "  [INFO] $Text" -ForegroundColor Gray }
function Write-Warn    { param([string]$Text) Write-Host "  [WARN] $Text" -ForegroundColor Yellow }
function Write-Sim     { param([string]$Text) Write-Host "  [SIMULATION] $Text" -ForegroundColor Magenta }

# Interactive menu if no target mode is specified
if (-not $Global -and [string]::IsNullOrWhiteSpace($Project)) {
    Write-Header "Antigravity Agentic Workflows Installer"
    Write-Host "Choose installation mode:`n"
    Write-Host "  [1] Global  (~/.gemini) - Applies to all projects on this machine" -ForegroundColor White
    Write-Host "  [2] Project (.agents)   - Installs into a specific project directory" -ForegroundColor White
    Write-Host "  [3] Exit" -ForegroundColor White
    Write-Host ""
    
    $choice = Read-Host "Enter option [1-3]"
    switch ($choice.Trim()) {
        "1" { $Global = $true }
        "2" {
            $inputPath = Read-Host "Enter project directory path (absolute or relative)"
            if ([string]::IsNullOrWhiteSpace($inputPath)) {
                Write-Host "[ERROR] Project path cannot be empty." -ForegroundColor Red
                exit 1
            }
            $Project = $inputPath.Trim()
        }
        "3" {
            Write-Host "Installation canceled by user." -ForegroundColor Yellow
            exit 0
        }
        default {
            Write-Host "[ERROR] Invalid option. Operation aborted." -ForegroundColor Red
            exit 1
        }
    }
}

# Target paths
$UserHome = [Environment]::GetFolderPath('UserProfile')
if ([string]::IsNullOrWhiteSpace($UserHome)) {
    $UserHome = if ($env:USERPROFILE) { $env:USERPROFILE } else { $env:HOME }
}

$Timestamp = (Get-Date -Format "yyyyMMdd_HHmm")
$OverwriteAll = $Force

if ($Global) {
    $TargetMode = "Global"
    $TargetBase = Join-Path $UserHome ".gemini"
    $TargetRuleFile = Join-Path $TargetBase "GEMINI.md"
    $TargetWorkflowsDir = Join-Path $TargetBase "config\global_workflows"
    $TargetSkillsDir = Join-Path $TargetBase "config\skills"
    $BackupDir = Join-Path $TargetBase "backups\backup_$Timestamp"
} else {
    $TargetMode = "Project"
    if (Test-Path $Project) {
        $TargetProjectRoot = (Resolve-Path $Project).Path
    } else {
        $TargetProjectRoot = [System.IO.Path]::GetFullPath($Project)
    }
    $TargetBase = Join-Path $TargetProjectRoot ".agents"
    $TargetRuleFile = Join-Path $TargetProjectRoot "GEMINI.md"
    $TargetWorkflowsDir = Join-Path $TargetBase "workflows"
    $TargetSkillsDir = Join-Path $TargetBase "skills"
    $BackupDir = Join-Path $TargetBase "backups\backup_$Timestamp"
}

Write-Header "Installation Setup ($TargetMode)"
Write-Info "Mode:                $TargetMode"
Write-Info "Repository Source:   $RepoRoot"
Write-Info "Rules Target:        $TargetRuleFile"
Write-Info "Workflows Target:    $TargetWorkflowsDir"
Write-Info "Skills Target:       $TargetSkillsDir"
if (-not $NoBackup) {
    Write-Info "Backup Directory:    $BackupDir"
}
if ($DryRun) {
    Write-Host "`n*** DRY-RUN SIMULATION ACTIVE - NO FILES WILL BE MODIFIED ***`n" -ForegroundColor Magenta
}

# Helper to verify identical file content
function Test-FilesIdentical {
    param([string]$FileA, [string]$FileB)
    if (-not (Test-Path $FileA) -or -not (Test-Path $FileB)) { return $false }
    $hashA = (Get-FileHash -Algorithm SHA256 -Path $FileA).Hash
    $hashB = (Get-FileHash -Algorithm SHA256 -Path $FileB).Hash
    return ($hashA -eq $hashB)
}

# Safe single file install function
function Install-SingleFile {
    param(
        [string]$SourceFile,
        [string]$DestFile,
        [string]$RelativeBackupSubpath
    )

    if (-not (Test-Path $SourceFile)) {
        Write-Warn "Source file not found: $SourceFile"
        return
    }

    $destDir = Split-Path $DestFile -Parent
    $fileName = Split-Path $DestFile -Leaf

    if (Test-Path $DestFile) {
        if (Test-FilesIdentical $SourceFile $DestFile) {
            Write-Info "$fileName is already up to date and identical."
            return
        }

        # File exists and differs
        if (-not $DryRun -and -not $script:OverwriteAll) {
            Write-Host "`nFile '$fileName' already exists at target and differs." -ForegroundColor Yellow
            $resp = Read-Host "Overwrite? [Y]es / [N]o / [A]ll / [C]ancel"
            switch ($resp.Trim().ToLower()) {
                "y" { }
                "a" { $script:OverwriteAll = $true }
                "n" { Write-Info "Skipped: $fileName"; return }
                "c" { Write-Host "Installation aborted by user." -ForegroundColor Yellow; exit 0 }
                default { Write-Info "Skipped by default: $fileName"; return }
            }
        }

        # Create backup if enabled
        if (-not $NoBackup) {
            $backupFileDest = Join-Path $BackupDir $RelativeBackupSubpath
            $backupFileDir = Split-Path $backupFileDest -Parent
            if ($DryRun) {
                Write-Sim "Backup '$DestFile' -> '$backupFileDest'"
            } else {
                if (-not (Test-Path $backupFileDir)) {
                    [void](New-Item -ItemType Directory -Path $backupFileDir -Force)
                }
                Copy-Item -Path $DestFile -Destination $backupFileDest -Force
                Write-Warn "Backup created: $RelativeBackupSubpath"
            }
        }
    }

    if ($DryRun) {
        Write-Sim "Copy '$SourceFile' -> '$DestFile'"
    } else {
        if (-not (Test-Path $destDir)) {
            [void](New-Item -ItemType Directory -Path $destDir -Force)
        }
        Copy-Item -Path $SourceFile -Destination $DestFile -Force
        Write-Success "Installed: $fileName"
    }
}

# 1. Install Rule (GEMINI.md)
Write-Header "1. Installing Base Prompt / Global Rule"
if (Test-Path $SourceGeminiRule) {
    Install-SingleFile -SourceFile $SourceGeminiRule -DestFile $TargetRuleFile -RelativeBackupSubpath "GEMINI.md"
} else {
    Write-Warn "Source file $SourceGeminiRule not found."
}

# 2. Install Workflows
Write-Header "2. Installing Workflows (Slash Commands)"
$workflowFiles = Get-ChildItem -Path $SourceWorkflows -Filter "*.md" -File
foreach ($wf in $workflowFiles) {
    $destWf = Join-Path $TargetWorkflowsDir $wf.Name
    Install-SingleFile -SourceFile $wf.FullName -DestFile $destWf -RelativeBackupSubpath (Join-Path "workflows" $wf.Name)
}

# 3. Install Skills
Write-Header "3. Installing Modular Skills"
$skillDirs = Get-ChildItem -Path $SourceSkills -Directory
foreach ($sDir in $skillDirs) {
    $skillName = $sDir.Name
    $allFiles = Get-ChildItem -Path $sDir.FullName -Recurse -File
    foreach ($file in $allFiles) {
        $subPath = $file.FullName.Substring($sDir.FullName.Length).TrimStart('\', '/')
        $destSkillFile = Join-Path (Join-Path $TargetSkillsDir $skillName) $subPath
        $relBackup = Join-Path (Join-Path "skills" $skillName) $subPath
        Install-SingleFile -SourceFile $file.FullName -DestFile $destSkillFile -RelativeBackupSubpath $relBackup
    }
}

# Completion
Write-Header "Installation Completed Successfully!"
if ($DryRun) {
    Write-Host "Simulation completed. No files were modified on disk.`n" -ForegroundColor Magenta
} else {
    Write-Host "All resources synchronized successfully." -ForegroundColor Green
    if (Test-Path $BackupDir) {
        Write-Host "`n[BACKUP] Replaced files were backed up to:" -ForegroundColor Yellow
        Write-Host "  $BackupDir`n" -ForegroundColor Cyan
    }
    Write-Host "To get started in Antigravity:" -ForegroundColor White
    Write-Host "  1. Open or reload your session in the Antigravity IDE." -ForegroundColor Gray
    Write-Host "  2. Type /ask or /plan in chat to verify available slash commands.`n" -ForegroundColor Gray
}
