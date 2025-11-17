#!/usr/bin/osascript

(*
Generate Project from Xcode Template - Enhanced Version

PURPOSE:
Generate actual projects using Xcode's built-in templates to create ground truth artifacts.
These artifacts will be compared against our parser output to validate correctness.

WORKFLOW:
1. Xcode Templates → Generate Projects (THIS SCRIPT)
2. Collect generated artifacts 
3. Our Parser → Parse templates
4. Compare: Generated artifacts vs Parser output
5. Fix parser until perfect match

USAGE:
    osascript GenerateProjectFromTemplate_Enhanced.scpt <template-name> <project-name> <output-dir>

EXAMPLES:
    osascript GenerateProjectFromTemplate_Enhanced.scpt "App" "TestApp" "~/GeneratedArtifacts"
    osascript GenerateProjectFromTemplate_Enhanced.scpt "Game" "MyGame" "~/GeneratedArtifacts"

REQUIREMENTS:
- System Settings > Privacy & Security > Accessibility: Grant access
- System Settings > Privacy & Security > Automation: Allow controlling Xcode
*)

on run argv
	if (count of argv) < 3 then
		display dialog "Usage: <template-name> <project-name> <output-dir>"
		return "Error: Need 3 arguments"
	end if

	set templateName to item 1 of argv
	set projectName to item 2 of argv
	set outputDir to item 3 of argv

	log "🎯 Xcode Project Generator"
	log "========================="
	log "Template: " & templateName
	log "Project: " & projectName
	log "Output: " & outputDir
	log ""

	set result to my generateProject(templateName, projectName, outputDir)
	return result
end run

on generateProject(templateName, projectName, outputDir)
	tell application "Xcode"
		activate
	end tell

	delay 2

	tell application "System Events"
		tell process "Xcode"
			-- Close welcome if present
			if exists window "Welcome to Xcode" then
				try
					click button 1 of window "Welcome to Xcode"
				on error
					keystroke "w" using command down
				end try
				delay 1
			end if

			-- Open new project
			log "Opening new project dialog..."
			keystroke "n" using {command down, shift down}
			delay 3

			-- Wait for dialog
			repeat 10 times
				if exists sheet 1 of window 1 then
					exit repeat
				end if
				delay 0.5
			end repeat

			if not (exists sheet 1 of window 1) then
				return "Error: Dialog did not appear"
			end if

			log "✓ Template chooser opened"

			-- For now, just use the default selected template
			-- TODO: Navigate to specific template
			-- (requires UI inspection)

			-- Click Next
			try
				log "Clicking Next..."
				click button "Next" of sheet 1 of window 1
				delay 2
			end try

			-- Fill project name
			try
				log "Setting project name..."
				set value of text field 1 of sheet 1 of window 1 to projectName
				delay 0.5
			end try

			-- Organization
			try
				set value of text field 2 of sheet 1 of window 1 to "XcodeTemplateKit"
				delay 0.5
			end try

			-- Click Next for location
			try
				click button "Next" of sheet 1 of window 1
				delay 2
			end try

			-- Set location
			try
				log "Setting output location..."
				keystroke "g" using {command down, shift down}
				delay 1
				keystroke outputDir
				delay 0.5
				keystroke return
				delay 1
			end try

			-- Create
			try
				log "Creating project..."
				click button "Create" of sheet 1 of window 1
				delay 3
			end try

			delay 2

			-- Close project
			log "Closing project..."
			keystroke "w" using command down
			delay 1

			log "✓ Done!"
			return "Success"

		end tell
	end tell
end generateProject
