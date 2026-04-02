# babelfi.sh
_Telecommunication across the universe_

This is a simple bash thingy intended for use in 42 clusters as a form of
telecommunication. if sourced in your `~/.bashrc`, `~/.zshrc` it will create and
maintain a bash mail server thingy mabobber

# interface
## porcelain
`babel <recipient> <subject>`
babel writes the contents of stdin into a file `$MAILBOX/<recipient>/<subject>`
`babelsearch`
returns all available user mailboxes
`babelseat <seat>`
checks who was last seated at a spot in the cluster
`announcePresence [username]`
announces to the special mailbox `present` that you (or provided username) are
present at your computer
`removePresence`
removes your presence file

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


# user instantiation
append `. /sgoinfre/babelfi.sh` to your rc file
if you want to opt in to presence announcement, append
```sh
whoami >/sgoinfre/mailbox/present/$(hostname -s)
```
to your `.profile` to announce your presence whenever you log in

# network installation
```sh
cd /sgoinfre
git clone github.com/BeerB34r/babelfi.sh babelfish
mkdir --mode=777 babelfish/present
ln -s `realpath babelfish/babelfi.sh` babelfi.sh
```
