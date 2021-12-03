$code = Get-Content Day3/input.txt
$index = 0
$gamma = ""
$epsilon = ""

while ($index -lt 12){
    $measure = $code.Substring($index,1) | Measure-Object -Average -Sum

    if ($measure.Average -ge 0.5){
        $gamma += "1"
        $epsilon += "0"
    } else {
        $gamma += "0"
        $epsilon += "1"
    }
    $index++
}


$gammaD = [Convert]::ToInt32($gamma,2)
$epsilonD = [Convert]::ToInt32($epsilon,2)

Write-Host "Gamma: " $gammaD
Write-Host "Epsilon: " $epsilonD
Write-Host "Solution" ($gammaD * $epsilonD)