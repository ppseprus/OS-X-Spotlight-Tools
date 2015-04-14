# OS X Spotlight Tools


I use Spotlight Comments to tag my files; the tags are separated with whitespaces and each of them start with the ```&``` symbole. Something like this: ```&tag1 &tag2 &tag3```

I've been tagging my files for a few years now; moving from one drive to another. And from time to time, I end up messing up something. That's why, through out the years, I created a set of scripts to maintain order. I want to share them with You!


### The ```.DS_Store``` issue

Every once in a while, you have to delete some (or all) of your ```.DS_Store``` files for whatever reasons. But it could make your life with Finder Comments frustrating.

When you append a comment to a file, it is saved both in

1. the Extended File Attributes and in
2. the ```.DS_Store``` files.

Finder only reads the latter one and once those files are gone, there is no built-in trick that would rebuild them for you. You might be able to still search for the files with Spotlight, but appending another tag would overwrite any previous one.

The solution is to create an empty workflow in OS X's Automator and follow the below steps

1. add a ```Get Selected Finder Items``` box
2. drag & drop the files and folder you'd like to 'update'
3. add a ```Run AppleScript``` box
4. copy the contents of ```Rebuild DS_Store.applescript``` into the ```Run AppleScript``` box
5. run the workflow

This might take a while.


### To be continued..
