# cuda-study
CUDA programming self-study. 

# Resources used 
* ECE408 for studying: [lectures](https://wiki.illinois.edu/wiki/display/ECE408/Class+Schedule), [labs](https://wiki.illinois.edu/wiki/display/ECE408/Labs)
* [cuda-tutorial](https://cuda-tutorial.readthedocs.io/en/latest/) - exercises


```export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin```


```nvprof ./vector_add
```