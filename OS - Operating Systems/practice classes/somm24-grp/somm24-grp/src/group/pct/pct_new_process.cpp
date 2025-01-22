/*
 *  \author ...
 */

#include "somm24.h"

#include <stdint.h>

namespace group 
{

// ================================================================================== //

    uint16_t pctNewProcess(double admissionTime, double lifetime, uint32_t memSize)
    {
        soProbe(304, "%s(%0.1f, %0.1f, %#x)\n", __func__, admissionTime, lifetime, memSize);

        require(pctList != UNDEF_PCT_NODE, "Module is not in a valid open state!");
        require(admissionTime >= 0, "Bad admission time");
        require(lifetime > 0, "Bad lifetime");
        require(memSize > 0, "Bad memory size");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

