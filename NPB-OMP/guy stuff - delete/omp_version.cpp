#include <omp.h>
#include <iostream>

int main() {
    #pragma omp parallel
    {
        #pragma omp master
        {
            std::cout << "OpenMP version " << _OPENMP << " (format: YYYYMM)" << std::endl;
        }
    }
    return 0;
}
