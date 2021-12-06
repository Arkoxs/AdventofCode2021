# Read initial state
$timers = Get-Content Day6/input.txt -Raw
#$lanternfish = [int]$timers.Split(",")
$lanternfish = [System.Collections.ArrayList]@($timers).Split(",")
[long[]]$age = 0, 0, 0, 0, 0, 0, 0, 0, 0
[long[]]$next_age = 0, 0, 0, 0, 0, 0, 0, 0, 0

for ($i = 0; $i -lt $lanternfish.count; $i++) {
    #    Write-Host "Input: " $lanternfish[$i] "Number age:" $age[$lanternfish[$i]]
    $age[$lanternfish[$i]]++
}
#Write-Host "Input: " $age

#Calculate 256 days
For ($Day = 1; $Day -le 256; $Day++) {
    $next_age[0] = $age[1]
    $next_age[1] = $age[2]
    $next_age[2] = $age[3]
    $next_age[3] = $age[4]
    $next_age[4] = $age[5]
    $next_age[5] = $age[6]
    $next_age[6] = $age[7] + $age[0]
    $next_age[7] = $age[8]
    $next_age[8] = $age[0]
    for ($i=0;$i -lt 9;$i++) {$age[$i] = $next_age[$i]}
}
Write-Host "Result: " ($age[0] + $age[1] + $age[2] + $age[3] + $age[4] + $age[5] + $age[6] + $age[7] +$age[8])