$value = Get-Content C:\git\AdventofCode2021\Day1\input.txt
$index = 0
$count = 0

while ($index -lt $value.count) {
    if ([int]$value[$index+1] -gt [int]$value[$index]){
        $count++
    }
    $index++
}
$count