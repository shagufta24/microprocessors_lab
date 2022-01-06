#include<stdio.h>
#include<stdlib.h>
#include<math.h>


void intunsigned(int, unsigned int);
void intsigned(int, int);
void floatbinary(float);
void doublebinary(double);

//utility functions

//prints the array
void print(int arr[], int size){
  int i;
  printf("\nBinary representation:\n");
  for(i=0;i<size;i++){
  printf("%d ", arr[i]);
  }
  printf("\n");
}

//calculates binary bit of the num
int binarycalc(unsigned int num)
{
        return num % 2;
}

int decimalbinary(float decimal)
{
  int val = decimal*2;
  return val;
}

int a,b;
unsigned int c;
float d;
double e;

int main(int argc, char *argv[]) {

// 3 arguments must be entered
  if (argc != 4){
    printf("\nIncorrect input format.\n");
    return 0;
  }

 a = atoi(argv[1]);
 b = atoi(argv[2]);

 if (a == 1 && b == 0)
 {
   sscanf(argv[3], "%u", &c);
   intunsigned(b, c);
 }

 else if (a == 1 && b == 1)
 {
   sscanf(argv[3], "%d", &c);
   intsigned(b, c);
 }

 else if (a == 2 && b == 0)
 {
   printf("\nUnsigned float does not exist.\n");
 }

  else if (a == 2 && b == 1)
  {
    sscanf(argv[3], "%f", &d);
    floatbinary(d);
  }

  else if (a == 3 && b == 0)
  {
    printf("\nUnsigned double does not exist.\n");
  }

  else if (a == 3 && b == 1)
  {
    sscanf(argv[3], "%lf", &e);
    doublebinary(e);
  }

  else {
  printf("\nIncorrect inputs.\n");
  exit(0);
}
 return 0;
}

void intunsigned(int sign, unsigned int num)
{
  int binary[32];
  int i;

  for(i=0; i<32; i++)   //initializing binary array to zero
  {
    binary[i] = 0;
  }

  if(num < 0)
  {
    printf("\nNumber out of range: Unsigned number cannot have negative value\n");
    exit(0);
  }

  else
  {
    if (num == 0)
    {
      print(binary, 32);
      exit(0);
    }
    else {
      unsigned int temp = num;
      for(i=31; i>=0; i--)
      {
        binary[i] = binarycalc(temp);
        temp = temp/2;
      }
      print(binary, 32);
      exit(0);
      }
    }
}


void intsigned(int sign, int num)
{
  int binary[32];
  int onescomplement[32];
  int twoscomplement[32];
  int i;

  //initializing binary array to zero
  for(i=0; i<32; i++)
  {
    binary[i] = 0;
    onescomplement[i] = 0;
    twoscomplement[i] = 0;
  }

  //signed number +ve
    if(num>=0)
    {
      int temp = num;
      if (num == 0)
      {
          print(binary, 32);
          exit(0);
      }

      else{
         binary[0] = 0;
         for(i=31; i>0; i--)
         {
           binary[i] = binarycalc(temp);
           temp = temp/2;
         }
         print(binary, 32);
         exit(0);
           }
    }

    else if(num<0)
    {
      int temp = num*(-1);
      binary[0] = 0;

      if (num == 0)
      {
          print(binary, 32);
          exit(0);
      }

         for(i=31; i>0; i--)
         {
           binary[i] = binarycalc(temp);
           temp = temp/2;
         }

        for (i = 31; i >= 0; i--) {
          if(binary[i] == 0)
          {
            onescomplement[i] = 1;
          }
          else if(binary[i] == 1)
          {
            onescomplement[i] = 0;
          }
        }
        int carry = 1;
        for(i = 31; i >= 0; i--) {
          if(onescomplement[i] == 1 && carry == 1)
          {
              twoscomplement[i] = 0;
          }
          else if(onescomplement[i] == 0 && carry == 1)
          {

              twoscomplement[i] = 1;
              carry = 0;
          }
          else
          {
              twoscomplement[i] = onescomplement[i];
          }
        }
         print(twoscomplement, 32);
         exit(0);
    }
}



//for float type priitive datatype
void floatbinary(float num)
{
  int floatingpoint[32];
  int binary[32];
  int mantissa[23]; //stores only mantissa vals
  int i,j;
  int temp;
  float decimal; //fraction part of decimal
  int counter=0; // to count the number of useless zeroes before the first one, to take mantissa in the 1.M form
  int exp = 0;
  int exponent[8];
  int len;

  for(i=0; i<32; i++)   //initializing arrays to zero
  {
    binary[i] = 0;
    floatingpoint[i] = 0;
  }

//code for sign bit in final array - floatingpoint
  if(num>=0)
  {
    floatingpoint[0] = 0;
  }
  else
  {
    floatingpoint[0] = 1;
    num = num * (-1);
  }
  temp = num;

// begin binary conversion of the decimal number
  if (temp == 0) {
    len = 1;
  }
  else
  {
    len = (log(temp)/log(2)) + 2;  //get length of the pat before decimal
  }
  binary[len] = '.';  //alue 46 will be stored in array
  if (temp == 0)
  {
    binary[len] = 0;
  }
  else
  {
    for(i=len-1; i>=0; i--)
    {
      binary[i] = binarycalc(temp);
      temp = temp/2;
    }
  }

  temp = num; //reinitalize temp as it is now 0
  decimal = num - temp; // part after the decimal

  if(decimal == 0){
    for(i=len+1; i<32;i++)
    {
      binary[i] = 0;
    }
  }

  else{
    for(i=len+1; i<32;i++)
    {
      binary[i] = decimalbinary(decimal); //function to get binary of fractional part
      if(binary[i] == 1)
      {
        decimal = (decimal*2) - 1;
      }
      else{
        decimal = decimal*2;
      }
    }
  }

  //Beginning of mantissa part
int countonecheck = 0;
  for ( i = 0; i < 32; i++) {
    if(binary[i] == 1)
    {
      countonecheck++;
    }
  }
   if (countonecheck == 0) {
     for(i=0; i<32; i++)
     {
       printf(" %d",binary[i]);
     }
     exit(0);
   }

 for (i=0; binary[i]!=1;  i++) {
  counter++;
 }

 counter++; // because we need to ignore the first 1 too while taking mantissa
 j=0;
 for(i=counter; j<23; i++)
 {
   if(binary[i]==0 || binary[i]==1)
   {
     mantissa[j] = binary[i];
     j++;
   }
 }

 // begin exponent calculations
 j = 0;
 for (i = counter; binary[i]!=46; i++) {
  exp++;
 }
 exp+=127;
 // printf("\n exp: %d ", exp);

 for(i=0; i<8; i++)   //initializing array to zero
 {
   exponent[i] = 0;
 }

 //getting binary of exponent value
 for(i=7; i>=0; i--)
 {
   exponent[i] = binarycalc(exp);
   exp = exp/2;
 }

 // adding values into floating point array
 for(i=0; i<8; i++)
 {
   floatingpoint[i+1] = exponent[i];
 }

 for(i=0; i<23; i++){
   floatingpoint[i+9] = mantissa[i];
 }

print(floatingpoint, 32);

}


void doublebinary(double num) {

int floatingpoint[64];
int binary[64];
int mantissa[52]; //stores only mantissa vals
int i,j;
int temp;
float decimal; //fraction part of decimal
int counter=0; // to count the number of useless zeroes before the first one, to take mantissa in the 1.M form
int exp = 0;
int exponent[11];
int len;
for(i=0; i<64; i++)   //initializing arrays to zero
{
  binary[i] = 0;
  floatingpoint[i] = 0;
}

//code for sign bit in final array - floatingpoint
if(num>=0)
{
  floatingpoint[0] = 0;
}
else
{
  floatingpoint[0] = 1;
  num = num * (-1);

}
temp = num;

// begin binary conversion of the decimal number

if (temp == 0) {
  len = 1;
}
else
{
  len = (log(temp)/log(2)) + 2;  //get length of the pat before decimal
}
binary[len] = '.';  //alue 46 will be stored in array

for(i=len-1; i>=0; i--)
{
  if (temp == 0)
  {
    binary[1] = 0;
  }
  else{
    binary[i] = binarycalc(temp);
    temp = temp/2;
  }

}
temp = num; //reinitalize temp as it is now 0
decimal = num - temp; // part after the decimal


if(decimal == 0){
  for(i=len+1; i<64;i++)
  {
    binary[i] = 0;
  }
}
else{
  for(i=len+1; i<64;i++)
  {
    binary[i] = decimalbinary(decimal); //function to get binary of fractional part
    if(binary[i] == 1)
    {
      decimal = (decimal*2) - 1;
    }
    else{
      decimal = decimal*2;
    }
  }
}


  //Beginning of mantissa part
  int countonecheck = 0;
    for ( i = 0; i < 32; i++) {
      if(binary[i] == 1)
      {
        countonecheck++;
      }
    }
     if (countonecheck == 0) {
       for(i=0; i<64; i++)
       {
         printf(" %d",binary[i]);
       }
       exit(0);
     }

 for (i=0; binary[i]!=1;  i++) {
  counter++;
 }

 counter++; // because we need to ignore the first 1 too while taking mantissa
 j=0;
 for(i=counter; j<52; i++)
 {
   if(binary[i]==0 || binary[i]==1)
   {
     mantissa[j] = binary[i];
     j++;
   }
 }

 // begin exponent calculations
 j = 0;
 for (i = counter; binary[i]!=46; i++) {
  exp++;
 }
 exp+=1023;

 for(i=0; i<11; i++)   //initializing array to zero
 {
   exponent[i] = 0;
 }

 //getting binary of exponent value
 for(i=10; i>=0; i--)
 {
   exponent[i] = binarycalc(exp);
   exp = exp/2;
 }

 // adding values into floating point array

 for(i=0; i<11; i++)
 {
   floatingpoint[i+1] = exponent[i];
 }

 for(i=0; i<52; i++){
   floatingpoint[i+12] = mantissa[i];
 }

print(floatingpoint, 64);

}
