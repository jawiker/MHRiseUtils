#Used for backing up MH Rise Save data.
$SteamDirectory = (Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Valve\Steam\).InstallPath

$MHRisePaths = (Get-ChildItem -Path $SteamDirectory -Recurse -Include "1446780" | Where-Object {$_.PSParentPath -notlike "*remote*"})

#GUI for folder selection
Function Get-Folder($initialDirectory="") {
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

if ($MHRisePaths.Count -gt 1) {
    Write-Warning "Multiple Steam Accounts with Monster Hunter Rise Save data detected. All Save files will be backed up."
}

#The Important Part
Try {
    $DestinationFolder = Get-Folder
    if (!$DestinationFolder) {
        Write-Output "No Folder Selected Exiting Script"
        Exit
    }
    ForEach ($Folder in $MHRisePaths) {
        Write-Output "Backing up $($Folder.FullName) to $DestinationFolder\$((Get-Item $MHRisePaths).parent.parent.Name)\1446780\"
        Copy-Item -Recurse -Force -Path $Folder.FullName -Destination "$DestinationFolder\$((Get-Item $MHRisePaths).parent.parent.Name)\1446780\"
    }
}
Catch{
    Write-Error "Failed to Backup Monster Hunter Rise save files"
}
