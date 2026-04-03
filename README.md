# babelfi.sh
_Telecommunication across the universe_

This is a simple bash thingy intended for use in 42 clusters as a form of
telecommunication. if sourced in your `~/.bashrc`, `~/.zshrc` it will create and
maintain a bash mail server thingy mabobber

# user instantiation
run the following command to install babelfish into your shell configuration:
```sh
sh /sgoinfre/babelfish/install.sh
```

if you want to opt in to presence announcement, run:
```sh
sh /sgoinfre/babelfish/optinPresence.sh
```

# network installation
if babelfish isnt installed in your cluster, you can install it as follows:
```sh
cd /sgoinfre
git clone github.com/BeerB34r/babelfi.sh babelfish
mkdir --mode=777 babelfish/present
ln -s `realpath babelfish/babelfi.sh` babelfi.sh
```

# interface
## porcelain
`bbl`
wraps all other babelfish commands into one, to see all available options, run
`bbl list`

`bbl send <recipient> <subject>` || `babel <recipient> <subject>`
sends a message from stdin to the recipient with the subjectline subject.

`bbl search` || `babelsearch`
shows a list of all available mailboxes

`bbl seat <seat>` || `babelseat <seat>`
shows whoever was seated at a specific location last

`bbl announce [username]` || `announcePresence [username]`
announces your presence to the babelfish

`bbl leave` || `removePresence`
announce your departure to the babelfish

`bbl backlog` || `babelbacklog`
displays any and all mails the babelfish failed to notice you of

`bbl groupchat [recipients...]` || `babelgroupchat [recipients...]`
send a message to all recipients, the subject line inform them of the group
communication

## options
> [!INFO]
> all options take the form of environment variables

`FRIENDS` acts as an interest list for the special mailbox `present`. whenever
a user matching a name in your `FRIENDS` variable announces their presence you
will get a notification. the `FRIENDS` variable is used internally as a regular
expression, if you dont know what that means, simply format `FRIENDS` as
follows: `username1|username2|username3`

default: `""`

`BABEL_RM` determines wether or not a piece of mail you have been notified of
should be removed.

possible values: 
    - deleting: `"yes"`, `""`
    - keeping: `".*"`

default: `""`



