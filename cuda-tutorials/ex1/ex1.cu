#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#define N 80000
#define MAX_ERR 1e-6

//  __global__ defines a kernel function
__global__ void vector_add(float *out, float *a, float *b, int n) {
    for (int i=0; i < n; i++) out[i] = a[i] + b[i];
} 

int main(){
    float *a, *b, *out;
    float *d_a, *d_b, *d_out;

    // Allocate memory on
    a = (float*)malloc(sizeof(float) * N);
    b = (float*)malloc(sizeof(float) * N);
    out = (float*)malloc(sizeof(float) * N);

    // Initialize array
    for (int i = 0; i < N; i++) {
        a[i] = 1.0f;
        b[i] = 2.0f;
    }

    // Allocate memory on device
    cudaMalloc((void**)&d_a, sizeof(float) * N);
    cudaMalloc((void**)&d_b, sizeof(float) * N);
    cudaMalloc((void**)&d_out, sizeof(float) * N);


    // Transfer from host to device
    cudaMemcpy(d_a, a, sizeof(float) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, sizeof(float) * N, cudaMemcpyHostToDevice);

    // vector_add(out, a, b, N);
    // use one block, one thread --> going parallel in the next exercise 
    vector_add<<<1,1>>>(d_out, d_a, d_b, N);
    // <<<# blocks, #threads in each block>>>


    // Transfer result from device to host
    cudaMemcpy(out, d_out, sizeof(float) * N, cudaMemcpyDeviceToHost);

    // Verification  
    for(int i = 0; i < N; i++){
        assert(fabs(out[i] - a[i] - b[i]) < MAX_ERR);
    }
    printf("out[0] = %f\n", out[0]);

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_out);

    free(a);
    free(b);
    free(out);


    return 0;
}