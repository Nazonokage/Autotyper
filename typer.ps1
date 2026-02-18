<#
    File: typer.ps1
    Purpose:
        Human-like auto typer using text from input.txt
        Encoding-safe and fully sanitized.
        Automatically creates input.txt with example if missing.
        Automatically capitalizes the first letter of the text.

    Usage:
        powershell -ExecutionPolicy Bypass -File .\typer.ps1
#>

param(
    # Base typing delay per character (ms)
    [ValidateRange(1,2000)]
    [int]$DelayMs = 20,

    # Initial delay before typing starts (ms)
    [ValidateRange(0,10000)]
    [int]$InitialDelayMs = 2500,

    # Enable human randomization
    [switch]$Randomize,

    # Random delay range
    [ValidateRange(1,5000)]
    [int]$MinDelayMs = 40,

    [ValidateRange(1,5000)]
    [int]$MaxDelayMs = 120,

    # Extra pause after punctuation
    [ValidateRange(0,5000)]
    [int]$PunctuationDelayMs = 300,

    # Text to type (instead of reading from input.txt)
    [string]$Text = ""
)

# ------------------------------------------------------------
# FUNCTION: Clean-Text
# Removes problematic Unicode and normalizes characters
# ------------------------------------------------------------
function Clean-Text {
    param([string]$InputText)

    # Replace any dash-like Unicode character with normal hyphen
    $InputText = [regex]::Replace($InputText, '\p{Pd}', '-')

    # Normalize smart quotes
    $InputText = [regex]::Replace($InputText, '[\u2018\u2019]', "'")
    $InputText = [regex]::Replace($InputText, '[\u201C\u201D]', '"')

    # Remove any non-ASCII characters (optional but safest)
    $InputText = [regex]::Replace($InputText, '[^\x00-\x7F]', '')

    return $InputText
}

# ------------------------------------------------------------
# FUNCTION: Ensure-FirstLetterCapitalized
# Capitalizes first letter if it's lowercase, preserves if already capitalized
# ------------------------------------------------------------
function Ensure-FirstLetterCapitalized {
    param([string]$InputText)

    if ([string]::IsNullOrWhiteSpace($InputText)) {
        return $InputText
    }

    # Trim leading spaces to find the first actual character
    $trimmedText = $InputText.TrimStart()
    $leadingSpaces = $InputText.Substring(0, $InputText.Length - $trimmedText.Length)
    
    if ($trimmedText.Length -eq 0) {
        return $InputText
    }

    $firstChar = $trimmedText[0]
    $restOfTrimmed = ""
    
    if ($trimmedText.Length -gt 1) {
        $restOfTrimmed = $trimmedText.Substring(1)
    }

    # Check if first character is a lowercase letter
    if ($firstChar -cmatch '[a-z]') {
        # Capitalize it
        $firstChar = $firstChar.ToString().ToUpper()
        Write-Host "First letter capitalized: '$firstChar'" -ForegroundColor DarkYellow
    }
    elseif ($firstChar -cmatch '[A-Z]') {
        Write-Host "First letter already capitalized: '$firstChar'" -ForegroundColor DarkGreen
    }
    else {
        Write-Host "First character is not a letter: '$firstChar'" -ForegroundColor DarkGray
    }

    # Reconstruct the text with leading spaces preserved
    return $leadingSpaces + $firstChar + $restOfTrimmed
}

# ------------------------------------------------------------
# VALIDATION
# ------------------------------------------------------------
if ($Randomize -and $MinDelayMs -ge $MaxDelayMs) {
    Write-Error "MinDelayMs must be less than MaxDelayMs when -Randomize is enabled."
    exit
}

# ------------------------------------------------------------
# LOAD TEXT FROM FILE OR USE -TEXT PARAMETER
# ------------------------------------------------------------
$InputPath = ".\input.txt"
$FileWasCreated = $false

# If -Text parameter is provided, create input.txt with that text
if ($Text -ne "") {
    # Create input.txt with the provided text
    $Text | Out-File -FilePath $InputPath -Encoding UTF8
    Write-Host "Created input.txt with text: $Text" -ForegroundColor Yellow
    # Use the provided text directly
    $TextToType = $Text
}
else {
    # Check if input.txt exists
    if (!(Test-Path $InputPath)) {
        Write-Host "`n" + ("=" * 60) -ForegroundColor Red
        Write-Host "INPUT.TXT NOT FOUND" -ForegroundColor Red
        Write-Host ("=" * 60) -ForegroundColor Red
        Write-Host "Creating input.txt with default content..." -ForegroundColor Yellow
        
        $defaultContent = 'powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Hello, World!"'
        $defaultContent | Out-File -FilePath $InputPath -Encoding UTF8
        
        Write-Host "`n" + ("=" * 60) -ForegroundColor Yellow
        Write-Host "AUTO-TYPING CANCELLED" -ForegroundColor Yellow
        Write-Host ("=" * 60) -ForegroundColor Yellow
        Write-Host "input.txt has been created with an example command." -ForegroundColor White
        Write-Host "`nPlease:" -ForegroundColor Cyan
        Write-Host "  1. Open input.txt and replace its contents with the text you want to type" -ForegroundColor Cyan
        Write-Host "  2. Save the file" -ForegroundColor Cyan
        Write-Host "  3. Run this script again" -ForegroundColor Cyan
        Write-Host "`nOr use the -Text parameter directly:" -ForegroundColor Green
        Write-Host "  .\typer.ps1 -Text ""Your text here""" -ForegroundColor Green
        Write-Host ("=" * 60) -ForegroundColor Yellow
        
        exit
    }
    
    # Force UTF-8 read
    $TextToType = Get-Content $InputPath -Raw -Encoding UTF8

    if ([string]::IsNullOrWhiteSpace($TextToType)) {
        Write-Error "input.txt is empty. Please add text to type and run again."
        exit
    }
}

# Clean encoding issues
$TextToType = Clean-Text $TextToType

# ------------------------------------------------------------
# APPLY FIRST LETTER CAPITALIZATION
# ------------------------------------------------------------
Write-Host "`n" + ("=" * 60) -ForegroundColor Magenta
Write-Host "TEXT PROCESSING" -ForegroundColor Magenta
Write-Host ("=" * 60) -ForegroundColor Magenta

$originalText = $TextToType
$TextToType = Ensure-FirstLetterCapitalized $TextToType

# Show comparison if changes were made
if ($originalText -ne $TextToType) {
    Write-Host "`nOriginal: '$originalText'" -ForegroundColor Gray
    Write-Host "Processed: '$TextToType'" -ForegroundColor Green
}

# ------------------------------------------------------------
# DISPLAY INFO
# ------------------------------------------------------------
Write-Host "`n" + ("=" * 60) -ForegroundColor Cyan
Write-Host "TEXT TO TYPE" -ForegroundColor Cyan
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host $TextToType -ForegroundColor White
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "Length: $($TextToType.Length) characters" -ForegroundColor Yellow

# ------------------------------------------------------------
# START TYPING
# ------------------------------------------------------------
Add-Type -AssemblyName System.Windows.Forms

Write-Host "`nSwitch to your target window now..." -ForegroundColor Cyan
Write-Host "Typing will begin in $($InitialDelayMs/1000) seconds..." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to cancel..." -ForegroundColor Red
Start-Sleep -Milliseconds $InitialDelayMs

$Characters = $TextToType.ToCharArray()
$charCount = 0
$totalChars = $Characters.Length

foreach ($char in $Characters) {
    $charCount++
    
    # Show progress every 10 characters or for punctuation
    if ($charCount % 10 -eq 0 -or $char -match "[\.!\?,]") {
        Write-Host "`rProgress: $charCount/$totalChars characters" -NoNewline -ForegroundColor Gray
    }

    # Handle special characters that SendKeys might interpret differently
    switch ($char) {
        '+' { [System.Windows.Forms.SendKeys]::SendWait('{+}') }
        '^' { [System.Windows.Forms.SendKeys]::SendWait('{^}') }
        '%' { [System.Windows.Forms.SendKeys]::SendWait('{%}') }
        '~' { [System.Windows.Forms.SendKeys]::SendWait('{~}') }
        '(' { [System.Windows.Forms.SendKeys]::SendWait('{(}') }
        ')' { [System.Windows.Forms.SendKeys]::SendWait('{)}') }
        '[' { [System.Windows.Forms.SendKeys]::SendWait('{[}') }
        ']' { [System.Windows.Forms.SendKeys]::SendWait('{]}') }
        '{' { [System.Windows.Forms.SendKeys]::SendWait('{{}') }
        '}' { [System.Windows.Forms.SendKeys]::SendWait('{}}') }
        default { [System.Windows.Forms.SendKeys]::SendWait($char) }
    }

    # Calculate delay
    if ($Randomize) {
        $CurrentDelay = Get-Random -Minimum $MinDelayMs -Maximum $MaxDelayMs
    }
    else {
        $CurrentDelay = $DelayMs
    }

    # Add extra delay after punctuation
    if ($char -match "[\.!\?,]") {
        $CurrentDelay += $PunctuationDelayMs
    }

    Start-Sleep -Milliseconds $CurrentDelay
}

Write-Host "`rProgress: $totalChars/$totalChars characters" -ForegroundColor Green
Write-Host "`n" + ("=" * 60) -ForegroundColor Green
Write-Host "TYPING COMPLETED SUCCESSFULLY!" -ForegroundColor Green
Write-Host ("=" * 60) -ForegroundColor Green