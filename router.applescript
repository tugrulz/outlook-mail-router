-- Opens a mailto: link in a web mail app.
-- provider:
--   "auto"    (default) Gmail for @gmail.com and @googlemail.com addresses, Outlook for everything else
--   "gmail"   always Gmail (compose window with the address filled in)
--   "outlook" always Outlook (inbox)
-- The browser is the one that was in front when the link was clicked, or browserApp if none is found.
-- Change browserApp to "Safari", "Google Chrome", "Firefox", "Microsoft Edge", "Brave Browser" or "Arc".
-- Change outlookInboxURL if your Outlook account is not a personal Outlook one.

property provider : "auto"
property browserApp : "Safari"
property outlookInboxURL : "https://outlook.office.com/mail/"
property gmailComposeURL : "https://mail.google.com/mail/?view=cm&fs=1&to="

on browserBehindRouter()
	-- The router itself is in front when it is launched, so take the first browser in the
	-- front-to-back list of visible apps.
	return do shell script "lsappinfo visibleprocesslist | tr ':' '\\n' | grep -o '\"[^\"]*\"' | tr -d '\"' | grep -x -m1 -E 'Safari|Google_Chrome|Firefox|Microsoft_Edge|Brave_Browser|Arc' | tr '_' ' '"
end browserBehindRouter

on addressFrom(theURL)
	-- Strip the mailto: scheme and any ?subject=... part, and lowercase the address.
	return do shell script "printf %s " & quoted form of theURL & " | sed -E 's/^mailto://I; s/\\?.*$//' | tr A-Z a-z"
end addressFrom

on targetURLFor(addr)
	if provider is "gmail" then return gmailComposeURL & addr
	if provider is "outlook" then return outlookInboxURL
	-- "auto"
	if addr ends with "@gmail.com" or addr ends with "@googlemail.com" then return gmailComposeURL & addr
	return outlookInboxURL
end targetURLFor

on open location theURL
	set targetApp to browserApp
	try
		set targetApp to my browserBehindRouter()
	end try
	set targetURL to my targetURLFor(my addressFrom(theURL))
	tell application targetApp
		activate
		open location targetURL
	end tell
end open location
