#include <iostream>

__global__ void sub(int *a , int *b , int *c) {
	int i = threadIdx.x;
	c[i] = a[i] - b[i];
}


int main() {
	
	int a[5] = {10 , 20 , 30 , 40 , 50 };
	int b[5] = {1 , 2 , 3 , 4 , 5};
	int c[5];

	size_t size = 5 * sizeof(int);
	int *d_a , *d_b , *d_c;

	// Allocate Memory in VRAM
	cudaMalloc(&d_a , size);
	cudaMalloc(&d_b , size);
	cudaMalloc(&d_c , size);

	//Copy Memory From CPU To GPU

	cudaMemcpy(d_a , a , size , cudaMemcpyHostToDevice);
	cudaMemcpy(d_b , b , size , cudaMemcpyHostToDevice);

	sub<<<1 , 256>>>(d_a , d_b , d_c);

	// Copy Memory From GPU to CPU

	cudaMemcpy(c , d_c , size , cudaMemcpyDeviceToHost);

	for(int e = 0; e < 5 ; e += 1) 
		std::cout << c[e] << " " ;
	std::cout << std::endl;
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);

	return 0;
}
