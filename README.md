# babelfi.sh
_Telecommunication across the universe_

This is a simple bash thingy intended for use in 42 clusters as a form of
telecommunication. if sourced in your `~/.bashrc`, `~/.zshrc` it will create and
maintain a bash mail server thingy mabobber

# interface
## porcelain
`babel <recipient> <subject>`
babel writes the contents of stdin into a file `$MAILBOX/<recipient>/<subject>`
`announcePresence [username]`
announces to the special mailbox `present` that you (or provided username) are
present at your computer

the environment variable `FRIENDS` acts as an interest list for the special
mailbox `present`. whenever a user matching a name in your `FRIENDS` variable
announces their presence you will get a notification

# user instantiation
append `. /sgoinfre/babelfi.sh` to your rc file

# network installation
```sh
cd /sgoinfre
git clone github.com/BeerB34r/babelfi.sh babelfish
mkdir --mode=777 babelfish/present
ln -s `realpath babelfish/babelfi.sh` babelfi.sh
```
