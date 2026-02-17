# AutoTyper - Human-Like Typing Simulator

## Overview
AutoTyper is a PowerShell script that simulates human-like typing into any active window. Perfect for automation, demonstrations, testing, or any scenario where you need to programmatically type text with natural speed variations.

## Features
- **Human-like typing speed** - Configurable delays between characters
- **Random typing variations** - Optional randomized delays to mimic natural typing patterns
- **Punctuation delays** - Automatic pauses after punctuation marks (`.`, `!`, `?`, `,`)
- **Smart quote handling** - Automatically converts smart quotes to standard quotes for compatibility
- **Initial delay** - Gives you time to focus the target window before typing begins
- **Full customization** - Control every aspect of the typing behavior

## Requirements
- Windows operating system
- PowerShell 5.0 or later
- Administrator privileges may be required depending on the target application

## Installation
1. Save `typer.ps1` to a directory on your computer
2. Open PowerShell
3. Navigate to the script directory:
   ```powershell
   cd "path\to\autotyper"
   ```

## Usage

### Basic Usage
Simply type text using default settings:
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Hello, World!"
```

### With Custom Speed
Adjust the typing speed (lower = faster):
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Your text here" -DelayMs 25
```

### With Human-Like Variation
Enable random delays for more natural typing:
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Your text here" -Randomize -MinDelayMs 30 -MaxDelayMs 100
```

### Complete Example with All Options
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 `
  -Text "Hello, this is a test message!" `
  -DelayMs 15 `
  -InitialDelayMs 2000 `
  -Randomize `
  -MinDelayMs 50 `
  -MaxDelayMs 120 `
  -PunctuationDelayMs 300
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `-Text` | String | "Sample text goes here." | The text to type |
| `-DelayMs` | Integer (1-2000) | 15 | Base delay per character in milliseconds |
| `-InitialDelayMs` | Integer (0-10000) | 1500 | Wait time before typing starts (in milliseconds) |
| `-Randomize` | Switch | False | Enable random delay variations |
| `-MinDelayMs` | Integer | 50 | Minimum random delay when `-Randomize` is enabled |
| `-MaxDelayMs` | Integer | 110 | Maximum random delay when `-Randomize` is enabled |
| `-PunctuationDelayMs` | Integer | 250 | Extra pause after punctuation marks |

## Timing Guide

### Slow Typing (Natural Reading Speed)
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Your text" -DelayMs 50 -Randomize -MinDelayMs 30 -MaxDelayMs 100
```

### Medium Typing (Moderate Speed)
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Your text" -DelayMs 20 -Randomize -MinDelayMs 15 -MaxDelayMs 60
```

### Fast Typing (Quick Entry)
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Your text" -DelayMs 5 -PunctuationDelayMs 100
```

## Step-by-Step Instructions

1. **Focus your target window** - Click on the application/text field where you want the text to appear
2. **Run the script** - Execute the command in PowerShell
3. **Wait for initial delay** - The script waits 1.5 seconds by default (you'll see "Preparing to type..." message)
4. **Watch it type** - The text will be automatically typed character by character
5. **Typing complete** - You'll see "Typing completed." message when done

## Tips & Tricks

- **Increase initial delay** if you need more time to focus the window:
  ```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Your text" -InitialDelayMs 3000
  ```

- **For form filling** - Use shorter punctuation delays and faster speed:
  ```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Input" -DelayMs 5 -PunctuationDelayMs 50
  ```

- **For demonstrations** - Use randomization for a more natural appearance:
  ```powershell
  .\typer.ps1 -Text "Demo text" -RandomIsComputerIze -MinDelayMs 40 -MaxDelayMs 120
  ```

- **For multi-line text** - Use escaped newlines:
  ```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1 -Text "Line 1`nLine 2`nLine 3"
  ```

## Execution Policy Notice
If you get an execution policy error, run PowerShell as Administrator and execute:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then try running the script again.

## Troubleshooting

**Issue: Nothing is being typed**
- Ensure the target window is actually focused when the script runs
- Check that the initial delay is long enough (increase `-InitialDelayMs`)

**Issue: Text appears too fast/too slow**
- Adjust the `-DelayMs` parameter to fine-tune speed
- Use `-Randomize` for more varied typing speeds

**Issue: Script won't run**
- Check execution policy (see note above)
- Run PowerShell as Administrator
- Ensure the target application accepts keyboard input

## License
Feel free to use, modify, and distribute this script as needed.

---

**Happy Typing!** 🚀
