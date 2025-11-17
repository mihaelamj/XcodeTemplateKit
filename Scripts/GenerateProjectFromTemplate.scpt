(*
Xcode Project Generator from Template

Usage: osascript GenerateProjectFromTemplate.scpt <template-identifier> <project-name> <output-path>

Example:
osascript GenerateProjectFromTemplate.scpt "com.apple.dt.unit.multiPlatform.app" "MyTestApp" "~/Desktop/MyTestApp"
*)

on run argv
    if (count of argv) < 3 then
        display dialog "Usage: osascript GenerateProjectFromTemplate.scpt <template-identifier> <project-name> <output-path>"
        return
    end if

    set templateIdentifier to item 1 of argv
    set projectName to item 2 of argv
    set outputPath to item 3 of argv

    tell application "Xcode"
        activate
        delay 1
    end tell

    -- Use UI scripting to create new project
    tell application "System Events"
        tell process "Xcode"
            -- Open New Project dialog
            keystroke "n" using {command down, shift down}
            delay 2

            -- Note: This is a simplified version
            -- In practice, we'd need to navigate the template chooser
            -- which varies based on Xcode version and template location

            -- Click "Create" or "Next" buttons
            -- This requires careful UI element identification

        end tell
    end tell

    return "Project creation initiated for: " & projectName
end run
