$source_dir = "path/to/your/source/directory"
$destination_dir = "path/to/your/destination/directory"
$csv_file = "names.csv"

New-Item -Path $destination_dir -ItemType Directory -Force

Get-Content $csv_file | ForEach-Object {
    $new_name = $_
    $source_file = Join-Path $source_dir $new_name
    $destination_file = Join-Path $destination_dir $new_name
    Copy-Item $source_file $destination_file -ErrorAction Stop
    Write-Host "Copied $source_file to $destination_file"
}