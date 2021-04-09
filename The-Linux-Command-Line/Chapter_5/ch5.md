# Chapter 5

- `type`    — Indicate how a command name is interpreted.
- `which`   — Display which executable program will be executed.
- `man`     — Display a command’s manual page.
- `apropos` — Display a list of appropriate commands.
- `info`    — Display a command’s info entry.
- `whatis`  — Display a very brief description of a command.
- `alias`   — Create an alias for a command.

## A command can be one of four things

1. **An executable program** like all those files we saw in `/usr/bin`. Within this
category, programs can be compiled binaries, such as programs written in
C and C++, or programs written in scripting languages, such as the shell,
Perl, Python, Ruby, and so on.

2. **A command built into the shell itself**. bash supports a number of commands internally called shell builtins. The `cd` command, for example, is a
shell builtin.

3. **A shell function**. Shell functions are miniature shell scripts incorporated
into the environment.

4. **An alias**. An alias is a command that we can define ourselves, built from
other commands.

## Identifying Commands

It is often useful to know exactly which of the four kinds of commands is
being used, and Linux provides a couple of ways to find out.

### type

It displays the kind of command the shell will execute, given a particular command name.

`$ type command`

```bash
himanshu in ~: type type
type is a shell builtin
himanshu in ~: type ls
ls is aliased to 'ls --color=auto'
himanshu in ~: type cp
cp is /usr/bin/cp
```

### which

Display an Executable’s Location. Sometimes more than one version of an executable program is installed on a system. To determine the exact location of a given executable, the `which` command is used. `which` works only for executable programs, not builtins or aliases that are substitutes for actual executable programs.

```bash
himanshu in ~: which ls
/usr/bin/ls
himanshu in ~: which cat
/usr/bin/cat
himanshu in ~: which cd
himanshu in ~: 
```

command `ls` and `cat` have binaries thus we got their path while `cd` is a shell command not a binary.

## Getting a Command’s Documentation

### help

Get Help for Shell Builtins.

```bash
himanshu in ~: help cd
cd: cd [-L|[-P [-e]] [-@]] [dir]
    Change the shell working directory.
    
    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.
...

# same / alternate
himanshu in ~: cd --help
```

When square brackets appear in the description of a command’s syntax, they indicate optional items. A **vertical bar** `|` character indicates mutually exclusive items. An example is the `cd` command above:  

`cd [-L|-P] [dir]`

This notation says that the command `cd` may be followed optionally by either a -L or a -P and further, optionally followed by the argument `dir`.

### man

Display a **Program’s Manual Page**. Most executable programs intended for command-line use provide a formal piece of documentation called a manual or man page. A special paging program called `man` is used to view them.  
`man program`  

```bash
himanshu in ~: man ls
```

press q to quit.

### apropos

Display Appropriate Commands. It is also possible to search the list of man pages for possible matches based on a search term. Though crude, this approach is sometimes helpful.

```bash
himanshu in ~: apropos ssh
authorized_keys (5)  - OpenSSH daemon
git-shell (1)        - Restricted login shell for Git-only SSH access
rcp (1)              - OpenSSH secure file copy
rlogin (1)           - OpenSSH remote login client
rsh (1)              - OpenSSH remote login client
scp (1)              - OpenSSH secure file copy
sftp (1)             - OpenSSH secure file transfer
sftp-server (8)      - OpenSSH SFTP server subsystem
slogin (1)           - OpenSSH remote login client
ssh (1)              - OpenSSH remote login client
ssh-agent (1)        - OpenSSH authentication agent
ssh-argv0 (1)        - replaces the old ssh command-name as hostname handling
ssh-keygen (1)       - OpenSSH authentication key utility
ssh-keyscan (1)      - gather SSH public keys from servers
```

The first field in each line of output is the name of the man page, and
the second field shows the section

### whatis

The `whatis` program displays the name and a one-line description of a man
page matching a specified keyword.

```bash
himanshu in ~: whatis ls
ls (1)               - list directory contents
himanshu in ~: whatis cd
cd: nothing appropriate.
himanshu in ~: whatis cat
cat (1)              - concatenate files and print on the standard output
```

### info

Display a Program’s Info Entry.

```bash
himanshu in ~: info ls
```

## README and Other Program Documentation Files

Many software packages installed on your system have documentation files
residing in the `/usr/share/doc` directory. Most of these are stored in plaintext
format and can be viewed with `less`. Some of the files are in HTML format
and can be viewed with a web browser. We may encounter some files ending
with a `.gz` extension. This indicates that they have been compressed with the
gzip compression program. The gzip package includes a special version of
less called `zless`, which will display the contents of gzip-compressed text
files.

## Creating Your Own Commands with alias

 It’s possible to put more than one command on a line by separating each command with a semicolon character. It
works like this:  
`command1; command2; command3...`

```bash
himanshu in ~: cd /usr/; ls; cd ~
bin  games  include  lib  lib32  lib64  libexec  libx32  local  
pgadmin4  sbin  share  src
himanshu in ~: 
```

The first thing we have to do is dream up a name for our new command. Let’s try test. Before we do that, it would be a good idea to find out if the name test is already being used.

```bash
himanshu in ~: type test
test is a shell builtin
himanshu in ~: # name is already taken, let's try foo
himanshu in ~: type foo
bash: type: foo: not found
```

Define a new **alias** for that command.  

`alias name='string`  

After the command alias we give the alias a name followed immediately (no whitespace allowed) by an equal sign, which is followed immediately by a quoted string containing the meaning to be assigned to the name. Alias defined this way vanish when your shell session ends. To make them permanent we need to define them in `.bashrc` file.

```bash
himanshu in ~: alias foo='cd /usr; ls; cd ~'
himanshu in ~: foo
bin  games  include  lib  lib32  lib64  libexec  libx32  local  
pgadmin4  sbin  share  src
himanshu in ~: type foo
foo is aliased to 'cd /usr; ls; cd ~'
himanshu in ~: unalias foo # to remove alias
himanshu in ~: foo
Command 'foo' not found, did you mean:
...
```
