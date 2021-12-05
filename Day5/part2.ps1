$coorinates = Get-Content Day5/input.txt

$path = $coorinates.Replace(" -> ", ",")
$path = $path.Split(",")

$array2 = New-Object 'object[,]' 1000, 1000
for ($x = 0; $x -lt 10; $x++) {
    for ($y = 0; $y -lt 10; $y++) {
        $array2[$x, $y] = 0
    }
}
$index = 0
while ($index -lt $path.count) {
    if (($path[$index] -eq $path[$index + 2])) {
        #        Write-Host "Vertikale lijn x=" $path[$index] " y="$path[$index + 1] "gaat naar x=" $path[$index + 2] " y=" $path[$index + 3]
        if ([int]$path[$index + 1] -lt [int]$path[$index + 3]) {
            $y = [int]$path[$index + 1]
            while ($y -le [int]$path[$index + 3]) {
                $array2[$path[$index], $y] += 1
                #               Write-Host "V LR x=" $path[$index] " y="$y " + 1"
                $y++
            }
        }
        elseif ([int]$path[$index + 1] -gt [int]$path[$index + 3]) {
            $y = [int]$path[$index + 1]
            while ($y -ge [int]$path[$index + 3]) {
                $array2[$path[$index], $y] += 1
                #                Write-Host "V RL x=" $path[$index] " y="$y " + 1"
                $y--
            }  
        }
        else {
            $array2[$path[$index], $path[$index + 1]] += 1
            #            Write-Host "V Punt x=" $path[$index] " y="$path[$index + 1] " + 1"
        }
    }
    elseif ($path[$index + 1] -eq $path[$index + 3]) {
        #        Write-Host "Horizontale lijn x=" $path[$index] " y="$path[$index + 1] "gaat naar x=" $path[$index + 2] " y=" $path[$index + 3]
        if ([int]$path[$index] -lt [int]$path[$index + 2]) {
            $x = [int]$path[$index]
            while ($x -le [int]$path[$index + 2]) {
                $array2[$x, $path[$index + 1]] += 1
                #                Write-Host "H UD x=" $x " y="$path[$index + 1] " + 1"
                $x++
            }
        }
        elseif ([int]$path[$index] -gt [int]$path[$index + 2]) {
            $x = [int]$path[$index]
            while ($x -ge [int]$path[$index + 2]) {
                $array2[$x, $path[$index + 1]] += 1
                #                Write-Host "H DU x=" $x " y="$path[$index + 1] " + 1"
                $x--
            }
        }
        else {
            $array2[$path[$index], $path[$index + 1]] += 1
            #            Write-Host "H Punt x=" $path[$index] " y="$path[$index + 1] " + 1"
        }
    }
    elseif ([Math]::Abs([int]$path[$index] - [int]$path[$index + 2]) -eq [Math]::Abs([int]$path[$index + 1] - [int]$path[$index + 3])) {
        #Bepaal of het een 45gr diagonaal is.
#        Write-Host "Diagonale lijn x=" $path[$index] " y="$path[$index + 1] "gaat naar x=" $path[$index + 2] " y=" $path[$index + 3]
        if ([int]$path[$index] -lt [int]$path[$index + 2]) {
            if ([int]$path[$index + 1] -le [int]$path[$index + 3]) {
                $x = [int]$path[$index]
                $y = [int]$path[$index + 1]
                while ($x -le [int]$path[$index + 2]) {
                    $array2[$x, $y] += 1
#                    Write-Host "D x=" $x " y=" $y " + 1"
                    $x++
                    $y++
                }    
            }
            else {
                $x = [int]$path[$index]
                $y = [int]$path[$index + 1]
                while ($x -le [int]$path[$index + 2]) {
                    $array2[$x, $y] += 1
#                    Write-Host "D x=" $x " y=" $y " + 1"
                    $x++
                    $y--
                }    
            }
        }
        else {
            if ([int]$path[$index + 1] -le [int]$path[$index + 3]) {
                $x = [int]$path[$index]
                $y = [int]$path[$index + 1]
                while ($x -ge [int]$path[$index + 2]) {
                    $array2[$x, $y] += 1
#                    Write-Host "D x=" $x " y=" $y " + 1"
                    $x--
                    $y++
                }    
            }
            else {
                $x = [int]$path[$index]
                $y = [int]$path[$index + 1]
                while ($x -ge [int]$path[$index + 2]) {
                    $array2[$x, $y] += 1
#                    Write-Host "D x=" $x " y=" $y " + 1"
                    $x--
                    $y--
                }    
            }
        }
    }
    $index += 4
}

<#
for ($y = 0; $y -lt 10; $y++) {
    Write-host $array2[0, $y] " " $array2[1, $y] " "  $array2[2, $y] " " $array2[3, $y] " " $array2[4, $y] " " $array2[5, $y] " " $array2[6, $y] " " $array2[7, $y] " " $array2[8, $y] " " $array2[9, $y] -NoNewline
    Write-Host ""
}
#>


$count = 0
for ($x = 0; $x -lt 1000; $x++) {
    for ($y = 0; $y -lt 1000; $y++) {
        if ($array2[$x, $y] -gt 1) {
            $count++
        }
    }
}
Write-Host "Totaal aantal punten:" $count