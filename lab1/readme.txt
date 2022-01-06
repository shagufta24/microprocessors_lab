MPI Lab-1

Group 16:
Shagufta Anjum - 19XJ1A0568
Mihika Jain -19XJ1A0539
Drishti Gupta - 19XJ1A0522



FIRST PROBLEM p1.c :

Input: Command-line input. We give 3 arguments to the program:
argv[1]:
 1 - for integer data type input.
 2 - for float data type input.
 3 - for double data type input.

argv[2]: 
1 - for signed 
0 - for unsigned
Note: Unsigned can only exist for integers so if argv[1] is 2 or 3 then we will display an error.

argv[3]:
The input number for which we want to print the internal representation of the stored values

To compile:
>> gcc p1.c -o p1 -lm
To execute:
>> ./out 1 1 23  (to run signed positive int)
>> ./out 1 0 28 (to run unsigned positive int)
>> ./out  1 1 -30 (to run signed negative int)
>> ./out  2 1 218.56 (to run positive float)
>> ./out 2 1 -218.56 (to run negative float)
>> ./out 3 1 218.564566 (to run positive double)
>> ./out 3 1 -218.564566 (to run negative double)
To generate assembly code:
 >> gcc -S p1.c

Logic used:
Binary numbers are represented as integer arrays.

Unsigned int:
When you define an unsigned number, it takes 32 bits (4x8 bit words) where all 32 bits are used to represent the magnitude of the number in the computer memory as it does not have a sign bit. It is stored in binary form and if a signed input is given it just ignores the sign.

1. Take a 32 bit int array.
2. Run a loop over the decimal input provided to convert the given decimal number to its 32 bit binary form and store it. (if it is negative, do not consider the sign)
3. Hence, if a negative number is also given, it is stored as positive.

Signed int:
Signed numbers are stored in 32 bits in computer memory. The first bit is the indicator of the sign. The number is stored in binary form in the next 31 bits.

1. Check if the nmber is +ve or -ve.
2. If the number is positive and in the range of 31 bit binary, run a loop over the decimal input provided to convert the given decimal number to its 31 bit binary form and store it taking the first bit of the 32 bit array as 0.
3. If the number is negative, the number is stored in twos complement form. Take the 2's complement of the magnitude of the 32 bit numer and save it in the computer memory. This makes the first bit 1, an indicator of the negative value. The range is that of 31 bits, however.


Floating point representation:

Float:
The numbers are stored in 32 bits and have 3 parts, the sign (1 bit), mantissa (23 bits) and exponent (8 bits)
1. Check if the number is positive or negative, and add the first bit to a 32 bit int arraycalled int floatingpointarray[32]. 
2.Divide the float number to the int part and franction part and convert those into binary. Using this binary number, extract the mantissa and the exponent.
Display in the floating point array of length 32 bits in the order: sign, exponent, mantissa.

Double:
The numbers are stored in 64 bits and have 3 parts, the sign (1 bit), mantissa (52 bits) and exponent (11 bits) 
1. Check if the number is positive or negative, and add the first bit to a 64 bit int array called int floatingpointarray[64] . 
2.Divide the float number to the int part and franction part and convert those into binary. Using this binary number, extract the mantissa and the exponent.
Display in the floating point array of length 64 bits in the order: sign, exponent, mantissa.


SECOND PROBLEM p2.c

Input: Given by the user on scanf prompt.

To compile:
>> gcc p2.c -o p2 -lm (to compile)
To execute:
>> ./out
To generate assembly code:
>> gcc -S p2.c

Logic used:
Binary numbers are represented as strings.
The decimal conversion is displayed for cross checking of the result.

Integer addition:
1. Iterate backwards over the two numbers (from LSB to MSB)
2. Add the two digits and the carry. Store the resulting digit in the result string.
3. Save the carry in each step to use in the next step. Discard the overflow bit.

Integer multiplication:
1. Take each digit of number 2 one by one (from LSB to MSB)
2. For each of these digits, iterate over number 1 backwards and multiply the digits. Store the result in temp.
3. Temp stores the intermediate sum generated in each multiplication step.
4. Remember to include k number of zeroes at the end of temp in each case (where k is the count of multiplication steps).
5. Check the leftmost bit of temp and extend it to the left to make temp 64 bits.
6. Add temp to the final result and repeat for all digits of number 2.
7. Special Case (When number 2 is negative): For the last digit, do not multiply. Instead, set temp to the 2s complement of number 1.

Real number addition:
1. Extract the sign (1 bit), mantissa (23 bits) and exponent (8 bits) substrings from both numbers.
2. Include the 'hidden' 1 in the mantissa (now 24 bits)
3. Compare the exponents and find the difference.
4. For the number with smaller exponent, shift the mantissa bits to the right to make the exponents of the same order.
5. Add zeroes in 'empty' bits to the left after shifting.
6. If any of the numbers are negative, convert the mantissa to 2s complement form.
7. Add the mantissas using integer addition function.
8. Special case: If there is an end carry in the addition, it must be included in the sum.
9. Combine the final exponent, mantissa sum and final sign bit for the final sum.

Real number multiplication:
1. Extract the sign (1 bit), mantissa (23 bits) and exponent (8 bits) substrings from both numbers.
2. Include the 'hidden' 1 in the mantissa (now 24 bits)
3. Add the exponents as follows: E1 + E2 - 127 (Add 2s complement of 127)
4. Multiply the mantissas to get 48 bit product. Keep the 24 MSBs.
5. For multiplication, use regular binary multiplication algorithm, not 2s complement.
6. The product will have 2 digits to the left of decimal. Normalize by adding 1 to the exponent.
7. Find the final sign by XORing the two signs.
8. Combine the final exponent, mantissa product and final sign bit for the final product.

THIRD PROBLEM p3.c :
Input: Command line input. We give 2 arguments to the program:
argv[1]:
 1 - to convert decimal into BCD.
 2 - to convert BCD into decimal.

argv[2]:
The input number for which we want to print the converted value.

To run:
>> gcc p3.c -o p3 -lm
To execute:
>> ./out 1 67  (to convert decimal into BCD)
>> ./out 2 01100111 (to convert BCD into decimal)
To generate assembly code:
 >> gcc -S p3.c

Logic used:
There are 2 parts to this problem.
The first is to convert a decimal to its BCD form and the second is to convert the BCD into decimal.

Decimal to BCD:
1. We input the decimal and put it in an int array.
2. Run a loop over the int array to get each digit and convert it into its binary form.
3. Place all the binary numbers into a larger array of size 4*(decimal no. length)
4. Print the larger int array.

BCD to decimal:
1. We input the BCD into a character array and put it in an int array.
2. Run a loop over the int array to check if it is a multiple of 4 and all the inputs are 0s and 1s.
3. Run a loop over the int array to get each set of 4 bits and put it into a function to convert it to its decimal form as long as it is within the range of 0 to 9 (4 bits go upto 15)
4. Print the int array where we store all the digits in the decimal number.
