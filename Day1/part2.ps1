$value = Get-Content C:\git\AdventofCode2021\Day1\input.txt
$index = 0
$result = @()

while (($index + 2) -lt $value.count) {
    $result += [PSCustomObject]@{
        Depth = [int]$value[$index] + [int]$value[$index+1] + [int]$value[$index+2]
    }
    $index++
}

$index = 0
$count = 0
while (($index) -lt $result.count) {
    if ([int]$result[$index+1].Depth -gt [int]$result[$index].Depth){
        $count++
    }
    $index++
}

$count
