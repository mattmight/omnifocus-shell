#!/bin/bash

# Author: Matt Might

# Site:   http://matt.might.net/

# Dependencies:  mu


# This script imports a Maildir message and stdin into OmniFocus.

# Its intended use case is to receive messages piped in from mutt.


# Copy stdin to a file:
cat > /tmp/tmp-mail

# Extract the subject:
subject="$(grep '^Subject:' /tmp/tmp-mail | sed -e 's/^Subject://')"

# Extract the message body and send to omnifocus:
mu view /tmp/tmp-mail | of-add -n "$subject" 

# Remove the temporary file
rm -f /tmp/tmp-mail



