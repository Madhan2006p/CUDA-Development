# 🚀 CUDA Programming – GPU Computing Basics

This repository contains my hands-on learning and implementation of **CUDA (Compute Unified Device Architecture)** using **NVIDIA GPUs**.  
The project focuses on understanding **GPU parallel programming**, CUDA memory management, and kernel execution through simple and clear examples.

All programs are compiled and executed on a **GPU-enabled Jupyter/Linux environment**.

---

## 🧠 Concepts Covered

- CUDA kernel programming using `__global__`
- Parallel execution using GPU threads
- GPU memory allocation with `cudaMalloc`
- Data transfer using `cudaMemcpy`
- Thread indexing with `threadIdx`, `blockIdx`, and `blockDim`
- Safe bounds checking in kernels
- Difference between CPU and GPU execution

---

## ✅ Programs Implemented

### 1️⃣ Hello World (CUDA)
- Verifies CUDA installation and GPU execution
- Launches a simple kernel on the GPU

### 2️⃣ Vector Addition
- Parallel addition of two arrays using GPU threads
- Each thread processes one element

### 3️⃣ Vector Subtraction
- Parallel subtraction of two arrays
- Demonstrates GPU memory allocation and data transfer

---

## 🧩 Sample CUDA Kernel

```cpp
__global__ void vecAdd(int *a, int *b, int *c, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n)
        c[idx] = a[idx] + b[idx];
}

