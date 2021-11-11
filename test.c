#include <stdio.h>
#include <stdlib.h>

#include "vecm.h"

int main(int argc, char** argv) {
    float v1[] = {3,7,9};
    float v2[] = {2,4,8};
    unsigned size = sizeof(v1)/sizeof(float);
    
    float *res = _vec_add(v1, v2, size);
 
    for (int i = 0; i < size; i++) {
        printf("%f\n", res[i]);
    }
    
    free(res);

    return 0;
}




