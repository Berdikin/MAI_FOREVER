#include <stdio.h>
#include <stdlib.h>

__global__ void kernel(double *arr1, double *arr2, int n) {
	int i, idx = blockDim.x * blockIdx.x + threadIdx.x;			// Абсолютный номер потока
	int offset = blockDim.x * gridDim.x;						// Общее кол-во потоков
	for(i = idx; i < n; i += offset)	
		arr1[i] = arr1[i] < arr2[i] ? arr2[i] : arr1[i];
}

int main() {

	int i, n = 0;
	scanf("%d", &n);
	double *arr1 = (double *)malloc(sizeof(double) * n);
	double *arr2 = (double *)malloc(sizeof(double) * n);

	
	for(i = 0; i < n; i++){
		scanf("%lf", &arr1[i]);
	}

	for(i = 0; i < n; i++){
		scanf("%lf", &arr2[i]);
	}		

	double *dev_arr1, *dev_arr2;
	cudaMalloc(&dev_arr1, sizeof(double) * n);
	cudaMemcpy(dev_arr1, arr1, sizeof(double) * n, cudaMemcpyHostToDevice);

	cudaMalloc(&dev_arr2, sizeof(double) * n);
	cudaMemcpy(dev_arr2, arr2, sizeof(double) * n, cudaMemcpyHostToDevice);

	kernel<<<256, 256>>>(dev_arr1, dev_arr2, n);

	cudaMemcpy(arr1, dev_arr1, sizeof(double) * n, cudaMemcpyDeviceToHost);
	cudaFree(dev_arr1);

	cudaMemcpy(arr2, dev_arr2, sizeof(double) * n, cudaMemcpyDeviceToHost);
	cudaFree(dev_arr2);
	for(i = 0; i < n; i++)
		printf("%.10f ", arr1[i]);
	printf("\n");
	free(arr1);
	free(arr2);
	return 0;
}
