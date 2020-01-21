function progresssBar {
    Param (
        [string]$Activity = "Progress",
        [int]$Progress = 0,
        [int]$Possision = ([Console]::CursorTop),
        [int]$Total = 100
    )

    $Width = [Console]::WindowWidth
    [int]$HalfWidth = ($width / 2) -1
    $Progresslength = $HalfWidth

    [Console]::SetCursorPosition(0, $Possision)
    Write-Host $Activity "/"$Total "                           "

    [Console]::SetCursorPosition(($HalfWidth), $Possision)
    write-host "[" -NoNewLine -ForegroundColor Red
    $i = 1
    3..$HalfWidth| % {
        [Console]::SetCursorPosition(($i+$HalfWidth), $Possision)
        if ($i -le ($progress * ($Progresslength/$Total))){
            write-host "#" -NoNewLine -ForegroundColor Green  
        }else{
            write-host " " -NoNewLine 
        }
    $i++  
    } 
    [Console]::SetCursorPosition(($Width-4), $Possision)
   write-host "]" -NoNewLine  -ForegroundColor Red
}

#Main Program
$Main = 1
1..50|%{
    progresssBar -Activity "Activity $Main" -Progress $Main  -Total 50 
$Main++
}
exit;
