on open location theURL
	set theAddress to text 1 thru -1 of theURL
	if theAddress starts with "mailto:" then set theAddress to text 8 thru -1 of theAddress
	tell application "Safari"
		activate
		open location "https://outlook.office.com/mail/deeplink/compose?to=" & theAddress
	end tell
end open location
