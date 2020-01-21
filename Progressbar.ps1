function progresssBar {
    Param (
        [string]$Activity = "Progress",
        [int]$Progress = 65,
        [int]$Possision = 0,
        [int]$Total = 100

    )

    $Width = [Console]::WindowWidth
    [int]$HalfWidth = ($width / 2) -1
    $Progresslength = $HalfWidth
    $Currentpossision = $Possision

    [Console]::SetCursorPosition(0, $Currentpossision)
    Write-Host $Activity "/"$Total "                           "

    [Console]::SetCursorPosition(($HalfWidth), $Currentpossision)
    write-host "[" -NoNewLine -ForegroundColor Red
    $i = 1
    3..$HalfWidth| % {
        [Console]::SetCursorPosition(($i+$HalfWidth), $Currentpossision)
        if ($i -le ($progress * ($Progresslength/$Total))){
            write-host "#" -NoNewLine -ForegroundColor Green  
        }else{
            write-host " " -NoNewLine 
        }
    $i++  
    } 
    [Console]::SetCursorPosition(($Width-4), $Currentpossision)
   write-host "]" -NoNewLine  -ForegroundColor Red
}


#Main Program
Clear-Host
$Main = 0
1..5|%{#First loop
    progresssBar -Activity "Main Activity $Main" -Progress $Main -Possision 1 -Total 5
    $Sub= 1
    1..50|%{#Second loop
        progresssBar -Activity "Sub Activity $Sub" -Progress $Sub -Possision 2 -Total 50
    $Sub++
    }#Second loop
$Main++
}#First loop
progresssBar -Activity "Main Activity $Main" -Progress $Main -Possision 1 -Total 5
