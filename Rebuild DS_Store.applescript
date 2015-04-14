on run {input, parameters}
	
	repeat with i from 1 to number of (items of input)
		tell application "Finder"
			--After a sudden intterupt, if running the script again, there are already files that are updated
			--A Shell Script is slower than checking Finder comments
			if comment of (POSIX file (POSIX path of (item i of input)) as alias) is equal to "" then
				
				
				--The below shell script returns the comments in the following format:
				--	kMDItemFinderComment = "all the tags you added"
				
				--With regular expressions, we remove the unwanted strings from around the comment
				set strOfCmts to do shell script "mdls -n kMDItemFinderComment " & quoted form of (POSIX path of (item i of input)) & " | sed -e 's/kMDItemFinderComment = //g' | sed -e 's/\"//g'"
				
				--Set Finder comments
				set comment of (POSIX file (POSIX path of (item i of input)) as alias) to strOfCmts
				
				
			end if
		end tell
	end repeat
	
	return input
end run
