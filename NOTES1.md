# Day 1 – Compilation stages and Makefile

## Compilation stages
- **Preprocessor (`gcc -E`):** each #include is replaced with the code, comments are removed and changed to an empty space.
- **Compiler (`gcc -S`):** translates C to assembler for this particular file, main doesn't exactly know the code of the functions defined elsewhere, so it can only call them. Also it catches typos and syntax errors.
- **Assembler (`gcc -c`):** .o is an object file containing machine code, "nm" command shows those symbols, U means there is a lack of code, its undefined, while T means that there is a code.
- **Linker:** Connects object files and fits each U to their respective T.

## Header files
- .h files declare that a certain function is defined in another file, for example mathutil.c in which the function is defined, the functions are called in main.c
- protected the file using 
#ifndef MATHUTIL_H
#define MATHUTIL_H
#endif
it prevents the problem of header files being copied to the same .c file multiple times. Without the guard I got a "redefinition of struct" error, meaning certain defined structure got defined multiple times in the same source file.

## Two errors to remember
- `implicit declaration of function` – linker didn't get the declaration of a function (lack of implementation) 
- `undefined reference to` – compiler didn't get a header file

## Makefile
- dependecies among the files describe if a change to a file will require to recompile another file
- Make compares the date of modification of files and rebuilds only the ones older than it's dependencies (if i touch mathutil.c, only mathutil .o gets rebuilt)