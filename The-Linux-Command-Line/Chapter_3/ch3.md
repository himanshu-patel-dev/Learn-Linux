# Chapter 3

1. `ls` **List directory in depth**

    - `ls` list all dir and files in current dir.

    - `ls /Desktop` same for a sub dir Desktop.

    - `ls HP/ Desktop/ Downloads/` specifying multiple dir.

    - `ls -l` for long detailed view.

    - Commands are often followed by one or more **options** that modify their
    behavior and, further, by one or more **arguments**, the items upon which
    the command acts:  
    `command -options arguments`

    - `ls -lt` to get long listin along with result sorted on modification time in ascending order of time.

    - `ls -lt --reverse` same as above just reverse the result of time sorting.

    - Other options

      - `-a` List all files, even those with names that begin
with a period

      - `-F` append an indicator character (/)
to the end of each listed name while file name remains same.

      - `-r` display the result in reverse order

      - `-S` sort result by size

      - `-t` sort by modification time

        ```python
        himanshu in ~: ls -l
        total 68
        drwxrwxr-x 2 himanshu himanshu 4096 Mar 29 10:50  bin
        drwxr-xr-x 2 himanshu himanshu 4096 Mar 29 16:21  Desktop
        drwxr-xr-x 2 himanshu himanshu 4096 Mar 31 11:43  Documents
        drwxr-xr-x 2 himanshu himanshu 4096 Apr  4 20:56  Downloads
        -rw-rw-r-- 1 himanshu himanshu  851 Mar 23 00:50  dump.rdb
        drwxrwxr-x 4 himanshu himanshu 4096 Mar 28 16:04  HP
        drwxr-xr-x 2 himanshu himanshu 4096 Feb 25 23:38  Music
        drwxr-xr-x 3 himanshu himanshu 4096 Mar 14 11:31  Pictures
        ```

        1. `-rw-rw-r--` first `-` show its a file while `d` shows its a directory.  
        2. Next three characters are the **access rights** for the **file’s owner**, the next three are for **members of the file’s group**, and the final three are for **everyone else**.  
        3. `1` show file's number of hard links  
        4. `himanshu` The user name of the file’s owner
        5. `himanshu` The name of the group that owns the file.
        6. `851` Size of the file in bytes.
        7. `Mar 28 16:04` Date and time of the file’s last modification.
        8. `dump.rdb` Name of the file.

2. `file` **Determine file type**

    - `file filename` is the format

    - Identify directory and files

        ```bash
        $: file HP/
        HP/: directory
        ```

        ```bash
        $: file MyTextFile.txt 
        MyTextFile.txt: ASCII text
        ```

    - hello

3. `less` **View text file content**

    - `less filename` is the format. To exit press `Q`. less falls into the class of programs called pagers, programs that allow the easy viewing of long text documents in a page-by-page manner

    - `less /etc/passwd` file that defines all the system’s user accounts.

    - Shortcuts

      - `PAGE UP or b` : Scroll back one page

      - `PAGE DOWN or Spacebar`: Scroll forward one page.

      - `G` Move to the end of the text file.

      - `g` Move to the beginning of the text file.

      - `/characters` then hit enter Search forward to the next occurrence of characters.

4. Directories Found on Linux Systems

    - `/` The root directory, where everything begins.

    - `/bin` Contains binaries (programs) that must be present for the
system to boot and run.

    - `/boot` Contains the Linux kernel, initial RAM disk image, and the boot loader.  
    Interesting files:
        - `/boot/grub/grub.conf` or menu.lst, which are used to
        configure the boot loader
        - `/boot/vmlinuz` the Linux kernel

    - `/dev` Contains device nodes. “Everything is a file” also applies to devices. Here is where the kernel maintains a list of all the devices.

    - `/etc` The /etc directory contains all of the system-wide
configuration files. It also contains a collection of shell
scripts that start each of the system services at boot time

    - `/home` Ordinary users can write files only in their
home directories. This limitation protects the system from
errant user activity.

    - `/lib` Contains shared library files used by the core system
programs. These are similar to DLLs in Windows.

    - `/lost+found` It is used
in the case of a partial recovery from a filesystem corruption event. this directory will remain empty.

    - `/media` will contain the mount points for removable media such
as USB drives, CD-ROMs, etc.

    - `/opt` used to install “optional” software.
This is mainly used to hold commercial software products
that may be installed on your system.

    - `/proc` It’s not a real filesystem in the sense of files stored on your hard drive. Rather, it is a virtual filesystem maintained by the Linux kernel. The
“files” it contains are peepholes into the kernel itself.

    - `/root` This is the home directory for the root account.

    - `/sbin` This directory contains “system” binaries. These are
programs that perform vital system tasks that are
generally reserved for the superuser.

    - `/tmp`  for storage of temporary,
transient files created by various programs. Some configurations cause this directory to be emptied each time
the system is rebooted.

    - `/usr` It contains all the programs and support files
used by regular users.

    - `/usr/bin`  contains the executable programs installed
by your Linux distribution. 

    - `/usr/lib` The shared libraries for the programs in /usr/bin.

    - `/usr/local` programs that are not included with your distribution but are intended for system-wide use are installed. Programs compiled from
source code are normally installed in /usr/local/bin.

    - `/usr/sbin` Contains more system administration programs

    - `/usr/share` contains all the shared data used by programs in /usr/bin. This includes things like default configuration files, icons, screen backgrounds, sound files, etc.

    - `/usr/share/doc` Most packages installed on the system will include some
kind of documentation. In /usr/share/doc, we will find documentation files organized by package.

    - `/var` The /var directory tree is where data that is likely to change is stored. Various databases, spool files, user mail, etc. are located here

    - `/var/log` contains log files, records of various system activity. These are very important and should be monitored from time to time. 

5. **Symbolic Link**

    ```bash
    lrwxrwxrwx 1 himanshu himanshu   52 Mar 28 16:04 Tutorials -> '/media/himanshu/Local Disk/dev/Courses and Tutorials'
    ```

    This is a special kind of a file called a **symbolic link** (also
known as a soft link or symlink).

    Notice the first character `l` in `lrwxrwxrwx` it's neither `-` not `d`. Also looks the dir have two name but in actual first name `Tutorials` is actual name of **symlink** while another name `/media/himanshu/Local Disk/dev/Courses and Tutorials` is the location of actual file/directory.

    Usefull in updateing the lib so when version update from `1.0` to `1.1` or something then previous program which refereed to this lib using symlink `foo` can now point to version `1.1` using new symlink `foo` just we need to update `foo` to point to new version.
