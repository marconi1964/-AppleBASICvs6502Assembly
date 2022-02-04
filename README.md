# Apple BASIC vs 6502 Assembly in Prime number search

Inspired by this video [Python vs C/C++ vs Assembly side-by-side comparison](https://www.youtube.com/watch?v=3PcIJKd1PKU), I keep thinking of doing a comparison on Apple II BASIC vs 6502 assembly (machine) language. Here is the result.

I use my Apple II system as well as couples of emulators, AppleWin, Agat and AppleIIjs on web, to run both Apple BASIC and 6502 assembly, and use stop watch to clock the time elapses. Considering the Apple II is running at 1MHz only, so I only count the numbers of Prime up to 255 (0xFFH) to save time. Haha, my Apple II wins in this race, which is the fastest.

---
In the beginning, since the assembly program is short, it is quite quick for me to code in assembly code and manually translate into machine code (primesearch.asm) than finding assembler and installation, etc. Later, I do try [Merlin 32 Cross Assembler](https://brutaldeluxe.fr/products/crossdevtools/merlin/) from prime.s to generate objective file (prime and prime_output.txt), and use [CiderPress v4.1.0](https://a2ciderpress.com/) to create an Apple II disk including the object file. One interesting fact I learn from Ciderpress is the object file needs to add 4 bytes as a file descipter (though I need to dig out why yet.)

---
primesearch.c is also attached, but I did not spend effort to find Apple II C compiler yet. Once done, will compare how much deviation between C and Assembly, to see how complier efficiency is. (Python3 code is listed only for reference.)

The test result shows:

Language      | System  | Range in search  | Result of Primes | Time elapses (seconds)
--------------|:----------------:|:----------------:|-----------------:| ----------------------:
6502 Assembly | AppleWin emulator| 255 (0xFFH)      |  54 (0x36H)      |  1.01
Apple BASIC   | AppleWin emulator| 255              |  54              |  50.19
6502 Assembly | AppleIIjs emulator| 255 (0xFFH)      |  54 (0x36H)      |  1.10
Apple BASIC   | AppleIIjs emulator| 255              |  54              |  49.85
6502 Assembly | Agat emulator     | 255 (0xFFH)      |  54 (0x36H)      |  1.31
Apple BASIC   | Agat emulator     | 255              |  54              |  63.86
6502 Assembly | Apple II          | 255 (0xFFH)      |  54 (0x36H)      |  0.84
Apple BASIC   | Apple II          | 255              |  54              |  49.99

remark : 
- adding test result on [AppleIIjs emulator](https://www.scullinsteel.com/apple2/), which is similar to the result on AppleWin
- adding test result on Agat emulator (Russian version of Apple II emulator)

