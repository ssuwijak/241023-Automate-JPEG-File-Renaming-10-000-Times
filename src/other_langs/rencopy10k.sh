#!/bin/bash

source_dir="path/to/your/source/directory"
destination_dir="path/to/your/destination/directory"
csv_file="names.csv"

mkdir -p "$destination_dir"

while IFS= read -r new_name; do
    source_file="$source_dir/$new_name"
    destination_file="$destination_dir/$new_name"
    cp "$source_file" "$destination_file" && echo "Copied $source_file to $destination_file" || echo "Error copying $source_file"
done < "$csv_file"