$input = Get-Content Day4/example.txt

# Get bingo numbers
$numbers = $input[0].split(",")

# Get cards
$index = 1
$line = $input[2+$index] -replace '^ ','' -replace '  ',' '
#$card = $line.Replace("  "," ").Split(" ")
$card = @(@($line.Replace("  "," ").Split(" ")))


$line
$card