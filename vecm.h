#ifndef LIBVEC_H
#define LIBVEC_H

extern float *_vec_add(float *const v1, float *const v2, int len); // v1 + v2
extern float *_vec_sub(float *const v1, float *const v2, int len); // v1 - v2
extern float *_vec_mul(float *const v1, float *const v2, int len); // v1 * v2
extern float *_vec_div(float *const v1, float *const v2, int len); // v1 / v2
extern float _vec_dot(float *const v1, float *const v2, int len); // v1 dot v2
extern float *_vec3_cross(float *const v1, float *const v2, int len); // v1 x v2
extern float *_vec_max(float *const v1, float *const v2, int len); // max(v1, v2)
extern float *_vec_min(float *const v1, float *const v2, int len); // min(v1, v2)
extern float *_vec_sadd(float *const v1, const int scalar, int len); // v1 + scalar
extern float *_vec_ssub(float *const v1, const int scalar, int len); // v1 - scalar
extern float *_vec_smul(float *const v1, const int scalar, int len); // v1 * scalar
extern float *_vec_sdiv(float *const v1, const int scalar, int len); // v1 / scalar
extern float _vec_len(float *const v1, int len); // length of v1
extern float *_vec_norm(float *const v1, int len); // normalize v1
extern float *_vec_neg(float *const v1, int len); // -v1
extern float *_vec_abs(float *const v1, int len); // |v1|


#endif