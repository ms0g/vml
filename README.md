# vml
SIMD-accelerated Vector Math Library
### Prerequisites
+ [nasm](https://www.nasm.us "Nasm project page") (>= 2.15)

### Building
```bash
make
```
### Usage
```C
#include <stdio.h>
#include <stdlib.h>

#include "vml.h"

int main(int argc, char** argv) {
    float v1[] = {1, 3, 5, 7, 9};
    float v2[] = {2, 4, 6, 8, 10};
    unsigned size = sizeof(v1)/sizeof(float);
    
    float *res = _vec_add(v1,v2, size);
 
    for (int i = 0; i < size; i++) {
        printf("%f\n", res[i]);
    }
    
    free(res);

    return 0;
}
```
```bash
➜  vml git:(main) ✗ ./main 
3.000000
7.000000
11.000000
15.000000
19.000000
```

