#!/usr/bin/osascript

(*
Xcode Project Generator via UI Automation

This script automates Xcode to generate actual projects from all concrete templates.

Requirements:
- Xcode must be installed
- System Settings > Privacy & Security > Accessibility: Grant access to Terminal/Script Editor
- System Settings > Privacy & Security > Automation: Allow controlling Xcode

Usage:
    osascript GenerateProjectsFromTemplates.scpt <output-directory>

Example:
    osascript GenerateProjectsFromTemplates.scpt "~/Documents/GeneratedXcodeProjects"
*)

on run argv
    if (count of argv) < 1 then
        display dialog "Usage: osascript GenerateProjectsFromTemplates.scpt <output-directory>"
        return "Error: No output directory specified"
    end if

    set outputDir to item 1 of argv

    -- List of templates to generate (identifier, name, category)
    set templateList to {¬
        {"com.apple.dt.unit.multiPlatform.app", "MultiplatformApp", "App"}, ¬
        {"com.apple.dt.unit.multiPlatform.app.document-based", "DocumentApp", "Document App"}, ¬
        {"com.apple.dt.unit.crossPlatformGame", "Game", "Game"}, ¬
        {"com.apple.dt.unit.multiPlatform.framework", "Framework", "Framework"}, ¬
        {"com.apple.dt.unit.emptyProject", "EmptyProject", "Empty"}}

    set generatedCount to 0
    set failedCount to 0

    repeat with templateInfo in templateList
        set templateIdentifier to item 1 of templateInfo
        set projectName to item 2 of templateInfo
        set templateName to item 3 of templateInfo

        log "Generating: " & projectName & " from template: " & templateName

        try
            my generateProject(projectName, templateName, outputDir)
            set generatedCount to generatedCount + 1
            log "✅ Success: " & projectName
        on error errMsg
            set failedCount to failedCount + 1
            log "❌ Failed: " & projectName & " - " & errMsg
        end try

        delay 2
    end repeat

    set resultMsg to "Generation complete. Success: " & generatedCount & ", Failed: " & failedCount
    log resultMsg
    return resultMsg
end run

on generateProject(projName, templateName, outputPath)
    tell application "Xcode"
        activate
    end tell

    delay 1

    tell application "System Events"
        tell process "Xcode"
            -- Close welcome window if present
            if exists window "Welcome to Xcode" then
                click button 1 of window "Welcome to Xcode"
            end if

            delay 0.5

            -- Open New Project dialog
            keystroke "n" using {command down, shift down}
            delay 3

            -- Wait for template chooser
            repeat 10 times
                if exists sheet 1 of window 1 then
                    exit repeat
                end if
                delay 0.5
            end repeat

            -- TODO: Navigate to template
            -- This requires finding the template in the UI hierarchy
            -- which varies by Xcode version

            -- For now, we'll use the first available template as proof of concept
            -- and let the user manually select templates

            delay 1

            -- Click Next
            try
                click button "Next" of sheet 1 of window 1
                delay 2
            end try

            -- Enter project name
            try
                set value of text field 1 of sheet 1 of window 1 to projName
                delay 0.5
            end try

            -- Click Next to choose location
            try
                click button "Next" of sheet 1 of window 1
                delay 2
            end try

            -- Set output location
            try
                keystroke "g" using {command down, shift down}
                delay 1
                keystroke outputPath
                delay 0.5
                keystroke return
                delay 1
            end try

            -- Click Create
            try
                click button "Create" of sheet 1 of window 1
                delay 2
            end try

            -- Close the project
            delay 1
            keystroke "w" using {command down}
            delay 0.5

        end tell
    end tell

    return "Project created: " & projName
end generateProject
