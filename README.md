# Outlook Mail Router

A small macOS app that opens `mailto:` links in Safari's Outlook web client instead of Apple Mail.

## Setup

1. Compile the script into an app:
   ```bash
   mkdir -p ~/Applications
   osacompile -o "$HOME/Applications/Outlook Mail Router.app" router.applescript
   ```
2. Register `mailto` in the app's `Contents/Info.plist` (`CFBundleURLTypes` with scheme `mailto`) and set a `CFBundleIdentifier`.
3. Register it with Launch Services:
   ```bash
   /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "$HOME/Applications/Outlook Mail Router.app"
   ```
4. Make it the default: System Settings → Desktop & Dock → Default email reader.

The Outlook compose URL in `router.applescript` may need changing for work, university, or personal accounts.
