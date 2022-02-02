# Apple BASIC vs 6502 Assembly in Prime number search

When I watched this video, https://www.youtube.com/watch?v=3PcIJKd1PKU. It came to my mind that I should do a comparison on Apple II BASIC vs 6502 assembly (machine) language. Here is the result.

I use AppleWin emulator to run both Apple BASIC and 6502 assembly, and use stop watch to clock the time elapses. Considering the Apple II is running at 1MHz only, so I only count the numbers of Prime up to 255 (0xFFH). 

Since the assembly program is short, it is quicker for me to code in assembly code and manually translate into machine code than finding assembler and installation, etc. So primesearch.asm will not meet any kind of assembler syntax.

primesearch.c is also attached, but I did not spend effort to find Apple II C compiler yet. Once done, will compare how much deviation between C and Assembly, to see how complier efficiency is. (Python3 code is listed only for reference.)

The test result shows:

Language      | System  | Range in search  | Result of Primes | Time elapses (seconds)
--------------|:----------------:|:----------------:|-----------------:| ----------------------:
6502 Assembly | AppleWin emulator| 255 (0xFFH)      |  54 (0x36H)      |  1.01
Apple BASIC   | AppleWin emulator| 255              |  54              |  50.19
6502 Assembly | AppleIIjs emulator| 255 (0xFFH)      |  54 (0x36H)      |  1.10
Apple BASIC   | AppleIIjs emulator| 255              |  54              |  49.85
6502 Assembly | Agat emulator| 255 (0xFFH)      |  54 (0x36H)      |  1.31
Apple BASIC   | Agat emulator| 255              |  54              |  63.86

remark : 
- adding test result on [AppleIIjs emulator](https://www.scullinsteel.com/apple2/), which is similar to the result on AppleWin
- adding test result on Agat emulator (Russian version of Apple II emulator)

I will try to test it on my real Apple II system when I get back home.
