# User-defined Attributes
set destination to "http://www.keybr.com/#!practice"
set duration to 1000
set keydelay to 0.035

# Program Main
tell application "Safari"
	activate
	set currentTab to current tab of window 1
	set URL of its front document to destination
	set jsfunc to "document.getElementsByClassName(\"Fragment-item--cursor\")[0].innerHTML"
	display notification with title "Beginning type test" subtitle "Take your hands off the keyboard"
	delay 3
	tell its front document
		set tokey to do JavaScript jsfunc
		# This "until" command is here because I don't know if keybr actually finishes
		repeat duration times #until tokey = ""
			if (tokey = "␣") then
				tell application "System Events" to keystroke " "
			else
				tell application "System Events" to keystroke tokey
			end if
			delay keydelay
			set tokey to do JavaScript jsfunc
		end repeat
	end tell
end tell