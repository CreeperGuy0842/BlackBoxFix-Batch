# Windows Black Box Fix (.bat)

This is a simple batch script that fixes the black box issue on Windows desktop icons by clearing the thumbnail cache and restarting Explorer.

## Features
- Auto-runs as Administrator (prompts if not elevated)  
- Kills and restarts `explorer.exe` safely  
- Deletes all thumbnail cache (`iconcache*.db`) files (including subfolders)
- Shows success or error messages depending on deletion results  

## Usage
- Download the .bat file [here](https://github.com/CreeperGuy0842/BlackBoxFix-Batch/releases).
- Right-click → Run as administrator (if not auto-elevated).
- Wait until Explorer restarts.
- Black boxes on icons should now be gone.

##  Notes
- Some thumbnail files may be locked by Windows; the script will notify you if it couldn’t delete all of them.  
- Safe to run multiple times if needed.
- Two options are provided: Admin and User versions.
  - `Admin` version is recommended.
  - `User` version may not work reliably.
- If you accidentally close the batch file and see a black screen (no desktop):
  - Press WIN + R
  - Type explorer.exe
  - Hit OK — your desktop will return.
- These thumbnail files are safe to delete, located at
`C:\Users\<YourUsername>\AppData\Local\Microsoft\Windows\Explorer`
