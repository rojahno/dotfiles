-- Define logMessages as a global variable
global logMessages
set logMessages to "" -- Initialize a string to collect log messages

-- Function to log messages to the log string
on logMessage(message)
    global logMessages -- Declare logMessages as a global variable
    set logMessages to logMessages & (current date as string & ": " & message & return)
end logMessage

tell application "Notes" to quit
delay 0.5 -- Wait for the Notes application to close
logMessage("Closed the Notes application.")

tell application "System Events"
    -- Launch Mission Control to access Spaces
    tell application "Mission Control" to launch
    delay 0.5 -- Allow Mission Control to launch
    logMessage("Launched Mission Control.")

    tell process "Dock"
        -- Count the number of Spaces (groups)
        set spaceCount to count buttons of list 1 of group 2 of group 1 of group 1
        logMessage("Current Spaces: " & spaceCount)

        -- Remove all extra spaces, leaving only one space for each group
        repeat with i from spaceCount to 1 by -1
            if (i > 2) then
                click button i of list 1 of group 2 of group 1 of group 1 -- Click to select the space
                delay 0.1
                click button 2 of group 2 of group 1 of group 1 -- Click the "Delete" button
                delay 0.5
                logMessage("Removed Space: " & i)
            end if
        end repeat

        -- Count the remaining number of Spaces after cleanup
        set spaceCount to count buttons of list 1 of group 2 of group 1 of group 1
        logMessage("Remaining Spaces after cleanup: " & spaceCount)

        -- Create new spaces based on the number of groups
        if spaceCount = 1 then
            repeat 5 times -- Create 5 spaces if there is 1 group
                click button 1 of group 2 of group 1 of group 1 -- Click the "+" button to add a space
                delay 0.5
                logMessage("Created new Space. Total Spaces: " & (spaceCount + 1))
            end repeat
        else if spaceCount = 2 then
            -- Create 3 spaces in total for group 1
            repeat 3 times
                click button 1 of group 2 of group 1 of group 1
                delay 0.5
                logMessage("Created new Space in Group 1. Total Spaces: " & (spaceCount + 1))
            end repeat
            -- Switch to group 2 to create 2 spaces
            click button 2 of list 1 of group 2 of group 1 of group 1
            delay 0.5
            repeat 2 times
                click button 1 of group 2 of group 1 of group 1
                delay 0.5
                logMessage("Created new Space in Group 2. Total Spaces: " & (spaceCount + 1))
            end repeat
        end if
        
        -- Launch Notes in group 2
        click button 2 of list 1 of group 2 of group 1 of group 1
        logMessage("Switched to Group 2 and launching Notes.")
    end tell
end tell

tell application "Notes" to launch
logMessage("Launched the Notes application.")

-- Print all log messages to the Terminal
do shell script "echo " & quoted form of logMessages

