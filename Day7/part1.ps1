# Read initial state
$levels = Get-Content Day7/input.txt -Raw

$crablevel = @($levels).Split(",")
$numberofcrabs = [Object[]]::new(2000)

foreach ($item in $crablevel) {
#for ($item=0;$item -lt 2;$item++){
    $numberofcrabs[$item] += 1
}

$fuelconsumption = 2000000
for ($i=0;$i -lt 2000;$i++){
    if ($null -ne $numberofcrabs[$i]) {
#        Write-Host "Vergelijk " $i " met de rest."
        $fuel = 0
        for ($x=0;$x -lt 2000;$x++){
            if ($null -ne $numberofcrabs[$x]) {
                $fuel += $numberofcrabs[$x] * [Math]::Abs($i - $x)
#                Write-Host "numberofcrabs: " $numberofcrabs[$x] " fuel: "  ([Math]::Abs($i - $x)) "`tTotal:" $fuel
            }
        }
        if ([int]$fuel -lt [int]$fuelconsumption) {
#            Write-Host "Fuel " $fuel " -lt " $fuelconsumption " fuelconsumption = " $fuel
            $fuelconsumption = $fuel
        } else {
#            Write-Host "Fuel " $fuel " -ge " $fuelconsumption " fuelconsumption = " $fuelconsumption
        }
    }
}
Write-Host "Laagste brandstof" $fuelconsumption

