# First move your current Atom to a .bin so we don't disturb it
system 'mv /Applications/Atom.app/Contents/MacOS/Atom /Applications/Atom.app/Contents/MacOS/Atom.bin'

# Create a new one and start writing to it
f = File.new('/Applications/Atom.app/Contents/MacOS/Atom', 'w')

f << "#!/bin/bash -l\n"
f << "`dirname $0`/Atom.bin $@"

system "chmod +x /Applications/Atom.app/Contents/MacOS/Atom"

# Now remove the one you just created and move the old one back.
#system "rm /Applications/Atom.app/Contents/MacOS/Atom"
#system "mv /Applications/Atom.app/Contents/MacOS/Atom.bin /Applications/Atom.app/Contents/MacOS/Atom"
