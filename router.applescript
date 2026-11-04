-- Opens mailto: links in Outlook web, using the browser chosen below.
-- Change browserApp to one of: "Safari" (default), "Google Chrome",
-- "Firefox", "Microsoft Edge", "Brave Browser", "Arc".
-- Change composeURL if your Outlook account is not a personal Outlook one.

property browserApp : "Safari"
property composeURL : "https://outlook.office.com/mail/deeplink/compose?to="

on open location theURL
	set theAddress to text 1 thru -1 of theURL
	if theAddress starts with "mailto:" then set theAddress to text 8 thru -1 of theAddress
	tell application browserApp
		activate
		open location composeURL & theAddress
	end tell
end open location
