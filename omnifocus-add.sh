#!/bin/bash

# Author:   Matt Might
# Site:     http://matt.might.net/

# Note: I figured out how to interact with OmniFocus via Applescript
# from the OmniFocusCLI script by Don Southard:

#  https://github.com/binaryghost/OmniFocusCLI

function usage {
  echo "usage: $0 [ -n ] <task-description>"
  echo "  where:"
  echo "  -n reads note text from stdin" 
  exit 1
}

if [ -z "$*" ]; then
  usage 
fi

if [ "$1" == "-n" ]; then

  # Grab the body from stdin:
  body="$(cat)"

  # Escape the body to make it safe for AppleScript:
  body="${body//\\/\\\\}"
  body="${body//\"/\\\"}"

  shift # kill the -n
fi


# Grab the task from the remaining arguments:
task="$*"


# Escape the task to make it safe for AppleScript:
task="${task//\\/\\\\}"
task="${task//\"/\\\"}"


# Prepare the task properties for AppleScript:
if [ -z "$body" ]; then
  properties="{name: \"$task\"}"
else
  properties="{name: \"$task\", note: \"$body\"}"
fi


# Run embedded AppleScript to add task:
osascript <<EOF

tell application "System Events"
  count (every process whose name is "OmniFocus")
  if result < 1 then
    tell application "OmniFocus" to activate
  end if
end tell

tell front document of application "OmniFocus"
  make new inbox task with properties $properties 
end tell

EOF
