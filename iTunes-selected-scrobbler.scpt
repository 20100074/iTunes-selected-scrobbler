
set text item delimiters to " - "
tell application "iTunes"
	--set _playlist to "ミュージック"
	-- get {played date} of every tracks of playlist named _playlist
	-- get {id, played date} of every tracks of playlist named _playlist
	--
	--
	if selection = {} then
    display dialog "No tracks selected." buttons {"Cancel"} default button 1 with icon 1
	end if

	set tracklist to selection

	repeat with i from 1 to count of tracklist
		set _artist to (artist of item i of tracklist)
		set _songname to (name of item i of tracklist)
		set _album to (album of item i of tracklist)
		set _lastplayed to (played date of item i of tracklist as string)
		set __lastplayed to do shell script "/Users/reishoku/.local/bin/convert-date.fish " & quoted form of _lastplayed

		-- POST to last.fm
		-- /opt/homebrew/bin/scrobbler scrobble --album "$ALBUM" reishoku "$ARTIST" "$SONG" $DATE
		log _artist
		log _songname
		log _album
		log __lastplayed
		do shell script "/opt/homebrew/bin/scrobbler scrobble --album " & quoted form of _album & " reishoku " & quoted form of _artist & " " & quoted form of _songname & " " & quoted form of __lastplayed
	end repeat

end tell
