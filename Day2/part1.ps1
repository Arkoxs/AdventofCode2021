$distance = 0
$depth = 0
$index = 0
$line = Get-Content C:\git\AdventofCode2021\Day2\input.txt

while ($index -lt $line.count) {
    $value = $line[$index].split(" ",2)

    if ($value[0] -eq "forward") {
        $distance += [int]$value[1]
    }
    if ($value[0] -eq "down") {
        $depth += [int]$value[1]
    }
    if ($value[0] -eq "up") {
        $depth -= [int]$value[1]
    }
    $index++
}
$distance * $depth