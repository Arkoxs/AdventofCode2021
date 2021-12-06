# Read initial state
$timers = Get-Content Day6/input.txt -Raw
#$lanternfish = [int]$timers.Split(",")
$lanternfish = [System.Collections.ArrayList]@($timers).Split(",")

#Calculate 80 days
#Write-Host "Lanternfish Start: " $lanternfish
For ($Day = 0; $Day -lt 256; $Day++) {
    $spawn = 0
    For ($i=0; $i -lt $lanternfish.count; $i++) {
        [int]$lanternfish[$i] -= 1
        if ([int]$lanternfish[$i] -lt 0) {
            [int]$lanternfish[$i] = 6
            $spawn += 1
        }
    }
    for ($n = 0; $n -lt $spawn; $n++) {
        [void]$lanternfish.Add(8)
    }
#    Write-Host "Lanternfish: " $Day ": " $lanternfish
}
$lanternfish.Count