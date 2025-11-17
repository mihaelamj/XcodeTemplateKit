#!/usr/bin/osascript

(*
Generate Project with Template Options

This script demonstrates how to interact with Xcode template options:
- Pop-up buttons (e.g., Interface: SwiftUI vs UIKit)
- Checkboxes (e.g., Include Tests)
- Radio buttons (e.g., Storage: None/CoreData/SwiftData)

USAGE:
    osascript GenerateWithOptions.scpt

This is an INTERACTIVE example that shows how to:
1. Pause at the options screen
2. Identify UI elements (popups, checkboxes)
3. Set their values programmatically
*)

on run
	log "🎯 Interactive Template Generation with Options"
	log "==============================================="
	log ""

	tell application "Xcode"
		activate
	end tell

	delay 2

	tell application "System Events"
		tell process "Xcode"
			-- Close welcome
			if exists window "Welcome to Xcode" then
				try
					click button 1 of window "Welcome to Xcode"
				on error
					keystroke "w" using command down
				end try
				delay 1
			end if

			-- Open new project
			log "Opening New Project dialog..."
			keystroke "n" using {command down, shift down}
			delay 3

			-- Wait for dialog
			repeat 10 times
				if exists sheet 1 of window 1 then
					exit repeat
				end if
				delay 0.5
			end repeat

			-- Now we're at template chooser
			-- Let's select "App" template
			log "Selecting App template..."

			-- Click Next to get to options
			click button "Next" of sheet 1 of window 1
			delay 2

			-- NOW WE'RE AT THE OPTIONS SCREEN!
			log ""
			log "=== OPTIONS SCREEN ==="
			log "Inspecting available options..."
			log ""

			set theSheet to sheet 1 of window 1

			-- Look for pop-up buttons
			try
				set popupButtons to pop up buttons of theSheet
				set popupCount to count of popupButtons

				log "Found " & popupCount & " pop-up button(s):"

				repeat with i from 1 to popupCount
					set popup to pop up button i of theSheet

					try
						set popupTitle to title of popup
						set popupValue to value of popup
						log "  Popup " & i & ": " & popupTitle & " = " & popupValue

						-- Get menu items
						try
							set menuItems to menu items of menu 1 of popup
							log "    Available options:"
							repeat with mi in menuItems
								try
									set miTitle to title of mi
									log "      - " & miTitle
								end try
							end repeat
						end try

					on error errMsg
						log "  Popup " & i & ": (could not read details)"
					end try
				end repeat
			on error errMsg
				log "Could not inspect pop-up buttons: " & errMsg
			end try

			log ""

			-- Look for checkboxes
			try
				set checkboxes to checkboxes of theSheet
				set checkboxCount to count of checkboxes

				log "Found " & checkboxCount & " checkbox(es):"

				repeat with i from 1 to checkboxCount
					set checkbox to checkbox i of theSheet

					try
						set cbTitle to title of checkbox
						set cbValue to value of checkbox
						set isChecked to (cbValue as integer) = 1
						log "  Checkbox " & i & ": " & cbTitle & " = " & (if isChecked then "CHECKED" else "unchecked")
					on error
						log "  Checkbox " & i & ": (could not read)"
					end try
				end repeat
			on error errMsg
				log "Could not inspect checkboxes: " & errMsg
			end try

			log ""

			-- Look for radio buttons
			try
				set radioButtons to radio buttons of theSheet
				set radioCount to count of radioButtons

				if radioCount > 0 then
					log "Found " & radioCount & " radio button(s):"

					repeat with i from 1 to radioCount
						set radio to radio button i of theSheet

						try
							set radioTitle to title of radio
							set radioValue to value of radio
							set isSelected to (radioValue as integer) = 1
							log "  Radio " & i & ": " & radioTitle & " = " & (if isSelected then "SELECTED" else "not selected")
						on error
							log "  Radio " & i & ": (could not read)"
						end try
					end repeat
				end if
			on error errMsg
				log "Could not inspect radio buttons: " & errMsg
			end try

			log ""
			log "=== END OPTIONS INSPECTION ==="
			log ""

			-- NOW LET'S DEMONSTRATE CHANGING OPTIONS

			log "DEMONSTRATION: Changing options programmatically"
			log ""

			-- Example 1: Change a popup button
			if (count of pop up buttons of theSheet) > 0 then
				log "Changing first pop-up button..."
				set firstPopup to pop up button 1 of theSheet

				try
					-- Click the popup to open menu
					click firstPopup
					delay 0.5

					-- Click second menu item
					set menuItems to menu items of menu 1 of firstPopup
					if (count of menuItems) > 1 then
						click menu item 2 of menu 1 of firstPopup
						delay 0.5
						log "✓ Changed popup to: " & (value of firstPopup)
					end if
				on error errMsg
					log "✗ Could not change popup: " & errMsg
				end try
			end if

			log ""

			-- Example 2: Toggle a checkbox
			if (count of checkboxes of theSheet) > 0 then
				log "Toggling first checkbox..."
				set firstCheckbox to checkbox 1 of theSheet

				try
					set originalValue to (value of firstCheckbox as integer) = 1
					click firstCheckbox
					delay 0.3
					set newValue to (value of firstCheckbox as integer) = 1
					log "✓ Checkbox changed: " & originalValue & " → " & newValue
				on error errMsg
					log "✗ Could not toggle checkbox: " & errMsg
				end try
			end if

			log ""
			log "=== OPTIONS DEMONSTRATED ==="
			log ""
			log "To complete project creation, we would:"
			log "1. Set all desired options"
			log "2. Click Next"
			log "3. Fill in project name"
			log "4. Choose save location"
			log "5. Click Create"
			log ""
			log "For now, canceling..."

			-- Cancel the dialog
			keystroke (ASCII character 27) -- ESC

			return "Demo complete - showed how to interact with options"

		end tell
	end tell
end run
