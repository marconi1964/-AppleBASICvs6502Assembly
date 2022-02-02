/******************************************************************************
Check the numbers of Prime within 255 (0xFFH)

                https://www.onlinegdb.com/online_c_compiler

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>

int isPrime(int n) {
    for (int i=2; i <= n/2; i++)
        if (!(n%i))
            return 0;
    return 1;
}

void main()
{
    int numPrime = 0;
    
    for (int i = 2; i < 255; i++)
        numPrime += isPrime(i);
        
    printf("%d\n", numPrime);
}
