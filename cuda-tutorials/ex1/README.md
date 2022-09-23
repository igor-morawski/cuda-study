# Cuda Programming - Vector Addition - Hello World Example
1. Write C vector addition (ex1.c)
2. Convert to CUDA (ex1.cu).

Main differences:
* Function add_vector converted to GPU kernel:
Use ``` __global__ ``` to define a kernel function. A kernel function must return ```void```.
Other CUDA function declarations are ```__device__``` and ```__host__```.

|            | Executed on | Callable from |
|------------|-------------|---------------|
| ```__device__``` | device      | device        |
| ```__global__``` | device      | host          |
| ```__host__```   | host        | host          |

* ```__device__``` and ```__host__``` can be used together --> example @ https://forums.developer.nvidia.com/t/what-is-host-device/26709 (TL;DR to avoid duplication, the compiler will copy the function into the host and device compliation flow separately).

* running kernel with ```<<<# blocks, #threads in each block>>>```

3. Change the workflow of the main loop according to the template:

|                                                | code                                                                      |
|------------------------------------------------|------------------------------------------------|
| Allocate host memory and initialized host data | ```malloc()```                                                            |
| Allocate device memory                         | ```cudaMalloc(void **devPtr, size_t count);```                            |
| Transfer input data from host to device memory | ```cudaMemcpy(void *dst, void *src, size_t count, cudaMemcpyKind kind)``` |
| Execute kernels                                | ```kernel<<<nBlk,nTid>>>(args);```                                        |
| Transfer output from device memory to host     | ```cudaMemcpy(void *dst, void *src, size_t count, cudaMemcpyKind kind)``` |

* Memory managment

```cudaMalloc(void **devPtr, size_t count);```

```cudaFree(void *devPtr);```

