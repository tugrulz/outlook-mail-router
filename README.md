# Outlook Mail Router

A small macOS app that opens `mailto:` links in Outlook web instead of Apple Mail.

It opens the Outlook inbox in the browser that was frontmost when you clicked the link. If no supported browser is in front, it uses `browserApp`, which is Safari by default. To change the fallback, set `browserApp` in `router.applescript` to one of:

- `"Safari"` (default)
- `"Google Chrome"`
- `"Firefox"`
- `"Microsoft Edge"`
- `"Brave Browser"`
- `"Arc"`

Change `inboxURL` if your Outlook account is not a personal Outlook one.

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
