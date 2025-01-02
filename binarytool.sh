#!/bin/bash
echo "Binary and Letter Calculation Tool"
echo "1. Convert Binary to Decimal"
echo "2. Convert Decimal to Binary"
echo "3. ASCII/Letter to Binary"
echo "4. Binary to ASCII/Letter"
echo "5. Binary Addition"
echo "6. Binary Subtraction"
echo "7. Exit"

while true; do
    read -p "Choose an option (1-7): " option

    case $option in
        1)
            read -p "Enter binary number: " binary
            echo "Decimal: $((2#$binary))"
            ;;
        2)
            read -p "Enter decimal number: " decimal
            echo "Binary: $(echo "obase=2;$decimal" | bc)"
            ;;
        3)
            read -p "Enter ASCII character or letter: " ascii
            binary=$(echo -n "$ascii" | od -An -t u1 | awk '{print $1}' | xargs printf '%08d\n' | sed 's/ /0/g')
            echo "Binary: $binary"
            ;;
        4)
            read -p "Enter binary: " binary
            decimal=$((2#$binary))
            letter=$(printf "\x$(printf %x $decimal)")
            echo "ASCII/Letter: $letter"
            ;;
        5)
            read -p "Enter first binary number: " binary1
            read -p "Enter second binary number: " binary2
            sum=$((2#$binary1 + 2#$binary2))
            echo "Binary Sum: $(echo "obase=2;$sum" | bc)"
            ;;
        6)
            read -p "Enter first binary number: " binary1
            read -p "Enter second binary number: " binary2
            difference=$((2#$binary1 - 2#$binary2))
            echo "Binary Difference: $(echo "obase=2;$difference" | bc)"
            ;;
        7)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please choose a number between 1 and 7."
            ;;
    esac
done
