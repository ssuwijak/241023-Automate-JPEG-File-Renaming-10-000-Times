Option Explicit

Const ForReading = 1
Const ForWriting = 2

Dim source_dir, destination_dir, csv_file, objFSO, objTS, objFile, new_name, source_file, destination_file

source_dir = "path/to/your/source/directory"
destination_dir = "path/to/your/destination/directory"
csv_file = "names.csv"

Set objFSO = CreateObject("Scripting.FileSystemObject")

If Not objFSO.FolderExists(destination_dir) Then
    objFSO.CreateFolder destination_dir
End If

Set objTS = objFSO.OpenTextFile(csv_file, ForReading)

Do Until objTS.AtEndOfStream
    new_name = objTS.ReadLine
    source_file = source_dir & "\" & new_name
    destination_file = destination_dir & "\" & new_name

    If objFSO.FileExists(source_file) Then
        objFSO.CopyFile source_file, destination_file
        WScript.Echo "Copied " & source_file & " to " & destination_file
    End If
Loop

objTS.Close