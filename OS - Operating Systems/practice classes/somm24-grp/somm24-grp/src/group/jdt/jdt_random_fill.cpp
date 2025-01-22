/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    uint32_t jdtRandomFill(uint32_t seed, uint32_t n, uint32_t maxSize)
    {
        soProbe(205, "%s(%u, %u, %#x)\n", __func__, seed, n, maxSize);

        require(seed != 0, "seed must be different from 0");
        require(n >= 2, "At least 2 jobs are required");
        require(n <= MAX_JOBS, "More than MAX_JOBS jobs not allowed");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

