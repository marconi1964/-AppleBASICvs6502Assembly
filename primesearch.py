# Python3
# Check the numbers of prime

def isPrime(n):
    for i in range(2, n//2+1):
        if (not (n%i)):
            return 0;
    return 1;

numPrimes = 0;

# Check withint the range from 2 to isit
isit = 256;
for i in range(2, isit): 
    numPrimes += isPrime(i);

print(str(numPrimes));
