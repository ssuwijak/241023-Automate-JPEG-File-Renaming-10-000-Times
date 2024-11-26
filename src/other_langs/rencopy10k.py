import os
import csv

def copy_and_rename_files(source_dir, destination_dir, csv_file):
    """Copies files from source_dir to destination_dir and renames them based on names in the CSV file.

    Args:
        source_dir: The directory containing the source files.
        destination_dir: The directory where the copied files will be placed.
        csv_file: The path to the CSV file containing the new names.
    """

    try:
        os.makedirs(destination_dir, exist_ok=True)

        with open(csv_file, 'r') as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                new_name = row[0].strip()
                source_file = os.path.join(source_dir, new_name)
                destination_file = os.path.join(destination_dir, new_name)

                if os.path.exists(source_file):
                    os.copy(source_file, destination_file)
                    print(f"Copied {source_file} to {destination_file}")
                else:
                    print(f"Error: Source file {source_file} not found.")

    except Exception as e:
        print(f"Error: {e}")

# Example usage:
source_directory = "path/to/your/source/directory"
destination_directory = "path/to/your/destination/directory"
csv_file = "names.csv"

copy_and_rename_files(source_directory, destination_directory, csv_file)