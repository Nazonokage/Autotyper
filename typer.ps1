<# 
    File: typer.ps1
    Purpose:
        Simulates human-like typing into the currently active window.

    Features:
        - Configurable base delay per character
        - Optional random delay range (more human-like)
        - Extra delay after punctuation
        - Configurable initial wait time
#>

param(
    # Text to type
    [Parameter(Mandatory = $false)]
    [string]$Text = "Sample text goes here.",

    # Base typing speed delay (milliseconds)
    [Parameter(Mandatory = $false)]
    [ValidateRange(1,2000)]
    [int]$DelayMs = 15,

    # Initial wait before typing starts (milliseconds)
    [Parameter(Mandatory = $false)]
    [ValidateRange(0,10000)]
    [int]$InitialDelayMs = 1500,

    # Enable random delay variation (human effect)
    [Parameter(Mandatory = $false)]
    [switch]$Randomize,

    # Minimum random delay (used if -Randomize enabled)
    [int]$MinDelayMs = 50,

    # Maximum random delay (used if -Randomize enabled)
    [int]$MaxDelayMs = 110,

    # Extra pause after punctuation (.,!?)
    [int]$PunctuationDelayMs = 250
)

# Load Windows Forms assembly for SendKeys
Add-Type -AssemblyName System.Windows.Forms

# Clean up smart quotes for compatibility
$Text = $Text -replace "[‘’]", "'"
$Text = $Text -replace "[“”]", '"'

Write-Host "Preparing to type..." -ForegroundColor Cyan

# Initial delay (time to focus the target window)
Start-Sleep -Milliseconds $InitialDelayMs

# Convert text into character array
$Characters = $Text.ToCharArray()

foreach ($char in $Characters) {

    # Send key to active window
    [System.Windows.Forms.SendKeys]::SendWait($char)

    # Determine delay
    if ($Randomize) {
        # Human-like random delay
        $CurrentDelay = Get-Random -Minimum $MinDelayMs -Maximum $MaxDelayMs
    }
    else {
        # Fixed delay
        $CurrentDelay = $DelayMs
    }

    # Extra pause after punctuation
    if ($char -match "[\.\!\?,]") {
        $CurrentDelay += $PunctuationDelayMs
    }

    # Apply delay
    Start-Sleep -Milliseconds $CurrentDelay
}

Write-Host "Typing completed." -ForegroundColor Green
