# Chapter 2

1. `pwd` Gives present working directory (path).  

2. `cd` Change directory

3. `ls` List the content of directory.

4. Like Windows, a Unix-like operating system such as Linux organizes its files
in what is called a **hierarchical directory structure**. This means that they are organized in a **tree-like pattern of directories** (sometimes called folders in other
systems), which may contain files and other directories. The first directory
in the filesystem is called the **root directory**.

5. Note that unlike **Windows**, which has a **separate filesystem tree** for each
storage device, Unix-like systems such as **Linux** always have a **single filesystem tree**, regardless of how many drives or storage devices are attached to the computer. Storage devices are attached (or more correctly, mounted) at various points on the tree according to the whims of the system administrator, the person (or persons) responsible for the maintenance of the system.

6. When we first log in to our system (or start a terminal emulator session),
our current working directory is set to our **home directory**. Each user account
is given its own home directory, which is the **only place** the user is allowed
to **write** files when **operating as a regular user**.

7. Change directory using two method.
  
    - **Absolute path** name `cd /usr/bin` (abs path begin with root dir)

        - Go to  home dir `cd ~` or `cd`

        - Go to root dir `cd /`

    - **Relative path** name `cd /HP` (rel path begin with pwd)

      - To one dir up (parent dir) `cd ..`

      - To previous dir `cd -` (hypen)

8. Filenames and commands in Linux, as in Unix, are case sensitive. The filenames File1 and file1 refer to different files.

9. Most importantly, do not embed spaces in filenames. Embedding spaces in filenames
will make many command line tasks more difficult. If you want to represent spaces between words in a filename, use underscore or hypen characters. You will thank yourself later.
