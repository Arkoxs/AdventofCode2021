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
        if ([int]$path[$index + 1] -lt [int]$path[$index + 3]) {
            $y = [int]$path[$index + 1]
            while ($y -le [int]$path[$index + 3]) {
                $array2[$path[$index], $y] += 1
                $y++
            }
        }
        elseif ([int]$path[$index + 1] -gt [int]$path[$index + 3]) {
            $y = [int]$path[$index + 1]
            while ($y -ge [int]$path[$index + 3]) {
                $array2[$path[$index], $y] += 1
                $y--
            }  
        }
        else {
            $array2[$path[$index], $path[$index + 1]] += 1
        }
    }
    elseif ($path[$index + 1] -eq $path[$index + 3]) {
        if ([int]$path[$index] -lt [int]$path[$index + 2]) {
            $x = [int]$path[$index]
            while ($x -le [int]$path[$index + 2]) {
                $array2[$x, $path[$index + 1]] += 1
                $x++
            }
        }
        elseif ([int]$path[$index] -gt [int]$path[$index + 2]) {
            $x = [int]$path[$index]
            while ($x -ge [int]$path[$index + 2]) {
                $array2[$x, $path[$index + 1]] += 1
                $x--
            }
        }
        else {
            $array2[$path[$index], $path[$index + 1]] += 1
        }
    }
    $index += 4
}

$count = 0
for ($x = 0; $x -lt 1000; $x++) {
    for ($y = 0; $y -lt 1000; $y++) {
        if ($array2[$x, $y] -gt 1) {
            $count++
        }
    }
}
Write-Host "Totaal aantal punten:" $count