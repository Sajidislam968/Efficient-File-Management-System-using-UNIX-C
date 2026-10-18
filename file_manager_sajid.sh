#!/bin/bash
i=0
while [ $i -lt 100 ]
do

    echo "========================================================================="
    echo "========================================================================="
    echo "-----------------------File Management Project---------------------------"
    echo "========================================================================="
    echo "========================================================================="
    echo "Welcome, The Main Menu is given below:"
    echo "1- List all Files and Directories"
    echo "2- Create New Files"
    echo "3- Create new Directory(Folder)"
    echo "4- Delete Existing Files"
    echo "5- Rename Files"
    echo "6- Copy Files"
    echo "7- Move Files"
    echo "8- Open Files"
    echo "9- View content of File"
    echo "10- Edit file content"
    echo "11- Detail of Particular File"
    echo "12- Change Directory"
    echo "13- Sort files in Directory"
    echo "14- Count number of files"
    echo "15- Count number of Directories"
    echo "16- List only Directories(Folders)"
    echo "17- List Files of Particular Extension"
    echo "0- Exit"
    echo ""
    echo "What action you want to Perform?"
    echo "Enter 0-17"
    echo "Your current path- $(pwd)"
    read opt1

    # List files
    if [ $opt1 == 1 ]; then
        echo "List all files and Directories here.."
        echo "Showing all files and directories...."
        sleep 1
        echo "Loading.."
        sleep 1
        echo "-------------------------------OutPut------------------------------------"
        ls
        echo ""

    # file creation
    elif [ $opt1 == 2 ]; then
        echo "Create New Files here.."
        echo "You can create any type of file!"
        echo "Type the name of your file="
        read filename
        touch $filename
        echo "-------------------------------OutPut------------------------------------"
        echo "File Created Successfully"
        echo ""

    # new directory
    elif [ $opt1 == 3 ]; then
        read -p "Enter directory name: " directory_name
        # Check if directory name is empty
        if [ -z "$directory_name" ]; then
            echo "Error: Directory name cannot be empty"
            return 1
        fi

        # Check if directory already exists
        if [ -d "$directory_name" ]; then
            echo "Error: Directory '$directory_name' already exists"
            return 1
        fi

        # Attempt to create the directory
        if mkdir "$directory_name"; then
            echo "Directory '$directory_name' created successfully"
        else
            echo "Error: Unable to create directory '$directory_name'"
            return 1
        fi

    # delete file
    elif [ $opt1 == 4 ]; then
        echo "Delete existing files here.. "
        echo "Enter name of File you want to Delete!"
        echo "Note: Please Enter full Name with Extension."
        read delfile
        echo "-------------------------------OutPut------------------------------------"
        if [ -f "$delfile" ]; then
            rm $delfile
            echo "Successfully Deleted."
        else
            echo "File Does not Exist..Try again"
            echo ""
        fi

    # rename file
    elif [ $opt1 == 5 ]; then
        echo "-------------------------------OutPut------------------------------------"
        echo "Rename files here.."
        echo "Enter Old Name of File with Extension.."
        read old
        echo "Checking for file..."
        sleep 1
        if [ -f "$old" ]; then
            echo "Ok File Exist."
            echo "Now Enter New Name for file with Extension"
            read new
            mv $old $new
            echo "Successfully Rename."
            echo "Now Your File Exist with $new Name"
        else
            echo "$old does not exist..Try again with correct filename."
        fi

    # copy file
    elif [ $opt1 == 6 ]; then
        read -p "Enter source file: " source_file
        # Check if source file exists
        if [ ! -e "$source_file" ]; then
            echo "Error: Source file '$source_file' not found"
            return 1
        fi

        read -p "Enter destination directory: " destination_dir
        # Check if destination directory exists
        if [ ! -d "$destination_dir" ]; then
            echo "Error: Destination directory '$destination_dir' not found"
            return 1
        fi

        # Copy the file
        if cp "$source_file" "$destination_dir"; then
            echo "File '$source_file' copied to '$destination_dir' successfully"
        else
            echo "Error: Unable to copy file '$source_file' to '$destination_dir'"
            return 1
        fi

    # move file
    elif [ $opt1 == 7 ]; then
        read -p "Enter source file: " source_file
        read -p "Enter destination directory: " destination_dir
        if [ -e "$source_file" ]; then
            mv "$source_file" "$destination_dir" || { echo "Error: Unable to move file"; return 1; }
        else
            echo "Error: Source file not found"
            return 1
        fi

    # open file
    elif [ $opt1 == 8 ]; then
        read -p "Enter filename to open: " filename
        if [ -e "$filename" ]; then
            less "$filename" || { echo "Error: Unable to open file"; return 1; }
        else
            echo "Error: File not found"
            return 1
        fi
        read -p "Press Enter to continue..."

    # view file
    elif [ $opt1 == 9 ]; then
        echo "View content of file here.."
        echo "Enter File Name : "
        read readfile
        echo "-------------------------------OutPut------------------------------------"
        if [ -f "$readfile" ]; then
            echo "Showing file content.."
            sleep 3
            cat $readfile
        else
            echo "$readfile does not exist"
        fi
        echo ""

    # edit file
    elif [ $opt1 == 10 ]; then
        echo "Edit file content here.."
        echo "Enter File Name with Extension : "
        read edit
        echo "-------------------------------OutPut------------------------------------"
        echo "Checking for file.."
        sleep 3
        if [ -f "$edit" ]; then
            echo "Opening file.."
            sleep 3
            nano $edit
            echo ""
        else
            echo "$edit File does not exist..Try again."
        fi

    # file detail
    elif [ $opt1 == 11 ]; then
        echo "Detail of file here.."
        echo "Enter File Name with Extension to see Detail : "
        read detail
        echo "-------------------------------OutPut------------------------------------"
        echo "Checking for file.."
        sleep 4
        if [ -f "$detail" ]; then
            echo "Loading Properties.."
            stat $detail
        else
            echo "$detail File does not exist..Try again"
        fi
        echo ""

    # change directory
    elif [ $opt1 == 12 ]; then
        read -p "Enter directory path: " directory
        if [ "$directory" == "home" ]; then
                cd "~"
                fi
        if [ -d "$directory" ]; then
            cd "$directory" || { echo "Error: Unable to change directory"; return 1; }
        else
            echo "Error: Directory not found"
            return 1
        fi

    # sort files
    elif [ $opt1 == 13 ]; then
        echo "-------------------------------OutPut------------------------------------"
        echo "Sort Files here.."
        echo "Your Request of Sorting file is Generated."
        echo "Sorting.."
        sleep 3
        ls | sort
        echo ""

    # count number of files
    elif [ $opt1 == 14 ]; then
        echo "-------------------------------OutPut------------------------------------"
        echo "Total Numbers of Files in Current Directory here.."
        echo "Loading all files.."
        sleep 3
        echo "Number of Files are : "
        ls -l | grep -v 'total' | grep -v '^d' | wc -l
        echo ""

    # count number of directory
    elif [ $opt1 == 15 ]; then
        echo "-------------------------------OutPut------------------------------------"
        echo "Total number of Directories here.."
        echo "Loading all directories.."
        sleep 3
        echo "Counting.."
        sleep 3
        echo "Number of Directories are : "
        echo */ | wc -w
        echo ""

    # list of directories
    elif [ $opt1 == 16 ]; then
        echo "-------------------------------OutPut------------------------------------"
        echo "List of all Directories here.."
        echo "showing all Directories..."
        echo "Loading.."
        sleep 3
        ls -d */
        echo ""

    # list files of particular extension
    elif [ $opt1 == 17 ]; then
        echo "List of Files with Particular extensions here.."
        echo "Which type of file list you want to see?"
        echo "1- .c"
        echo "2- .sh"
        echo "3- .txt"
        echo "Enter your choice from 1-3"
        read extopt
        echo "-------------------------------OutPut------------------------------------"

        if [ $extopt == 1 ]; then
            echo "List of .c Files shown below."
            echo "Loading.."
            sleep 3
            ls *.c

        elif [ $extopt == 2 ]; then
            echo "List of .sh Files shown below."
            echo "Loading.."
            sleep 3
            ls *.sh

        elif [ $extopt == 3 ]; then
            echo "List of .txt Files shown below."
            echo "Loading.."
            sleep 3
            ls *.txt
        else
            echo "Invalid Input..Try again.."
        fi
        echo ""

    # search file in directory
    elif [ $opt1 == 18 ]; then
        echo "Search files here.."
        echo "Enter File Name with Extension to search"
        read f
        echo "-------------------------------OutPut------------------------------------"
        if [ -f "$f" ]; then
            echo "Searching for $f File"
            echo "File Found."
            find /home -name $f
            echo ""
        else
            echo "File Does not Exist..Try again."
            echo ""
        fi

    # search file
    elif [ $opt1 == 19 ]; then
        read -p "Enter filename or pattern to search: " pattern
        echo "Search results for '$pattern':"
        echo "-------------------------------------------------------------------------------------------------------------------------------------------"
        printf "| %-40s | %-15s | %-10s | %-33s  | %-10s | %-10s |\n" "Name" "Owner" "Permissions" "Last Modified" "Size" "Type"
        echo "-------------------------------------------------------------------------------------------------------------------------------------------"

        # Use find command to search for files and directories matching the pattern
        search_results=$(find . -iname "*$pattern*")

        # Check if any matching files or directories are found
        if [ -z "$search_results" ]; then
            echo "| No matching files or directories found"
        else
            # Display search results with detailed information
            for result in $search_results; do
                # Get information about the file or directory
                owner=$(stat -c '%U' "$result")
                permissions=$(stat -c '%A' "$result")
                last_modified=$(stat -c '%y' "$result")
                size=$(stat -c '%s' "$result")
                file_type=""
                if [ -f "$result" ]; then  # Check if it's a regular file
                    file_type="File"
                elif [ -d "$result" ]; then  # Check if it's a directory
                    file_type="Directory"
                fi
                # Print the information
                printf "| %-40s | %-15s | %-10s | %-33s | %-10s | %-10s |\n" "$result" "$owner" "$permissions" "$last_modified" "$size" "$file_type"
            done
        fi

        echo "-------------------------------------------------------------------------------------------------------------------------------------------"
        read -p "Press Enter to continue..."

    elif [ $opt1 == 0 ]; then
        echo "Good Bye.."
        echo "Successfully Exit"
        break
    fi
    ((i++))
done