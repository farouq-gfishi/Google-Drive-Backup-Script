#!/bin/bash

add_file() {
        local parent_id=$1
        local file_path=$2
        local file_name=$(awk -F "/" '{print $NF}' <<< "$file_path")
        local files=$(gdrive files list --parent $parent_id | awk 'NR > 1 {print $2}')
        if echo "$files" | grep -q "$file_name"; then
                local file_id=$(gdrive files list --query "'$parent_id' in parents" | awk -v name="$file_name" '$2 == name {print $1}')
                gdrive files update $file_id $file_path
        else
                gdrive files upload --parent $parent_id $file_path
        fi
}

add_folder() {
        local parent_id=$1
        local folder_path=$2
        local folder_name=$(awk -F "/" '{print $NF}' <<< "$folder_path")
        echo $folder_path
        local files=$(gdrive files list --parent $parent_id | awk 'NR > 1 {print $2}')

        if ! echo "$files" | grep -q "$folder_name"; then
                local message=$(gdrive files mkdir --parent $parent_id $folder_name)
                local current_id=$(awk '{print $NF}' <<< "$message")
                main $current_id $folder_path
        else
                local folder_id=$(gdrive files list --query "'$parent_id' in parents" | awk -v name="$folder_name" '$2 == name {print $1}')
                main $folder_id $folder_path
        fi
}

main() {
        local parent_id=$1
        local folder_path=$2
        for item in "$folder_path"/*; do
                if [ -f $item ]; then
                        add_file $parent_id $item
                elif [ -d $item ]; then
                        add_folder $parent_id $item
                fi
        done
}

parent_id=$1
folder_path=$2

echo
echo "***************************************"
echo
date
echo
echo "***************************************"
echo

begin=$EPOCHREALTIME
main $parent_id $folder_path
end=$EPOCHREALTIME
elapsed=$(bc -l <<< "$end - $begin")

echo
echo "***************************************"
echo DONE!
echo "It takes $elapsed seconds to complete."

exit 0
