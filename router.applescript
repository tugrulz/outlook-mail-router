-- Opens Outlook web's inbox in the browser that was in front when the link was clicked.
-- If no supported browser is found, falls back to browserApp.
-- Change browserApp to "Safari", "Google Chrome", "Firefox", "Microsoft Edge", "Brave Browser" or "Arc".
-- Change inboxURL if your Outlook account is not a personal Outlook one.

property browserApp : "Safari"
property inboxURL : "https://outlook.office.com/mail/"

on browserBehindRouter()
	-- The router itself is in front when it is launched, so take the first browser in the
	-- front-to-back list of visible apps.
	return do shell script "lsappinfo visibleprocesslist | tr ':' '\\n' | grep -o '\"[^\"]*\"' | tr -d '\"' | grep -x -m1 -E 'Safari|Google_Chrome|Firefox|Microsoft_Edge|Brave_Browser|Arc' | tr '_' ' '"
end browserBehindRouter

on open location theURL
	set targetApp to browserApp
	try
		set targetApp to my browserBehindRouter()
	end try
	tell application targetApp
		activate
		open location inboxURL
	end tell
end open location
