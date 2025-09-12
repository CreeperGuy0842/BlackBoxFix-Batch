# 🖥️ Windows Black Box Fix (.bat)

This is a simple batch script that fixes the black box issue on Windows desktop icons by clearing the thumbnail cache and restarting Explorer.

## Features
- Auto-runs as Administrator (prompts if not elevated)  
- Kills and restarts `explorer.exe` safely  
- Deletes all thumbnail cache (`thumbs.db`) files (including subfolders)  
- Shows success or error messages depending on deletion results  

## Usage
1. Download the `.bat` file from this repository.  
2. Right-click → **Run as administrator** (if not auto-elevated).  
3. Wait until Explorer restarts.  
4. Black boxes on icons should now be gone.

##  Notes
- Some thumbnail files may be locked by Windows; the script will notify you if it couldn’t delete all of them.  
- Safe to run multiple times if needed.

## Warning
- If you accidentally closed the bat and you see a black screen (no desktop) just press WIN + R on your keyboard to open Run, Type "explorer.exe" and press OK and your desktop should go back.

Made for anyone tired of black boxes on desktop icons
