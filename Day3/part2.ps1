$code = Get-Content Day3/input.txt
$index = 0

$oxygen = $code
while ($index -lt 12) {
    $measure = $oxygen.Substring($index, 1) | Measure-Object -Average -Sum
    if ($oxygen.count -gt 1) {
        if ($measure.Average -ge 0.5) {
            $oxygen = $oxygen | Where-Object { $_.Substring($index, 1) -eq "1" }
        }
        else {
            $oxygen = $oxygen | Where-Object { $_.Substring($index, 1) -eq "0" }
        }
    }
    $index++
}

$index = 0
$co2 = $code
while ($index -lt 12) {
    $measure = $co2.Substring($index, 1) | Measure-Object -Average -Sum
    if ($co2.count -gt 1) {
        if ($measure.Average -ge 0.5) {
            $co2 = $co2 | Where-Object { $_.Substring($index, 1) -eq "0" }
        }
        else {
            $co2 = $co2 | Where-Object { $_.Substring($index, 1) -eq "1" }
        }
    }
    $index++
}
$oxygenD = [Convert]::ToInt32($oxygen,2)
$co2D = [Convert]::ToInt32($co2,2)

Write-Host "Oxygen: " $oxygen " Decimal: " $oxygenD
Write-Host "CO2: " $co2 "Decimal" $co2D
Write-Host "Solution" ($oxygenD * $co2D)