#ifndef VML_H
#define VML_H

#ifdef __cplusplus
extern "C"
{
#endif
extern void _vec_add(float* result, float* v1, float* v2, int len);         // v1 + v2
extern void _vec_sub(float* result, float* v1, float* v2, int len);         // v1 - v2
extern void _vec_mul(float* result, float* v1, float* v2, int len);         // v1 * v2
extern void _vec_div(float* result, float* v1, float* v2, int len);         // v1 / v2
extern void _vec_max(float* result, float* v1, float* v2, int len);         // max(v1, v2)
extern void _vec_min(float* result, float* v1, float* v2, int len);         // min(v1, v2)
extern void _vec_sadd(float* result, float* v1, int scalar, int len);       // v1 + scalar
extern void _vec_ssub(float* result, float* v1, int scalar, int len);       // v1 - scalar
extern void _vec_smul(float* result, float* v1, int scalar, int len);       // v1 * scalar
extern void _vec_sdiv(float* result, float* v1, int scalar, int len);       // v1 / scalar
extern void _vec_neg(float* result, float* v1, int len);                    // -v1
extern void _vec_abs(float* result, float* v1, int len);                    // |v1|
extern void _vec_norm(float* result, float* v1, int len);                   // normalize v1
extern float _vec_len(float* v1, int len);                                  // length of v1
extern float _vec_dot(float* v1, float* v2, int len);                       // v1 dot v2
#ifdef __cplusplus
}
#endif

#endif // VML_H
