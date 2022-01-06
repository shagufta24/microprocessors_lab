#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

// Function declarations:
char* int_add(char* bin1, char* bin2, int size);
long double int_bintodec(char* bin, int sign, int size);
char* int_multiply(char* bin1, char* bin2);
char* substring(char* str, int pos, int len);
int simple_to_int(char* bin);
long double float_to_dec(char sign, char* exp, char* mantissa);
long double float_to_dec25(char sign, char* exp, char* mantissa);
void float_add();
char* mantissa_multiply(char* bin1, char* bin2);
void float_multiply();

int main()
{
    // Taking input
    char choice;
    printf("\nEnter your choice:\n(i for integer (or) r for real number)\n ");
    scanf("%c", &choice);

    if (choice == 'i')
    {
        printf("\nPlease enter 32 bit binary signed integers only.\n");

        // First integer
        char bin1[33];
        int binlen = 0;
        while (binlen != 32)
        {
            printf("\nEnter binary value 1: ");
            scanf("%s", bin1);
            binlen = strlen(bin1);
        }
        int sign1 = bin1[0] - 48;

        // Second integer
        char bin2[33];
        binlen = 0;
        while (binlen != 32)
        {
            printf("\nEnter binary value 2: ");
            scanf("%s", bin2);
            binlen = strlen(bin2);
        }
        int sign2 = bin2[0] - 48;

        printf("\nInput 1: %Lf\n", int_bintodec(bin1, sign1, 32));
        printf("Input 2: %Lf\n", int_bintodec(bin2, sign2, 32));

        printf("\n*** ADDITION ***\n");
        char* sum = int_add(bin1, bin2, 33);
        int sum_sign = sum[0] - 48;

        printf("\nThe sum is:\nBINARY: %s\nDECIMAL: %Lf\n", sum, int_bintodec(sum, sum_sign, 32));

        printf("\n*** MULTIPLICATION ***\n");
        char* product = int_multiply(bin1, bin2);
        int product_sign = product[0] - 48;

        printf("\nThe product is:\nBINARY:%s\nDECIMAL: %Lf\n", product, int_bintodec(product, product_sign, 64));
    }

    else if (choice == 'r'){

        printf("\nPlease enter 32 bit IEEE 754 floating point numbers only.\n");

        char bin1[32];
        char bin2[32];
 
        //Taking input
        printf("Enter binary value 1: ");
        scanf("%s", bin1);
        printf("Enter binary value 2: ");
        scanf("%s", bin2);

        float_multiply(bin1, bin2);
        float_add(bin1, bin2);
    }

    else{
        printf("Incorrect input, try again.\n");
        return 0;
    }

    return 0;
}

// INTEGER ADDITION
char* int_add(char* bin1, char* bin2, int size){

    char* result = malloc(size * sizeof(char));
    int i = strlen(bin1) - 1;
    int carry = 0; // initial carry is 0
    int temp, num1, num2;

    while (i >= 0){ // i iterates backwards over the string

        num1 = bin1[i] - 48; // converting char to int
        num2 = bin2[i] - 48;

        temp = num1 + num2 + carry; //ADDING

        // 4 Possible outcomes
        if (temp == 0){
            result[i] = '0';
            carry = 0;
        }
        else if (temp == 1){
            result[i] = '1';
            carry = 0;
        }
        else if (temp == 2){
            result[i] = '0';
            carry = 1;
        }
        else if (temp == 3){
            result[i] = '1';
            carry = 1;
        }
        i--;
    }
    return result;
}

// INTEGER MULTIPLICATION
char* int_multiply(char* bin1, char* bin2){

    //To hold each intermediate sum during multiplication
    char* temp = malloc(64 * sizeof(char)); 

    //The digit from bin2 that is being multiplies with bin1
    int digit; 

    //Keeps track of the current iteration of multiplication
    int cnt = 0;

    int i = 31;
    int j, k;
    char* result = malloc(64 * sizeof(char));

    //Initializing the result to 0
    for (j = 0; j < 64; j ++){
        result[j] = '0';
    }
    
    //Looping over each digit of bin2 from the back
    while (i >= 0){

        //Initializing temp to 0
        for (j=0; j < 64; j++){
            temp[j] = '0';
        }
        
        //Handling special case when bin2 is negative
        //Instead of multiplying, the twos complement of bin1 is used as temp
        if (i == 0 && bin2[0] == '1'){

            // Finding 1s complement
            char* onescomp = malloc(32* sizeof(char));
            strcpy(onescomp, bin1);
            for (int j = 0; j < 32; j++){
                if (onescomp[j] == '0'){
                    onescomp[j] = '1';
                }
                else if (onescomp[j] == '1'){
                    onescomp[j] = '0';
                }
            }

            //Finding 2s complement
            char* twoscomp = malloc(64*sizeof(char));
            twoscomp = int_add(onescomp, "00000000000000000000000000000001", 32);

            //printf("\nSpecial Case:\nBin1: %s\nTwoscomp: %s\n", bin1, twoscomp);


            //Extending digits on the left to fit 64 bits
            //Also leaving out cnt number of zeroes from the back end
            char leftmost = twoscomp[0];
            if (leftmost == '0'){  
                for(int i = 0; i < 32; i++){
                    temp[i + 32 - cnt] = twoscomp[i];
                }
            }  
            else if (leftmost == '1'){
                for(int i = 0; i < 32; i++){
                    temp[i + 32 - cnt] = twoscomp[i];
                }
                for (int i = 0; i <= 63 - 32 - cnt; i++){
                    temp[i] = '1';
                }
            }  
        }

        //Regular case
        else {
            //Current digit of bin2 being multiplied
            digit = bin2[i] - 48;

            //Multiplying with each char of bin1 
            //j iterates over the entire string bin1
            //Also leaving out cnt number of zeroes from the back end in each iteration
            //Hence k is the position at which result chars should be added to temp
            for (int j = 31, k = 63 - cnt; j >= 0; j--, k--){
                temp[k] = ((bin1[j] - 48) * digit) + '0';
            }

            //leftmost filled position
            int leftmost = 63 - cnt - 32 + 1;  
            char left_dig = temp[leftmost];

            //Leftmost Bit extension to fit 64 bits
            for (int j = leftmost - 1; j >= 0; j--){
                temp[j] = left_dig;
            }
        }

        //Adding the intermediate sum temp to the result
        //printf("\ntemp: %Lf\n", int_bintodec(temp, temp[0] - 48, 64));
        result = int_add(temp, result, 64);
        //printf("current sum: %Lf\n", int_bintodec(result, result[0] - 48, 64));
        cnt++;
        i--;
    }

    return result; //final product
}

// REAL NUMBER ADDITION
void float_add(char* bin1, char* bin2){

    //Extracting mantissa, exponent and sign bit
    char sign1 = bin1[0];
    char* exp1 = malloc(8*sizeof(char));
    strcpy(exp1, substring(bin1, 1, 8));
    char* man1 = malloc(23*sizeof(char));
    strcpy(man1, substring(bin1, 9, 23));

    char sign2 = bin2[0];
    char* exp2 = malloc(8*sizeof(char));
    strcpy(exp2, substring(bin2, 1, 8));
    char* man2 = malloc(23*sizeof(char));
    strcpy(man2, substring(bin2, 9, 23));

    printf("\n*** ADDITION ***\n");

     // Making the implicit '1' in mantissa explicit
    char* man1_new = malloc(24*sizeof(char));
    char* man2_new = malloc(24*sizeof(char)); //Extended mantissas

    man1_new[0] = '1';
    man2_new[0] = '1'; //Setting explicit 1

    for (int i = 0; i < 23; i++){  //Setting rest of the bits
        man1_new[i+1] = man1[i];
        man2_new[i+1] = man2[i];
    }
    //printf("\nExtended mantissas:\nMantissa 1: %s\nMantissa 2: %s\n", man1_new, man2_new);

    //Decimal forms of exponent
    int dec_exp1 = simple_to_int(exp1) - 127;
    int dec_exp2 = simple_to_int(exp2) - 127;

    printf("\nExponents in decimal form:\nExponent 1: %d\nExponent 2: %d\n", dec_exp1, dec_exp2);

    //Final sign of the answer
    int final_sign;
    if (abs(dec_exp1) > abs(dec_exp2)){ final_sign = man1_new[0]; }
    else{ final_sign = man2_new[0]; }

    //Shifting decimal places to make exponents of the same order
    char* final_exp;

    if (dec_exp1 > dec_exp2){ 
        final_exp = exp1;

        //No. of places to be shifted
        int diff = dec_exp1 - dec_exp2;
        printf("\nSecond number is shifted right by %d places.", diff);
        //printf("Before: %s\n", man2_new);

        //Shifting decimal point to the left
        for (int i = 23; i >= diff; i--){
            man2_new[i] = man2_new[i-diff];
        }
        //Adding zeroes in first 'diff' bits
        for (int i = 0; i < diff; i++){
            man2_new[i] = '0';
        }
        printf("\nShifted mantissas:\nMantissa 1: %s\nMantissa 2: %s\n", man1_new, man2_new);
    }
    else if (dec_exp2 > dec_exp1){
        final_exp = exp2;

        //No. of places to be shifted
        int diff = dec_exp2 - dec_exp1;
        printf("\nFirst number is shifted right by %d places\n", diff);
        printf("Before: %s\n", man1_new);

        //Shifting decimal point to the left
        for (int i = 23; i >= diff; i--){
            man1_new[i] = man1_new[i-diff];
        }
        //Adding zeroes in first 'diff' bits
        for (int i = 0; i < diff; i++){
            man1_new[i] = '0';
        }
        printf("\nShifted mantissas:\nMantissa 1: %s\nMantissa 2: %s\n", man1_new, man2_new);
    }
    else{
        final_exp = exp1;
    }

    //Converting input binary floats to decimal
    long double input1 = float_to_dec(sign1, final_exp, man1_new);
    long double input2 = float_to_dec(sign2, final_exp, man2_new);

    //Converting negative float to 2s complement
    if (sign1 == '1'){
        printf("\nFirst number is negative.");
        char* onescomp1 = malloc(24 * sizeof(char));
        strcpy(onescomp1, man1_new);

        for (int j = 0; j < 24; j++){
            if (onescomp1[j] == '0'){
                onescomp1[j] = '1';
            }
            else if (onescomp1[j] == '1'){
                onescomp1[j] = '0';
            }
        }
        printf("\n1s complement: %s", onescomp1);
        
        char* twoscomp1 = malloc(24 * sizeof(char));
        twoscomp1 = int_add(onescomp1, "000000000000000000000001", 24);

        man1_new = twoscomp1;
        printf("\n2s compl of Mantissa 1: %s\n", man1_new);  
    }

    if (sign2 == '1'){
        printf("\nSecond number is negative.");
        char* onescomp2 = malloc(24* sizeof(char));
        strcpy(onescomp2, man2_new);

        for (int j = 0; j < 24; j++){
            if (onescomp2[j] == '0'){
                onescomp2[j] = '1';
            }
            else if (onescomp2[j] == '1'){
                onescomp2[j] = '0';
            }
        }
        printf("\n1s complement: %s", onescomp2);
        
        char* twoscomp2 = malloc(24*sizeof(char));
        twoscomp2 = int_add(onescomp2, "000000000000000000000001", 24);

        man2_new = twoscomp2;
        printf("\n2s compl of Mantissa 2: %s\n", man2_new);
    }


    //If there is carry at the end of addition, flag = 1
    int flag = 0;
    if (man1_new[0] == '1' && man2_new[0] == '1'){
        flag = 1;
    }

    //Adding mantissas
    char* mantissa_sum = int_add(man1_new, man2_new, 24); //Sum of mantissas
    if (flag == 1){
        //Need to accomodate for carry bit
        for (int i = strlen(mantissa_sum) - 1; i > 0; i--){
            mantissa_sum[i] = mantissa_sum[i-1];
        }
        mantissa_sum[0] = '1';
    }
    printf("\nMantissa Sum: %s\n", mantissa_sum);

    printf("\nYour inputs:\nInput1: %Lf\nInput2: %Lf\n", input1, input2);

    //Finding final sum
    // char* final_sum = malloc(32 * sizeof(char));

    // final_sum[0] = (char)final_sign;

    // for(int i = 0; i < 8; i++){
    //     final_sum[i + 1] = final_exp[i];
    // }
    // for(int i = 0; i < 23; i++){
    //     final_sum[i + 9] = mantissa_sum[i];
    // }
    
    printf("\nFINAL SUM: %d%s%s", final_sign - 48, final_exp, mantissa_sum);

    long double final_sum_dec; //in decimal form
    if (flag == 1){
        final_sum_dec = float_to_dec25(final_sign, final_exp, mantissa_sum);
    }
    else{
        final_sum_dec = float_to_dec(final_sign, final_exp, mantissa_sum);
    }   
    //printf("\nIn decimal: %Lf", final_sum_dec);
    printf("\nIn decimal: %Lf\n", input1 + input2);  

    //Freeing mallocs
    free(man1);
    free(man2);
    free(man1_new);
    free(man2_new);
    free(exp1);
    free(exp2);
    //free(final_sum);
}

// REAL NUMBER MULTIPLICATION
void float_multiply(char* bin1, char* bin2){

    //Extracting mantissa, exponent and sign bit
    char sign1 = bin1[0];
    char* exp1 = malloc(8*sizeof(char));
    strcpy(exp1, substring(bin1, 1, 8));
    char* man1 = malloc(23*sizeof(char));
    strcpy(man1, substring(bin1, 9, 23));

    char sign2 = bin2[0];
    char* exp2 = malloc(8*sizeof(char));
    strcpy(exp2, substring(bin2, 1, 8));
    char* man2 = malloc(23*sizeof(char));
    strcpy(man2, substring(bin2, 9, 23));

    printf("\nNumber 1:\nMantissa: %s\nExponent: %s\nSign: %ch\n", man1, exp1, sign1);
    printf("\nNumber 2:\nMantissa: %s\nExponent: %s\nSign: %ch\n", man2, exp2, sign2);
    
    printf("\n*** MULTIPLICATION ***\n");


     // Making the implicit '1' in mantissa explicit
    char* man1_new = malloc(24*sizeof(char));
    char* man2_new = malloc(24*sizeof(char)); //Extended mantissas

    man1_new[0] = '1';
    man2_new[0] = '1'; //Setting explicit 1

    for (int i = 0; i < 23; i++){  //Setting rest of the bits
        man1_new[i+1] = man1[i];
        man2_new[i+1] = man2[i];
    }

    man1_new[24] = '\0';
    man2_new[24] = '\0';
    printf("\nExtended mantissas:\nMantissa 1: %s\nMantissa 2: %s\n", man1_new, man2_new);

    char* mantissa_product = mantissa_multiply(man1_new, man2_new);
    mantissa_product[24] = '\0';
    printf("\nMantissa product: %s\n", mantissa_product);
    
    //Final exponent = e1 + e2 - 127 + 1 
    //               = e1 + e2 + 10000001 + 1
    char* temp1 = int_add(exp1, exp2, 8);
    char* temp2 = int_add(temp1, "10000001", 8);
    char* final_exp = int_add(temp2, "00000001", 8);
    printf("Final exponent: %s\n", final_exp);

    //Final sign
    char final_sign;
    if (sign1 == sign2){final_sign = '0';}
    else{final_sign = '1';}
    printf("Final sign: %ch\n", final_sign);

    //Converting input binary floats to decimal
    long double input1 = float_to_dec(sign1, exp1, man1_new);
    long double input2 = float_to_dec(sign2, exp2, man2_new);
    printf("\nYour inputs:\nInput1: %Lf\nInput2: %Lf\n", input1, input2);

    //Final product
    long double final_product_dec = float_to_dec(final_sign, final_exp, mantissa_product);
    printf("\nFINAL PRODUCT: %d%s%s\n", final_sign - '0', final_exp, mantissa_product);
    printf("In decimal: %Lf\n", final_product_dec);
}

// CONVERTING BINARY FLOAT TO DECIMAL
long double float_to_dec(char sign, char* exp, char* mantissa){
    long double mantissa_dec = 0; 

    if (mantissa[0] == '1'){ //If there is a 1 before decimal point, add it
        mantissa_dec = mantissa_dec + 1;
    }
    for(int i = 1; i < 24; i++){ 
        // Add the rest of the digits
        // Formula: m[1]*(2^0) + m[2]*(2^-1) + m[3]*(2^-2)+ .....
        mantissa_dec = mantissa_dec + ((mantissa[i] - 48) * (1 / pow(2, i)));
    }

    int exp_dec = simple_to_int(exp) - 127; //Exp in decimal form

    //Formula: (-1)^sign * mantissa_value * 2^exponent_value
    if (sign == '1'){
        return ((-1) * mantissa_dec * pow(2, exp_dec));
    }
    if (sign == '0'){
        return (mantissa_dec * pow(2, exp_dec));
    }
}

long double float_to_dec25(char sign, char* exp, char* mantissa){

    long double mantissa_dec = 2; 
    for(int i = 2; i < 25; i++){ 
        mantissa_dec = mantissa_dec + ((mantissa[i] - 48) * (1 / pow(2, i-1)));
    }
    int exp_dec = simple_to_int(exp) - 127;
    if (sign == '1'){
        return ((-1) * mantissa_dec * pow(2, exp_dec));
    }
    if (sign == '0'){
        return (mantissa_dec * pow(2, exp_dec));
    }
    
}

// MULTIPLICATION OF MANTISSAS
char* mantissa_multiply(char* bin1, char* bin2){
    
    //To hold each intermediate sum during multiplication
    char* temp = malloc(48 * sizeof(char)); 

    //The digit from bin2 that is being multiplies with bin1
    int digit; 

    //Keeps track of the current iteration of multiplication
    int cnt = 0;

    int i = 23;
    int j, k;
    char* result = malloc(48 * sizeof(char));

    //Initializing the result to 0
    for (j = 0; j < 48; j ++){
        result[j] = '0';
    }
    
    //Looping over each digit of bin2 from the back
    while (i >= 0){

        //Initializing temp to 0
        for (j=0; j < 48; j++){
            temp[j] = '0';
        }

        //Current digit of bin2 being multiplied
        digit = bin2[i] - '0';

        //Multiplying with each char of bin1 
        //j iterates over the entire string bin1
        //Also leaving out cnt number of zeroes from the back end in each iteration
        //Hence k is the position at which result chars should be added to temp
        for (int j = 23, k = 47 - cnt; j >= 0; j--, k--){
            temp[k] = ((bin1[j] - 48) * digit) + '0';
        }

        //Adding the intermediate sum temp to the result
        result = int_add(temp, result, 48);
        cnt++;
        i--;
    }
    return result; //final product
}

// CONVERTING BINARY INTEGER TO DECIMAL
long double int_bintodec(char* bin, int sign, int size){

    int i;
    long double dec;
    int cnt;   

    // Positive binary integers
    if (sign == 0){
        cnt = 0;
        dec = 0;
        // Formula: a[31]*2^0 + a[30]*2^1 + .... + a[0]*2*31
        for (i = (size - 1); i > 0; i--) {
            dec = dec + ((bin[i] - 48)* pow((double)2, (double)cnt));
            cnt++;
        }
    }

    // Negative binary integers 
    if (sign == 1){
        dec = 0;
        long double power = pow(2.0, size-1);
        for (i = 0; i < size; ++i)
        {
            if (i == 0 && bin[i] != '0'){
                dec = power * -1;    
            }
            else {
                dec += (bin[i] - 48) * power;
            }
            power /= 2;
        }
    }
    return dec;
}

// EXTRACT SUBSTRING
char* substring(char* str, int pos, int len){
    char* sub = malloc(len * sizeof(char));
    int cnt = 0;
    while (cnt < len) 
    {
      sub[cnt] = str[pos + cnt];
      cnt++;
    }
    return sub;
}

// SIMPLE BINARY NUMBER TO DECIMAL INTEGER
int simple_to_int(char* bin)
{
    int res = 0;
    for (int i = strlen(bin) - 1; i >= 0; i--) {
        res = res + ((bin[i] - '0') * pow(2, strlen(bin) - i - 1));
    }
    return res;
}


