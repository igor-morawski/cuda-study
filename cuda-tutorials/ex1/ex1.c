#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#define N 80000
#define MAX_ERR 1e-6

void vector_add(float *out, float *a, float *b, int n) {
    for (int i=0; i < n; i++) out[i] = a[i] + b[i];
} 

int main(){
    float *a, *b, *out;

    // Alocate memory
    a = (float*)malloc(sizeof(float) * N);
    b = (float*)malloc(sizeof(float) * N);
    out = (float*)malloc(sizeof(float) * N);

    // Initialize array
    for (int i = 0; i < N; i++) {
        a[i] = 1.0f;
        b[i] = 2.0f;
    }

    vector_add(out, a, b, N);

    return 0;
}