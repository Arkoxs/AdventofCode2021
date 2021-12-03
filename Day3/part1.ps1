$code = Get-Content Day3/input.txt
$index = 0
$gamma = @(0,0,0,0,0,0,0,0,0,0,0,0)
$epsilon = @(0,0,0,0,0,0,0,0,0,0,0,0)

while ($index -lt 12){
    $measure = $code.Substring($index,1) | Measure-Object -Average -Sum

    if ($measure.Average -ge 0.5){
        $gamma[$index] = 1
        $epsilon[$index] = 0
    } else {
        $gamma[$index] = 0
        $epsilon[$index] = 1
    }
    $index++
}


$gammaD = [Convert]::ToInt32(-join $gamma,2)
$epsilonD = [Convert]::ToInt32(-join $epsilon,2)

Write-Host "Gamma: " $gammaD
Write-Host "Epsilon: " $epsilonD
Write-Host "Solution" ($gammaD * $epsilonD)