#include <stdio.h>
#include <time.h>
#include "../include/vml.h"

int main(int argc, char** argv) {
    clock_t start;
    double elapsed;

    float v1[] = {3.0, 7.0, 9.0, 10.0, 13.0};
    float v2[] = {2.0, 4.0, 8.0, 5.0, 6.0};
    float result[5];
    
    unsigned int size = sizeof(v1)/sizeof(float);
    
    start = clock();
    for (int i = 0; i < size; ++i) {
        result[i] = v1[i] + v2[i];
    }
    elapsed = (double)((clock() - start)) / CLOCKS_PER_SEC;

    printf("No SIMD: %f\n", elapsed);

    start = clock();
    _vec_add(result, v1, v2, size);
    elapsed = (double)((clock() - start)) / CLOCKS_PER_SEC;

    printf("SIMD: %f\n", elapsed);
    return 0;
}