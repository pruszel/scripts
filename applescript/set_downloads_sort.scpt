tell application "Finder"
    activate
    open folder "Downloads" of home
    tell folder "Downloads" of home
        set current view to list view
        tell its window
            set current view to list view
            set sort column of list view options to column "Date Added"
        end tell
    end tell
end tell
