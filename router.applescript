-- Opens Outlook web's inbox in the browser that was frontmost when the link was clicked.
-- If no known browser is frontmost, falls back to browserApp (Safari).
-- Change browserApp to "Safari", "Google Chrome", "Firefox", "Microsoft Edge", "Brave Browser" or "Arc".
-- Change inboxURL if your Outlook account is not a personal Outlook one.

property browserApp : "Safari"
property inboxURL : "https://outlook.office.com/mail/"
property knownBrowsers : {"Safari", "Google Chrome", "Firefox", "Microsoft Edge", "Brave Browser", "Arc"}

on open location theURL
	set targetApp to browserApp
	tell application "System Events"
		set frontName to name of first application process whose frontmost is true
	end tell
	if knownBrowsers contains frontName then set targetApp to frontName
	tell application targetApp
		activate
		open location inboxURL
	end tell
end open location
