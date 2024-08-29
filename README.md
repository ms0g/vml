# SIMD-Accelerated Vector Math Library
### Overview
This library provides a set of SIMD-accelerated routines for performing vector mathematics on x86 architectures. It is implemented in x86 assembly to leverage the power of SIMD (Single Instruction, Multiple Data) instructions, offering significant performance improvements for vector operations.
### Features

- **High Performance:** Leverages SIMD instructions(SSE) to perform vector math operations efficiently.
- **Assembly Optimization:** Written in x86 assembly for maximum control over instruction usage and performance.
- **Wide Range of Operations:** Includes basic operations like addition, subtraction, multiplication, and dot product, as well as more complex functions like vector normalization.
- **Supports Various Data Types:** Handles vectors with different data types, including 32-bit and 64-bit floating-point numbers.

### Requirements

- x86 CPU with support for SSE instructions.
- [nasm](https://www.nasm.us "Nasm project page") (>= 2.15)
- C/C++ compiler for linking the library with higher-level code (optional).


### Building
```bash
make
```
## Usage
```C
#include <stdio.h>
#include <stdlib.h>

#include "vml.h"

int main(int argc, char** argv) {
    float v1[] = {1, 3, 5, 7, 9};
    float v2[] = {2, 4, 6, 8, 10};
    float result[5];

    unsigned int size = sizeof(v1)/sizeof(float);
    
    _vec_add(result, v1, v2, size);
 
    for (int i = 0; i < size; i++) {
        printf("%f\n", result[i]);
    }

    return 0;
}
```
### Benchmark
```bash
➜  bin git:(main) ✗ ./benchmark
No SIMD: 0.000004
SIMD: 0.000002
```

### Contributing

Contributions to improve the game are welcome! If you have ideas for enhancements or bug fixes, feel free to fork the repository, make your changes, and submit a pull request.

### License

This project is licensed under the LGPL License. See the LICENSE file for details.

### Credits

Developed by M. Sami Gürpınar

