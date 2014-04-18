Author: Matt Might

Site: http://matt.might.net/


omnifocus-shell
===============

The omnifocus-shell package provides shell tools for interacting with
OmniFocus from the command line.

At the moment, only adding tasks is supported.

Under the hood, it uses AppleScript to add the task.

(The databases for OmniFocus are stored as a sqlite3 file, so it should
be possible to query that database from the command line as well.)


Installation
------------

To install the scripts into `$HOME/bin`

   make install


`omnifocus-add.sh` / `of-add`
-----------------------------

The script `omnifocus-add.sh` adds a task to OmniFocus.

It installs by default as `of-add` to `$HOME/bin`.

You can specify a note on `stdin` by using the `-n` flag:

    # Add a task to the inbox:
    of-add Clean the carpet

    # Add a task with minutes.txt as note text:
    of-add -n Post minutes < minutes.txt  


`omnifocus-import-mail.sh` / `of-import-mail`
---------------------------------------------

The script `omnifocus-import-mail.sh` takes a Maildir message on
stdin and adds it as a task to the OmniFocus inbox.

It installs by default as `of-import-mail` to `$HOME/bin`.

The intended use case is piping a message in from `mutt`.

Once installed, you can add this to your `muttrc` file:

    macro index,pager \ci "|of-import-mail<enter>" "Import this message into OmniFocus."

`Ctrl-i` will then import a message into the OmniFocus inbox.
