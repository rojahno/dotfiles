do shell script "open -a 'Mission Control'"
delay 0.5
tell application "System Events" to ¬
    click (every button whose value of attribute "AXDescription" is "add desktop") ¬
        of UI element "Spaces Bar" of UI element 1 of group 1 of process "Dock"
delay 0.5
do shell script "open -a 'Mission Control'"
