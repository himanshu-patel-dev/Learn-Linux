# Chapter 4

- `cp` copy files and directories

- `mv` move or rename files and  directories

- `mkdir` make new dir

- `rm` remove files and directory

- `ln` Create hard and symbolic links

## Wildcards

- `*` Any characters
- `?` Any single character
- `[characters]` Any character that is a member of the set characters
- `[!characters]` Any character that is not a member of the set characters
- `[[:class:]]` Any character that is a member of the specified class

### Commonly Used Character Classes

- `[:alnum:]` Any alphanumeric character
- `[:alpha:]` Any alphabetic character
- `[:digit:]` Any numeral
- `[:lower:]` Any lowercase letter
- `[:upper:]` Any uppercase letter

### Examples

- All files

    ```bash
    himanshu in ~: ls -d *
    bin         Downloads      HP      Pictures   Qt          Videos
    Desktop     dump.rdb       Music   Postman    snap       'VirtualBox VMs'
    Documents   FirstProject   opt     Public     Templates
    ```

- Files starting with some letter

    ```bash
    himanshu in ~: ls -d D*
    Desktop  Documents  Downloads
    ```

- Fils and dir start and end specified

    ```bash
    himanshu in ~: ls -d D*s
    Documents  Downloads
    ```

- Exactly two char are unknown

    ```bash
    himanshu in ~: ls -d o??
    opt
    ```

- Any file or dir beginning with char specified in list

    ```bash
    himanshu in ~: ls -d [bQo]*
    bin  opt  Qt
    ```

- Specify a range of digit and alphabets [0-9] or [a-z] or [A-Z]

    ```bash
    himanshu in ~: ls -d H[A-T]
    HP
    ```

- Any directory with first letter a uppercase

    ```bash
    himanshu in ~: ls -d [[:upper:]]*
    Desktop     FirstProject   Pictures   Qt         'VirtualBox VMs'
    Documents   HP             Postman    Templates
    Downloads   Music          Public     Videos
    ```

## mkdir - make directory

- Make multiple directories

    ```bash
    himanshu in HP: ls
    dev  softwares
    himanshu in HP: mkdir dir1 dir2
    himanshu in HP: ls
    dev  dir1  dir2  softwares
    ```

- Creating nested dir using filename appended in pre existing path

    ```bash
    himanshu in HP: ls
    dev  softwares
    himanshu in HP: mkdir ./dir/subdir
    mkdir: cannot create directory ‘./dir/subdir’: No such file or directory
    himanshu in HP: 
    himanshu in HP: mkdir ./dir
    himanshu in HP: ls
    dev  dir  softwares
    himanshu in HP: ls dir/
    himanshu in HP: mkdir dir/subdir
    himanshu in HP: ls
    dev  dir  softwares
    himanshu in HP: ls dir/
    subdir
    ```

## cp - copy files

- Copy files

    ```bash
    himanshu in HP: ls
    dev  dir  softwares  TextFile.txt
    himanshu in HP: cp TextFile.txt copyfile.txt
    himanshu in HP: ls
    copyfile.txt  dev  dir  softwares  TextFile.txt
    ```

- Copy files into a directories (TextFile and copyfile into directory dir)

    ```bash
    himanshu in HP: cp TextFile.txt copyfile.txt ./dir/
    himanshu in HP: ls
    copyfile.txt  dev  dir  softwares  TextFile.txt
    himanshu in HP: ls dir/
    copyfile.txt  subdir  TextFile.txt
    ```

### cp Options

- `-i` or `--interactive` : Before overwriting an existing file, prompt the user for confirmation. If this option is not specified, cp will silently overwrite files.

    ```bash
    himanshu in HP: cp -i TextFile.txt copyfile.txt ./dir/
    cp: overwrite './dir/TextFile.txt'? y
    cp: overwrite './dir/copyfile.txt'? y
    ```

- `-a` Copy the files and directories and all of their attributes,
including ownerships and permissions. Normally, copies take on the default attributes of the user performing the copy.

    ```bash
    himanshu in HP: ls -l
    total 12
    -rw-rw-r-- 1 himanshu himanshu    0 Apr  6 13:14 copyfile.txt
    drwxrwxr-x 5 himanshu himanshu 4096 Apr  1 17:24 dev
    drwxrwxr-x 3 himanshu himanshu 4096 Apr  6 13:16 dir
    drwxrwxr-x 4 himanshu himanshu 4096 Apr  4 20:56 softwares
    himanshu in HP: cp -a copyfile.txt newAcrchiveFile.txt
    himanshu in HP: ls -l
    total 12
    -rw-rw-r-- 1 himanshu himanshu    0 Apr  6 13:14 copyfile.txt
    drwxrwxr-x 5 himanshu himanshu 4096 Apr  1 17:24 dev
    drwxrwxr-x 3 himanshu himanshu 4096 Apr  6 13:16 dir
    -rw-rw-r-- 1 himanshu himanshu    0 Apr  6 13:14 newAcrchiveFile.txt
    drwxrwxr-x 4 himanshu himanshu 4096 Apr  4 20:56 softwares
    ```

- `-r` While copying a directory copy recursively to copy all the files.

    ```bash
    himanshu in HP: ls dir
    copyfile.txt  subdir  TextFile.txt
    himanshu in HP: cp dir newDir
    cp: -r not specified; omitting directory 'dir'
    himanshu in HP: cp -r dir newDir
    himanshu in HP: ls
    copyfile.txt  dev  dir  newAcrchiveFile.txt  newDir  NewFile.txt  softwares
    ```

- `-u` Copy only updated on newly created files from one dir to another. Here I modified TextFile.txt in dir/ while in newDir/ it's old. To copy a directory and its content we need `-r`.

    ```bash
    himanshu in HP: ls dir/
    copyfile.txt  subdir  TextFile.txt
    himanshu in HP: ls newDir/
    copyfile.txt  subdir  TextFile.txt
    himanshu in HP: cp -ruv dir/* newDir/
    'dir/TextFile.txt' -> 'newDir/TextFile.txt'
    ```

- `-v` for verbosity. Detail while copying.

### cp Examples

- `cp file1 file2` Copy file1 to file2. If file2 exists, it is overwritten with the contents of file1. If file2 does not exist, it
is created.

- `cp -i file1 file2` Same as above, except that if file2 exists, the user is prompted before it is overwritten.

- `cp file1 file2 dir1` Copy file1 and file2 into directory dir1. dir1 must already exist.

- `cp dir1/* dir2` Using a wildcard, all the files in dir1 are copied into dir2. dir2 must already exist.

- `cp -r dir1 dir2` Copy directory dir1 (and its contents) to directory
dir2. If directory dir2 does not exist, it is created and
will contain the same contents as directory dir1.

    ```bash
    himanshu in HP: ls  # all the dir, temp do not exist now
    dev  dir  newDir  softwares

    himanshu in HP: cp -r dir temp
    himanshu in HP: ls  # temp file created with same content as dir
    dev  dir  newDir  softwares  temp
    himanshu in HP: ls temp
    copyfile.txt  subdir  TextFile.txt
    himanshu in HP: ls dir/
    copyfile.txt  subdir  TextFile.txt

    himanshu in HP: cp -r dir temp  # check againg this time temp exist
    himanshu in HP: ls
    dev  dir  newDir  softwares  temp
    himanshu in HP: ls temp # dir is now sub dir of temp
    copyfile.txt  dir  subdir  TextFile.txt
    ```

## rm - delete files

- `rm filename` deletes the file

- `rm -r dir` deletes the directory

- `rm *.html` deletes all .html files

### rm Options

- `-i`, `--interactive` Before deleting an existing file, prompt the user for confirmation. If this option is not specified, rm will
silently delete files.

- `-r`, `--recursive` Recursively delete directories. This means that if a
directory being deleted has subdirectories, delete
them too. To delete a directory, this option must be
specified.

- `-f`, `--force` Ignore nonexistent files and do not prompt. This
overrides the `--interactive` option.

- `-v`, `--verbose` Display informative messages as the deletion is
performed.

### rm Examples

- `rm file1` Delete file1 silently.

- `rm -i file1` Before deleting file1, prompt the user for
confirmation.

- `rm -r file1 dir1` Delete file1 and dir1 and its contents.

- `rm -rf file1 dir1` Same as above, except that if either file1 or dir1 does not exist, rm will continue silently.

## ln - Create Links

The `ln` command is used to create either `hard` or `symbolic` links. It is used in one of two ways:

- `ln file link` to create a hard link  

- `ln -s item link` to create a symbolic link  

where item is either a file or a directory.

### Hard Links

Hard links are the original Unix way of creating links; symbolic links are more modern. By default, every file has a single hard link that gives the file its name. **When we create a hard link, we create an additional directory entry for a file**. Hard links have two important limitations:

- A hard link cannot reference a file outside its own filesystem. This
means a link cannot reference a file that is not on the same disk partition as the link itself.

- A hard link cannot reference a directory. 

A hard link is indistinguishable from the file itself. Unlike a directory list containing a symbolic link, a directory list containing a hard link shows no special indication of the link. When a hard link is deleted, the link is removed, but the contents of the file itself continue to exist (that is, its space is not deallocated) until all links to the file are deleted.

### Symbolic Links

Symbolic links were created to overcome the limitations of hard links. Symbolic links work by creating a special type of file that contains a text pointer to the referenced file or directory.

A file pointed to by a symbolic link and the symbolic link itself are
largely indistinguishable from one another. when you delete a symbolic link, only the link is deleted, not the file itself. If the file is deleted before the symbolic link, the link will continue to exist but will point to nothing. In this case, the link is said to be broken.

#### Playground

```bash
himanshu in practice: ls -l # see all content in dir
total 12
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:27 dir1
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:26 dir2
-rw-rw-r-- 1 himanshu himanshu   23 Apr  6 15:22 fun.txt

himanshu in practice: ln fun.txt fun-hard

himanshu in practice: ls -l # see fire have more no. of hard link now 
total 16
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:27 dir1
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:26 dir2
-rw-rw-r-- 2 himanshu himanshu   23 Apr  6 15:22 fun-hard
-rw-rw-r-- 2 himanshu himanshu   23 Apr  6 15:22 fun.txt

himanshu in practice: ln fun.txt dir1/fun-hard
himanshu in practice: ls -l
total 16
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:28 dir1
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:26 dir2
-rw-rw-r-- 3 himanshu himanshu   23 Apr  6 15:22 fun-hard
-rw-rw-r-- 3 himanshu himanshu   23 Apr  6 15:22 fun.txt

himanshu in practice: ln fun.txt dir2/ # see more hard link for same file
himanshu in practice: ls -l
total 16
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:28 dir1
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:28 dir2
-rw-rw-r-- 4 himanshu himanshu   23 Apr  6 15:22 fun-hard
-rw-rw-r-- 4 himanshu himanshu   23 Apr  6 15:22 fun.txt
```

One thing you notice is that the second field in the listing for fun and fun-hard both contain a 4, which is the number of hard links that now exist for the file.

Files are made up of two parts: the **data part** containing the **file’s contents** and the **name part**, which holds the **file’s name**. When we create hard links, we are actually creating **additional name parts** that all refer to the same data part. The system assigns a chain of disk blocks to what is called an inode, which is then associated with the name part. Each **hard link therefore refers to a specific inode** containing the file’s contents.

To know if two files are poniting to same inode (are hard links) use:  

```bash
himanshu in practice: ls -i
3032098 dir1  3032113 dir2  3028456 fun-hard  3028456 fun.txt
```

see hard links have same `inode` number as they points to same inode.
Also chaning the content of one file changes another file automaticlly as they point to same file in disk.

Symbolic links were created to overcome the two disadvantages of hard
links:  
Hard links cannot span physical devices, and hard links cannot reference directories, only files.  
Symbolic links are a special type of file that contains a text pointer to the target file or directory.

```bash
himanshu in practice: ls
dir1  dir2  fun-hard  fun.txt
himanshu in practice: ln -s fun.txt fun-sym
himanshu in practice: ls
dir1  dir2  fun-hard  fun-sym  fun.txt
himanshu in practice: ls -l
total 16
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:28 dir1
drwxrwxr-x 2 himanshu himanshu 4096 Apr  6 15:28 dir2
-rw-rw-r-- 4 himanshu himanshu   40 Apr  6 16:11 fun-hard
lrwxrwxrwx 1 himanshu himanshu    7 Apr  6 16:17 fun-sym -> fun.txt
-rw-rw-r-- 4 himanshu himanshu   40 Apr  6 16:11 fun.txt
```

Notice the less size and pointer to actual file in sym link.
We can view the content of file using sym link also. 

```bash
himanshu in practice: less fun-sym 
```

One thing to remember about symbolic links is that most file operations are carried out on the link’s target, not the link itself. However, `rm` is an exception. When you delete a link, it is the link that is deleted, not the target