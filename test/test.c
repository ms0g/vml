#include <stdio.h>
#include <stdlib.h>
#include "../include/vml.h"

int main(int argc, char** argv) {
    float v1[] = {3.0, 7.0, 9.0, 10.0, 13.0};
    float v2[] = {2.0, 4.0, 8.0, 5.0, 6.0};
    float aresult[5], sresult[5], mresult[5], dresult[5], max_result[5], min_result[5], 
            sadd_result[5],ssub_result[5], smul_result[5], sdiv_result[5], neg_result[5],
            abs_result[5], norm_result[5];

    unsigned int size = sizeof(v1)/sizeof(float);

    for (int i = 0; i < size; ++i) {
        printf("v1[%d]: %f v2[%d]: %f\n", i, v1[i], i, v2[i]);
    }
    
    _vec_add(aresult, v1, v2, size);
    _vec_sub(sresult, v1, v2, size);
    _vec_mul(mresult, v1, v2, size);
    _vec_div(dresult, v1, v2, size);
    _vec_max(max_result, v1, v2, size);
    _vec_min(min_result, v1, v2, size);
    _vec_sadd(sadd_result, v1, 10.0, size);
    _vec_ssub(ssub_result, v1, 10.0, size);
    _vec_smul(smul_result, v1, 10.0, size);
    _vec_sdiv(sdiv_result, v1, 10.0, size);
    _vec_neg(neg_result, v1, size);
    _vec_abs(abs_result, v1, size);
    _vec_norm(norm_result, v1, size);

    printf("_vec_add results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", aresult[i]);
    }

    printf("_vec_sub results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", sresult[i]);
    }

    printf("_vec_mul results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", mresult[i]);
    }

    printf("_vec_div results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", dresult[i]);
    }

    printf("_vec_max results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", max_result[i]);
    }

    printf("_vec_min results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", min_result[i]);
    }

    printf("_vec_sadd results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", sadd_result[i]);
    }

    printf("_vec_ssub results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", ssub_result[i]);
    }

    printf("_vec_smul results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", smul_result[i]);
    }
    
    printf("_vec_sdiv results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", sdiv_result[i]);
    }

    printf("_vec_neg results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", neg_result[i]);
    }

    printf("_vec_abs results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", abs_result[i]);
    }

    printf("_vec_norm results:\n");
    for (int i = 0; i < size; i++) {
        printf("%f\n", norm_result[i]);
    }

    printf("_vec_len of v1 result: %f\n", _vec_len(v1, size));

    printf("_vec_dot result: %f\n", _vec_dot(v1, v2, size));
    return 0;
}




