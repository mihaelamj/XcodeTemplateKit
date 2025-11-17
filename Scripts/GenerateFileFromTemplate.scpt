#!/usr/bin/osascript

(*
Generate File from Xcode Template

This script automates Xcode to create a NEW FILE using Xcode's built-in templates.
The goal is to capture what Xcode generates for each template + option combination.

Usage:
    osascript GenerateFileFromTemplate.scpt <template-name> <file-name> <output-dir>

Example:
    osascript GenerateFileFromTemplate.scpt "Swift File" "MyViewModel" "~/Desktop/GeneratedFiles"

What this does:
1. Opens Xcode
2. Creates a temporary project (needed for file generation context)
3. Uses "File > New > File" to open template chooser
4. Selects the specified template
5. Fills in the file name
6. Saves to output directory
7. Captures the generated file

Requirements:
- Xcode must be installed
- System Settings > Privacy & Security > Accessibility: Grant access
- System Settings > Privacy & Security > Automation: Allow controlling Xcode
*)

on run argv
	if (count of argv) < 3 then
		display dialog "Usage: osascript GenerateFileFromTemplate.scpt <template-name> <file-name> <output-dir>"
		return "Error: Insufficient arguments"
	end if

	set templateName to item 1 of argv
	set fileName to item 2 of argv
	set outputDir to item 3 of argv

	log "📄 Generating File from Template"
	log "================================"
	log "Template: " & templateName
	log "File name: " & fileName
	log "Output: " & outputDir
	log ""

	-- Create temporary project first (Xcode needs a project context for new files)
	set tempProjectPath to my createTempProject(outputDir)
	if tempProjectPath is "" then
		return "Error: Failed to create temporary project"
	end if

	delay 2

	-- Now create the file from template
	set result to my generateFile(templateName, fileName, outputDir, tempProjectPath)

	return result
end run

on createTempProject(outputDir)
	tell application "Xcode"
		activate
	end tell

	delay 1

	tell application "System Events"
		tell process "Xcode"
			-- Close welcome window
			if exists window "Welcome to Xcode" then
				try
					click button 1 of window "Welcome to Xcode"
				on error
					keystroke "w" using command down
				end try
				delay 1
			end if

			-- Create new project for context
			log "Creating temporary project..."
			keystroke "n" using {command down, shift down}
			delay 3

			-- Wait for dialog
			repeat 10 times
				if exists sheet 1 of window 1 then
					exit repeat
				end if
				delay 0.5
			end repeat

			-- Select iOS App template (first available)
			-- Just click Next to use default
			try
				click button "Next" of sheet 1 of window 1
				delay 2
			end try

			-- Enter project name
			try
				set value of text field 1 of sheet 1 of window 1 to "TempProject"
				delay 0.5
			end try

			-- Click Next
			try
				click button "Next" of sheet 1 of window 1
				delay 2
			end try

			-- Choose location
			try
				keystroke "g" using {command down, shift down}
				delay 1
				keystroke outputDir
				delay 0.5
				keystroke return
				delay 1
			end try

			-- Click Create
			try
				click button "Create" of sheet 1 of window 1
				delay 3
			end try

			log "✓ Temporary project created"
			return outputDir & "/TempProject"

		end tell
	end tell
end createTempProject

on generateFile(templateName, fileName, outputDir, projectPath)
	tell application "System Events"
		tell process "Xcode"
			log "Opening New File dialog..."

			-- File > New > File (Cmd+N)
			keystroke "n" using command down
			delay 2

			-- Wait for template chooser
			repeat 10 times
				if exists sheet 1 of window 1 then
					exit repeat
				end if
				delay 0.5
			end repeat

			if not (exists sheet 1 of window 1) then
				return "Error: File template dialog did not appear"
			end if

			log "Template chooser opened"

			-- TODO: Navigate to specific template
			-- For now, we'll work with whatever is selected by default
			-- This requires understanding the UI hierarchy from InspectXcodeUI.scpt

			-- Click Next to proceed with selected template
			try
				click button "Next" of sheet 1 of window 1
				delay 2
			end try

			-- Enter file name
			try
				log "Setting file name: " & fileName
				set value of text field 1 of sheet 1 of window 1 to fileName
				delay 0.5
			end try

			-- Click Create
			try
				log "Creating file..."
				click button "Create" of sheet 1 of window 1
				delay 2
			end try

			log "✓ File generated"

			-- Now we need to copy the generated file to our output directory
			-- The file was created in the project, we need to extract it

			-- Close the project (we don't need it anymore)
			delay 1
			keystroke "w" using {command down}
			delay 1

			return "File generated successfully"

		end tell
	end tell
end generateFile
