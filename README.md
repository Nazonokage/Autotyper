# 🚀 **Typer.ps1 - The Human-Like Auto Typer** 

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Version](https://img.shields.io/badge/Version-2.0-brightgreen?style=for-the-badge)

**Type like a human, automate like a pro!** 🤖✍️

</div>

---

## 📋 **TABLE OF CONTENTS**
- [⚡ Quick Start](#-quick-start)
- [🎯 Introduction](#-introduction)
- [✨ Features](#-features)
- [🔧 Parameters](#-parameters)
- [🧠 How It Works (The Algorithm)](#-how-it-works-the-algorithm)
- [📝 Usage Examples](#-usage-examples)
- [🎮 Interactive Demo](#-interactive-demo)
- [⚠️ Troubleshooting](#️-troubleshooting)
- [🤝 Contributing](#-contributing)

---

## ⚡ **QUICK START**

### **One-Liner to Rule Them All:**
```powershell
powershell -ExecutionPolicy Bypass -File .\typer.ps1
```

### **That's it!** First run will:
1. ✅ Create `input.txt` automatically
2. 📝 Fill it with an example command
3. ⏸️ **STOP** and ask you to edit the file
4. 🚦 Ready for your custom text!

---

## 🎯 **INTRODUCTION**

Ever wished you could automate typing without looking like a bot? **Typer.ps1** is your answer! This PowerShell script simulates human-like typing with customizable delays, random variations, and smart punctuation handling.

### **The Problem It Solves:**
- 🤔 Tired of copy-pasting long texts?
- 🎭 Need to simulate real user interaction?
- ⏰ Want to schedule text input automatically?
- 🔒 Working in environments that block paste operations?

### **The Solution:**
Typer.ps1 reads text from a file (or directly from parameters) and types it out character by character, just like a human would - complete with natural pauses and variations!

---

## ✨ **FEATURES**

| Feature | Description | Benefit |
|---------|-------------|---------|
| 🧠 **Smart Capitalization** | Auto-capitalizes first letter | Professional looking output |
| 🎲 **Random Delays** | Human-like typing rhythm | Bypass bot detection |
| ⚡ **Punctuation Pause** | Extra delay after .,!? | Natural reading flow |
| 🔧 **Fully Configurable** | 7+ adjustable parameters | Perfect for any scenario |
| 🛡️ **Encoding Safe** | Cleans Unicode characters | No weird symbols |
| 📁 **Auto-Create File** | Creates input.txt if missing | Zero setup required |
| 🚦 **Safety First** | Cancels on first run | Prevents accidents |
| ⌨️ **Special Key Support** | Handles + ^ % ~ ( ) [ ] { } | Types ANYTHING |

---

## 🔧 **PARAMETERS**

```powershell
powershell .\typer.ps1 [-DelayMs <int>] [-InitialDelayMs <int>] [-Randomize] 
                      [-MinDelayMs <int>] [-MaxDelayMs <int>] 
                      [-PunctuationDelayMs <int>] [-Text <string>]
```

| Parameter | Range | Default | Description |
|-----------|-------|---------|-------------|
| `-DelayMs` | 1-2000 | 20 | Base delay between keystrokes (ms) |
| `-InitialDelayMs` | 0-10000 | 2000 | Time before typing starts (ms) |
| `-Randomize` | Switch | Off | Enable random delays |
| `-MinDelayMs` | 1-5000 | 40 | Minimum random delay (ms) |
| `-MaxDelayMs` | 1-5000 | 120 | Maximum random delay (ms) |
| `-PunctuationDelayMs` | 0-5000 | 300 | Extra pause after .,!? (ms) |
| `-Text` | Any string | "" | Type this instead of file |

---

## 🧠 **HOW IT WORKS (The Algorithm)**

### **Step 1: 📂 File Management**
```
┌─────────────────┐
│   Start Script  │
└────────┬────────┘
         ↓
┌─────────────────┐
│  -Text provided?│──Yes──→ Use provided text
└────────┬────────┘
         No
         ↓
┌─────────────────┐
│ input.txt exists?│──No──→ Create file with example
└────────┬────────┘          ↓
        Yes                  ⚠️ CANCEL & Prompt user
         ↓                    to edit file
┌─────────────────┐
│   Read file     │
└─────────────────┘
```

### **Step 2: 🔄 Text Processing Pipeline**
```
Raw Text → Clean-Text → Ensure-FirstLetterCapitalized → Ready to Type
    ↓           ↓                      ↓                      ↓
 [Unicode]  [Remove weird    [Capitalize first    [Clean, proper
            characters]       letter if needed]    formatted text]
```

### **Step 3: ⌨️ Typing Engine**
```
For each character:
    ↓
┌─────────────────────────────────────┐
│ Is it a special char? (+, ^, %, etc)│
└───────────────┬─────────────────────┘
        Yes     ↓        No
    ┌───────────────────────┐
    │ Use SendKeys escape   │──→ Normal SendKeys
    │ format: {+}, {^}, etc │
    └───────────────────────┘
                ↓
    ┌─────────────────────────────────┐
    │ Calculate delay:                │
    │ if Randomize: Random(Min,Max)   │
    │ else: DelayMs                    │
    └─────────────────────────────────┘
                ↓
    ┌─────────────────────────────────┐
    │ Punctuation? → Add ExtraDelay   │
    └─────────────────────────────────┘
                ↓
    ┌─────────────────────────────────┐
    │ Wait → Next character           │
    └─────────────────────────────────┘
```

### **Step 4: 📊 Progress Tracking**
- Shows real-time progress: `Progress: 42/100 characters`
- Updates every 10 chars or after punctuation
- Final summary with completion time

---

## 📝 **USAGE EXAMPLES**

### **Example 1: Basic Usage**
```powershell
# Just type what's in input.txt
.\typer.ps1
```

### **Example 2: Fast Typing**
```powershell
# Type super fast (10ms between keys)
.\typer.ps1 -DelayMs 10 -InitialDelayMs 1000
```

### **Example 3: Human-Like Mode**
```powershell
# Random delays between 50-150ms, pause 400ms after punctuation
.\typer.ps1 -Randomize -MinDelayMs 50 -MaxDelayMs 150 -PunctuationDelayMs 400
```

### **Example 4: Direct Text Input**
```powershell
# Type directly without creating input.txt
.\typer.ps1 -Text "Hello, this is a test message!"
```

### **Example 5: Long Presentation**
```powershell
# Give yourself 10 seconds to switch windows
.\typer.ps1 -InitialDelayMs 10000 -Randomize -PunctuationDelayMs 500
```

### **Example 6: Command Injection (Advanced)**
```powershell
# Type a PowerShell command (note the escaped quotes)
.\typer.ps1 -Text 'Write-Host "Hello World" -ForegroundColor Green'
```

---

## 🎮 **INTERACTIVE DEMO**

### **Scenario: Automating a Welcome Message**

**Step 1:** First run (file doesn't exist)
```powershell
PS C:\> .\typer.ps1

============================================================
INPUT.TXT NOT FOUND
============================================================
Creating input.txt with default content...

============================================================
AUTO-TYPING CANCELLED
============================================================
input.txt has been created with an example command.

Please:
  1. Open input.txt and replace its contents with the text you want to type
  2. Save the file
  3. Run this script again
```

**Step 2:** Edit `input.txt` to contain:
```
Welcome to our presentation! Today we'll discuss...
```

**Step 3:** Run again with human-like settings
```powershell
.\typer.ps1 -Randomize -PunctuationDelayMs 400
```

**Output:**
```
============================================================
TEXT PROCESSING
============================================================
First letter already capitalized: 'W'

Original: 'Welcome to our presentation! Today we'll discuss...'
Processed: 'Welcome to our presentation! Today we'll discuss...'

============================================================
TEXT TO TYPE
============================================================
Welcome to our presentation! Today we'll discuss...
============================================================
Length: 52 characters

Switch to your target window now...
Typing will begin in 2 seconds...
Press Ctrl+C to cancel...
Progress: 52/52 characters

============================================================
TYPING COMPLETED SUCCESSFULLY!
============================================================
```

---

## ⚠️ **TROUBLESHOOTING**

### **Common Issues & Solutions**

| Issue | Cause | Solution |
|-------|-------|----------|
| 🚫 **Script won't run** | Execution Policy | `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` |
| 📁 **File not found** | Wrong directory | Run from same folder as script or use full path |
| ⌨️ **Wrong window types** | Focus issue | Click target window during initial delay |
| 🔤 **Weird characters** | Unicode problems | Script auto-cleans them, but check source text |
| ⏱️ **Too fast/slow** | Delay settings | Adjust `-DelayMs` or use `-Randomize` |
| 🔒 **Special keys not working** | SendKeys limitations | They're handled! Check the switch statement |

### **Pro Tips:**
- 💡 Test with short text first to get timing right
- 🎯 Use `-InitialDelayMs 5000` for complex window switching
- 📊 Watch the progress bar to ensure it's working
- 🛑 Ctrl+C kills the script immediately

---

## 🤝 **CONTRIBUTING**

Love this script? Here's how you can help:

1. 🐛 **Report bugs** - Open an issue
2. 💡 **Suggest features** - Random word delays? Custom key mappings?
3. 🔧 **Submit PRs** - Make it even better
4. ⭐ **Star it** - Show some love
5. 📢 **Share it** - Tell your friends

### **Planned Features:**
- [ ] Word-based random delays (not just character)
- [ ] Configurable hotkey to start typing
- [ ] Multiple text snippets support
- [ ] GUI configuration tool
- [ ] Macro recording mode

---

## 📜 **LICENSE**

Free as in beer! 🍺 Use it, modify it, share it. Just don't blame me if you accidentally type "rm -rf /" somewhere important!

---

<div align="center">

**Made with ❤️ for automation enthusiasts everywhere**

[⬆ Back to Top](#-readme)

</div>

---

*Happy Typing! 🎉*