#!/usr/bin/osascript

(*
Xcode UI Inspector

This script helps inspect Xcode's UI hierarchy to understand how to automate template selection.

Usage:
    osascript InspectXcodeUI.scpt

What it does:
1. Opens Xcode new project dialog
2. Prints the UI hierarchy
3. Helps us understand how to navigate and interact with template chooser

Requirements:
- System Settings > Privacy & Security > Accessibility: Grant access to Terminal/Script Editor
- System Settings > Privacy & Security > Automation: Allow controlling Xcode
*)

on run
	log "🔍 Xcode UI Inspector"
	log "====================="
	log ""

	-- Open Xcode
	tell application "Xcode"
		activate
	end tell

	delay 2

	tell application "System Events"
		tell process "Xcode"
			-- Close welcome window if present
			if exists window "Welcome to Xcode" then
				log "✓ Closing welcome window"
				try
					click button 1 of window "Welcome to Xcode"
				on error
					keystroke "w" using command down
				end try
				delay 1
			end if

			-- Open New Project dialog
			log "✓ Opening New Project dialog (Cmd+Shift+N)"
			keystroke "n" using {command down, shift down}
			delay 3

			-- Wait for dialog to appear
			repeat 10 times
				if exists sheet 1 of window 1 then
					log "✓ Dialog appeared"
					exit repeat
				end if
				delay 0.5
			end repeat

			if not (exists sheet 1 of window 1) then
				log "❌ Error: Dialog did not appear"
				return "Failed to open dialog"
			end if

			-- Inspect the dialog
			log ""
			log "📋 Dialog Structure:"
			log "==================="

			set theSheet to sheet 1 of window 1

			-- Get all UI elements
			log "Windows: " & (count of windows)
			log "Sheets in window 1: " & (count of sheets of window 1)

			-- Inspect sheet contents
			log ""
			log "Sheet 1 contents:"
			try
				set sheetElements to entire contents of theSheet
				log "  Total elements: " & (count of sheetElements)
			on error errMsg
				log "  Could not get entire contents: " & errMsg
			end try

			-- Look for specific elements
			log ""
			log "Looking for key elements:"

			-- Buttons
			try
				set buttonCount to count of buttons of theSheet
				log "  Buttons: " & buttonCount
				repeat with i from 1 to buttonCount
					try
						set btnName to name of button i of theSheet
						log "    Button " & i & ": " & btnName
					end try
				end repeat
			on error errMsg
				log "  Error getting buttons: " & errMsg
			end try

			-- Groups (template categories might be in groups)
			try
				set groupCount to count of groups of theSheet
				log "  Groups: " & groupCount
				if groupCount > 0 then
					log "    Inspecting first group..."
					set grp to group 1 of theSheet
					try
						set grpElements to UI elements of grp
						log "      Elements in group 1: " & (count of grpElements)
					end try
				end if
			on error errMsg
				log "  Error getting groups: " & errMsg
			end try

			-- Scroll areas (template list is likely in a scroll area)
			try
				set scrollCount to count of scroll areas of theSheet
				log "  Scroll areas: " & scrollCount
				if scrollCount > 0 then
					repeat with i from 1 to scrollCount
						log "    Scroll area " & i & ":"
						set scrollArea to scroll area i of theSheet
						try
							set scrollElements to UI elements of scrollArea
							log "      UI elements: " & (count of scrollElements)

							-- Look for outline (sidebar navigation)
							try
								set outlineCount to count of outlines of scrollArea
								if outlineCount > 0 then
									log "      Outlines: " & outlineCount
									set outline1 to outline 1 of scrollArea
									try
										set outlineRows to rows of outline1
										log "        Rows in outline: " & (count of outlineRows)

										-- Show first few rows
										repeat with j from 1 to (count of outlineRows)
											if j > 5 then exit repeat
											try
												set rowText to value of static text 1 of UI element 1 of row j of outline1
												log "          Row " & j & ": " & rowText
											on error
												log "          Row " & j & ": (could not read)"
											end try
										end repeat
									end try
								end if
							end try

							-- Look for table (template grid)
							try
								set tableCount to count of tables of scrollArea
								if tableCount > 0 then
									log "      Tables: " & tableCount
									set table1 to table 1 of scrollArea
									try
										set tableRows to rows of table1
										log "        Rows in table: " & (count of tableRows)

										-- Show first few rows
										repeat with j from 1 to (count of tableRows)
											if j > 3 then exit repeat
											try
												set rowInfo to value of row j of table1
												log "          Row " & j & ": " & rowInfo
											on error
												log "          Row " & j & ": (could not read)"
											end try
										end repeat
									end try
								end if
							end try

						end try
					end repeat
				end if
			on error errMsg
				log "  Error getting scroll areas: " & errMsg
			end try

			-- Text fields (for project name input)
			try
				set textFieldCount to count of text fields of theSheet
				log "  Text fields: " & textFieldCount
				repeat with i from 1 to textFieldCount
					try
						set txtValue to value of text field i of theSheet
						log "    Text field " & i & ": " & txtValue
					on error
						log "    Text field " & i & ": (could not read)"
					end try
				end repeat
			on error errMsg
				log "  Error getting text fields: " & errMsg
			end try

			log ""
			log "✓ Inspection complete"
			log ""
			log "💡 Next step: Use this information to build navigation functions"

			-- Close the dialog
			log "Closing dialog (pressing Escape)..."
			keystroke (ASCII character 27) -- ESC key
			delay 1

		end tell
	end tell

	return "Inspection complete"
end run
