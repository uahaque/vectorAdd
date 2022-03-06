# Location of the CUDA Toolkit
NVCC := $(CUDA_PATH)/bin/nvcc
CCFLAGS := -O2 -g -std=c++11
EXTRA_NVCCFLAGS := --cudart=shared

build: vectorAdd

vectorAdd.o:vectorAdd.cu
	$(NVCC) $(INCLUDES) $(CCFLAGS) $(GENCODE_FLAGS) -o $@ -c $<

vectorAdd: vectorAdd.o
	$(NVCC) $(LDFLAGS) $(EXTRA_NVCCFLAGS) $(GENCODE_FLAGS) -o $@ $+ $(LIBRARIES)

clean:
	rm -f vectorAdd *.o
