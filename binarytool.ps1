Write-Host "Binary and Letter Calculation Tool"
Write-Host "1. Convert Binary to Decimal"
Write-Host "2. Convert Decimal to Binary"
Write-Host "3. ASCII/Letter to Binary"
Write-Host "4. Binary to ASCII/Letter"
Write-Host "5. Binary Addition"
Write-Host "6. Binary Subtraction"
Write-Host "7. Exit"

do {
    $option = Read-Host "Choose an option (1-7)"
    switch ($option) {
        1 {
            $binary = Read-Host "Enter binary number"
            $decimal = [convert]::ToInt32($binary, 2)
            Write-Host "Decimal: $decimal"
        }
        2 {
            $decimal = Read-Host "Enter decimal number"
            $binary = [convert]::ToString($decimal, 2)
            Write-Host "Binary: $binary"
        }
        3 {
            $ascii = Read-Host "Enter ASCII character or letter"
            $binary = [convert]::ToString([byte][char]$ascii, 2).PadLeft(8, '0')
            Write-Host "Binary: $binary"
        }
        4 {
            $binary = Read-Host "Enter binary"
            $decimal = [convert]::ToInt32($binary, 2)
            $ascii = [char][int]$decimal
            Write-Host "ASCII/Letter: $ascii"
        }
        5 {
            $binary1 = Read-Host "Enter first binary number"
            $binary2 = Read-Host "Enter second binary number"
            $sum = [convert]::ToInt32($binary1, 2) + [convert]::ToInt32($binary2, 2)
            $binarySum = [convert]::ToString($sum, 2)
            Write-Host "Binary Sum: $binarySum"
        }
        6 {
            $binary1 = Read-Host "Enter first binary number"
            $binary2 = Read-Host "Enter second binary number"
            $difference = [convert]::ToInt32($binary1, 2) - [convert]::ToInt32($binary2, 2)
            $binaryDifference = [convert]::ToString($difference, 2)
            Write-Host "Binary Difference: $binaryDifference"
        }
        7 {
            Write-Host "Exiting..."
        }
        default {
            Write-Host "Invalid option. Please choose a number between 1 and 7."
        }
    }
} while ($option -ne 7)
