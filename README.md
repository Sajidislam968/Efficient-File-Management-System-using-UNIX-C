# Efficient File Management System using UNIX

A menu-driven file management utility written in Bash. It lets you perform common file and directory operations from an interactive terminal menu.

## Requirements

- Bash
- Standard Unix utilities: `ls`, `touch`, `mkdir`, `rm`, `mv`, `cp`, `cat`, `find`, `stat`, and `sort`
- `less` for opening files and `nano` for editing files

On most Linux distributions, the standard utilities are already installed. Install `less` or `nano` with your distribution's package manager if they are missing.

## Run

Clone the repository and enter its directory:

```bash
git clone https://github.com/Sajidislam968/Efficient-File-Management-System-using-UNIX-C.git
cd Efficient-File-Management-System-using-UNIX-C
```

Run the script:

```bash
bash file_manager_sajid.sh
```

The script is also executable, so you can run it directly:

```bash
./file_manager_sajid.sh
```

Choose an action from the menu and follow the prompts. The script operates on the current working directory; use the change-directory option to work elsewhere.

## Features

The menu includes:

1. List files and directories
2. Create a file
3. Create a directory
4. Delete a file
5. Rename a file
6. Copy a file
7. Move a file
8. Open a file with `less`
9. View file contents
10. Edit a file with `nano`
11. Show file details
12. Change directory
13. Sort and list entries
14. Count files
15. Count directories
16. List directories
17. List `.c`, `.sh`, or `.txt` files

The script also contains file-search handlers for options 18 and 19, although these options are not shown in the menu.

## Caution

This utility can delete, move, rename, and overwrite files. Try it first in a test directory and check each requested path before confirming an operation.
