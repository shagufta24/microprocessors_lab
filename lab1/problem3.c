#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

int bcdtodecimal(int bin[]);

int main(int argc, char *argv[]) {

// 2 arguments must be entered
if (argc != 3){
  printf("\nIncorrect input format.\n");
  return 0;
}

int choice = atoi(argv[1]); // User's choice
int num;

if (choice == 1) { // Decimal to BCD

  num = atoi(argv[2]); // Decimal number
  int length=0;
  int i, k=0, l =0, j;

  int binary[4]={0} ;


  for(i=num; i>0 ; i= i/10) // length of decimal number entered
      {
          length++ ;
      }

      int decimal[length]; //decimal number in array form
      int bcd[4*length];   //final bcd number

  //initializing arrays to 0
  for(i=0; i<length; i++)
  {
    decimal[i] = 0;
  }

  for(i=0; i<4*length; i++)
  {
    bcd[i] = 0;
  }

  
  for(i=length-1; i>=0; i--) // putting each number into array
  {
      decimal[i]= num%10;
      num= num/10;
  }

    for(i=0;i<length;i++)
     {
       int x = decimal[i];
       for(j=3; j>=0; j--) // converting into BCD value
       {
         binary[j]=x%2;
         x = x/2;
       }
       // for (l=0; l<4;l++) //printing BCD value
       // {
       //     printf("%d " , binary[l]);
       // }

       for(l=0;l<4;l++) //  combining all binary arrays into bcd array
       {
           bcd[k]=binary[l];
           // printf("%d " , bcd[l]);
           k++;
       }
     }

  printf("\nBCD form:\n");
  for (i=0; i<length*4;i++) //printing BCD value
  {
      printf("%d " , bcd[i]);
  }
  printf("\n");


}
 else if (choice == 2) { //BCD to decimal

   int i,j,k=0;
   int n = strlen(argv[2]); //length of input binary number

   if (n % 4 != 0 ) {
     printf("\nWrong input 2. Try again.\n");
     exit(0);
   }

   char c[n];
   int binary[n];
   int decimal[n/4];
   int bin[4];
   strcpy(c, argv[2]);

  for (i = 0; i < n; i++)
  {
    binary[i] = c[i] - '0';
    // printf("%d\n", decimal[i]);
  }

  for (i = 0; i < n; i++)
  {
    if(binary[i] != 0 && binary[i] != 1)
    {
      printf("\nWrong input 2. Only binary digits please.\n");
      exit(0);
    }

  }

  //Converting to decimal
  for (i = 0; i < n; i+=4)
  {
    for (j = 0; j < 4; j++) {
      bin[j] = binary[i+j];
    }
    decimal[k] = bcdtodecimal(bin);
    k++;
  }

  for (i = 0; i < n/4; i++){
    if(decimal[i] == -1)
    {
      printf("\nIt is not possible to have BCD for numbers above 9. Try again.\n");
      exit(0);
    }
  }

  printf("\nDecimal Form: \n");
  for (i = 0; i < n/4; i++){
    printf("%d", decimal[i]);
  }
  printf("\n");

}

 else {
   printf("\nWrong input 1. Please try again.\n");
 }

 return 0;
}


int bcdtodecimal(int bin[]){
  int i;
  int decimal = 0;
  int adder;
  for(i=3; i>=0; i--)
  {
    adder = pow(2, i);
    decimal += adder*bin[3-i];
    // printf(" %d " , decimal);
  }
   if(decimal<10)
   {
     return decimal;
   }
   else{
     return -1;
   }
}
