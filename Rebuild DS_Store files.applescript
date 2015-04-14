on run {input, parameters}
	
	repeat with i from 1 to number of (items of input)
		tell application "Finder"
			
			
			--After a sudden intterupt, if running the script again, there are already files that are updated. A Shell Script is slower than checking Finder comments.
			if comment of (POSIX file (POSIX path of (item i of input)) as alias) is equal to "" then
				
				
				set strOfCmts to do shell script "mdls -n kMDItemFinderComment " & quoted form of (POSIX path of (item i of input)) & ""
				
				--The Shell Script returns the comments in the below format:
				--	kMDItemFinderComment = "tag1 tag2 etc"
				
				--We have to retrieve only the 'pure' comment of the file.
				if strOfCmts is not equal to "kMDItemFinderComment = \"\"" and strOfCmts is not equal to "kMDItemFinderComment = (null)" then
					set lstOfCmts to my expl(strOfCmts, "\"")
					set strOfCmts to (item 2 of lstOfCmts) as text
					
					set comment of (POSIX file (POSIX path of (item i of input)) as alias) to strOfCmts
				end if
				
				
			end if
			
			
		end tell
	end repeat
	
	return input
end run


to expl(str, d)
	set ret to {}
	set _d to AppleScript's text item delimiters
	set AppleScript's text item delimiters to {d}
	set ret to every text item of str
	set AppleScript's text item delimiters to _d
	return ret
end expl
