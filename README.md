# 🚀 **Typer.ps1 - The Human-Like Auto Typer** 

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Version](https://img.shields.io/badge/Version-2.0-brightgreen?style=for-the-badge)
![Purpose](https://img.shields.io/badge/Purpose-Paste%20Bypass-orange?style=for-the-badge)

**Type like a human, bypass paste restrictions like a pro!** 🤖✍️🚫📋

</div>

---

## 📋 **TABLE OF CONTENTS**
- [⚡ Quick Start](#-quick-start)
- [🎯 Introduction](#-introduction)
- [🛡️ The "Why" - Bypassing Paste Restrictions](#️-the-why---bypassing-paste-restrictions)
- [🔧 Installation & Setup](#-installation--setup)
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
- 🚫 Applications that block paste operations (CTRL+V, right-click paste)
- 🎭 Need to simulate real user interaction?
- ⏰ Want to schedule text input automatically?
- 🔒 Working in secure environments that disable clipboard

### **The Solution:**
Typer.ps1 reads text from a file (or directly from parameters) and **types it out character by character**, just like a human would - complete with natural pauses and variations! This cleverly bypasses any paste restrictions because technically, you're not pasting - you're typing!

---

## 🛡️ **THE "WHY" - BYPASSING PASTE RESTRICTIONS**

### **Where This Tool Shines:**

| Scenario | Normal Pasting | Typer.ps1 |
|----------|---------------|-----------|
| 💻 **Remote Desktop/VMware** | Often blocked | ✅ Works perfectly |
| 🌐 **Web-based terminals** | CTRL+V disabled | ✅ Types naturally |
| 📋 **Secure document viewers** | Paste disabled | ✅ Bypasses restriction |
| 🏦 **Banking applications** | Clipboard locked | ✅ Simulates keyboard |
| 🎮 **Game chat/consoles** | No paste support | ✅ Types anything |
| 🔐 **Citrix/VDI environments** | Paste restricted | ✅ Human-like input |
| 📱 **Legacy applications** | No clipboard API | ✅ Keyboard simulation |

### **How It Bypasses Restrictions:**
```
Traditional Copy-Paste:
[Copy Text] → [Clipboard] → [CTRL+V] → ❌ BLOCKED!

Typer.ps1 Method:
[Read Text] → [Simulate Keystrokes] → [Each Character] → ✅ ACCEPTED!
```

The application thinks a real human is typing because:
- ⌨️ Uses Windows SendKeys API (same as real keyboard)
- ⏱️ Human-like delay between keystrokes
- 🎲 Random timing variations
- ⚡ Natural pauses after punctuation

---

## 🔧 **INSTALLATION & SETUP**

### **Prerequisites:**
- 💻 Windows operating system (7/8/10/11)
- 🔧 PowerShell (pre-installed on all Windows versions)
- 👑 No admin rights required!

### **Step-by-Step Installation:**

#### **Method 1: Quick Setup (Recommended)**
```powershell
# 1. Download the script
# Save typer.ps1 to your desired folder (e.g., C:\Tools\ or Desktop)

# 2. Navigate to the script folder
cd C:\Path\To\Script

# 3. Run it!
powershell -ExecutionPolicy Bypass -File .\typer.ps1
```

#### **Method 2: Permanent Setup**
```powershell
# Create a dedicated folder
mkdir C:\AutoTyper
cd C:\AutoTyper

# Save typer.ps1 here

# Optional: Add to PATH for quick access
# Add this to your PowerShell profile:
Set-Alias typer "C:\AutoTyper\typer.ps1"
```

#### **Method 3: Portable Setup (USB Drive)**
```
1. Create folder "AutoTyper" on your USB drive
2. Copy typer.ps1 into it
3. Create shortcut with target:
   powershell -ExecutionPolicy Bypass -File "D:\AutoTyper\typer.ps1"
4. Use anywhere, any computer!
```

### **First-Time Setup Video (Text Version):**
```
Step 1: 📁 Create folder → "C:\AutoTyper"
Step 2: 💾 Save script → typer.ps1
Step 3: 🚀 Run command → powershell -ExecutionPolicy Bypass -File .\typer.ps1
Step 4: 📝 Edit file → input.txt appears, add your text
Step 5: 🎯 Target window → Click where to type
Step 6: ✨ Watch magic → Text types automatically!
```

---

## ✨ **FEATURES**

| Feature | Description | Benefit |
|---------|-------------|---------|
| 🚫📋 **Paste Bypass** | Types instead of pasting | Works where CTRL+V fails |
| 🧠 **Smart Capitalization** | Auto-capitalizes first letter | Professional looking output |
| 🎲 **Random Delays** | Human-like typing rhythm | Bypass bot detection |
| ⚡ **Punctuation Pause** | Extra delay after .,!? | Natural reading flow |
| 🔧 **Fully Configurable** | 7+ adjustable parameters | Perfect for any scenario |
| 🛡️ **Encoding Safe** | Cleans Unicode characters | No weird symbols |
| 📁 **Auto-Create File** | Creates input.txt if missing | Zero setup required |
| 🚦 **Safety First** | Cancels on first run | Prevents accidents |
| ⌨️ **Special Key Support** | Handles + ^ % ~ ( ) [ ] { } | Types ANYTHING |
| 📊 **Progress Tracking** | Live character counter | Know exactly where you are |

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

### **Example 1: Bypass Paste in Remote Desktop**
```powershell
# RDP often blocks CTRL+V - this types instead!
.\typer.ps1 -Text "Long password or text here" -InitialDelayMs 5000
```

### **Example 2: Fast Typing**
```powershell
# Type super fast (10ms between keys)
.\typer.ps1 -DelayMs 10 -InitialDelayMs 1000
```

### **Example 3: Human-Like Mode (Best for Bypassing)**
```powershell
# Random delays between 50-150ms, pause 400ms after punctuation
# Looks exactly like human typing!
.\typer.ps1 -Randomize -MinDelayMs 50 -MaxDelayMs 150 -PunctuationDelayMs 400
```

### **Example 4: Direct Text Input**
```powershell
# Type directly without creating input.txt
.\typer.ps1 -Text "Hello, this is a test message!"
```

### **Example 5: Long Presentation / Meeting**
```powershell
# Give yourself 10 seconds to switch windows
.\typer.ps1 -InitialDelayMs 10000 -Randomize -PunctuationDelayMs 500
```

### **Example 6: Command Injection (Advanced)**
```powershell
# Type a PowerShell command (note the escaped quotes)
.\typer.ps1 -Text 'Write-Host "Hello World" -ForegroundColor Green'
```

### **Example 7: Bypass Web Terminal Restrictions**
```powershell
# Many web-based terminals disable paste
# Create input.txt with your commands, then:
.\typer.ps1 -Randomize -DelayMs 30
```

---

## 🎮 **INTERACTIVE DEMO**

### **Scenario: Automating a Welcome Message in a Paste-Blocked App**

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
| 🚫 **Still can't paste** | You're not pasting! | Script TYPES, doesn't paste - that's the point! |
| 🎯 **Types in wrong window** | Focus lost | Increase `-InitialDelayMs` to give more time |

### **Pro Tips for Paste Bypass:**
- 💡 **Test first** with short text in Notepad to verify settings
- 🎯 **Use `-Randomize`** for most natural-looking input
- ⏱️ **Increase delays** for laggy remote connections
- 📝 **Break long texts** into multiple runs if needed
- 🛡️ **Some apps detect rapid typing** - slow it down!

### **Advanced Bypass Techniques:**
```powershell
# Super realistic typing (varies between 100-300ms)
.\typer.ps1 -Randomize -MinDelayMs 100 -MaxDelayMs 300 -PunctuationDelayMs 500

# Ultra slow for sensitive apps
.\typer.ps1 -DelayMs 200 -PunctuationDelayMs 800

# Fast but still human-like
.\typer.ps1 -Randomize -MinDelayMs 30 -MaxDelayMs 80
```

---

## 🏆 **REAL-WORLD USE CASES**

### **Where Users Have Successfully Used Typer.ps1:**

| Environment | Challenge | Solution |
|-------------|-----------|----------|
| 🏦 **Banking Systems** | No paste in secure fields | Types credentials safely |
| 💻 **VMware Horizon** | CTRL+V disabled | Human-like typing works |
| 🌐 **AWS Console** | Web-based terminal no paste | Types commands naturally |
| 📊 **Citrix Apps** | Clipboard restricted | Bypasses with keystrokes |
| 🎮 **Game Chat** | No paste support | Types messages anyway |
| 🔐 **Secure CRMs** | Paste disabled for security | Still inputs data |
| 📝 **Legacy Systems** | No clipboard API | Keyboard simulation works |

---

## 🤝 **CONTRIBUTING**

Love this script? Here's how you can help:

1. 🐛 **Report bugs** - Open an issue
2. 💡 **Suggest features** - Random word delays? Custom key mappings?
3. 🔧 **Submit PRs** - Make it even better
4. ⭐ **Star it** - Show some love
5. 📢 **Share it** - Tell your friends about paste bypass!

### **Planned Features:**
- [ ] Word-based random delays (not just character)
- [ ] Configurable hotkey to start typing
- [ ] Multiple text snippets support
- [ ] GUI configuration tool
- [ ] Macro recording mode
- [ ] Profile system for different apps

---

## 📜 **LICENSE**

Free as in beer! 🍺 Use it, modify it, share it. Just don't blame me if you accidentally type "rm -rf /" somewhere important!

---

<div align="center">

**Made with ❤️ for everyone tired of paste restrictions**

**"Why paste when you can type... automatically?"** 🤖

[⬆ Back to Top](#-readme)

</div>

---


*Happy Typing! 🎉*