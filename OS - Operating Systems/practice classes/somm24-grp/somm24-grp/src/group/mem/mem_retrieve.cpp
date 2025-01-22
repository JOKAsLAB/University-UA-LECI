/*
 *  \author ...
 */

#include "somm24.h"

#include <stdint.h>

namespace group 
{

// ================================================================================== //

    MemNode *memRetrieveNodeFromFreeList(uint32_t size, MemoryAllocationPolicy policy)
    {
        soProbe(409, "%s(%#x, %d)\n", __func__, size, policy);

        require(memFreeList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(policy == BestFit or policy == WorstFit, "Allocation policy must be 'BestFit' or 'WorstFit'");

        /* TODO POINT: Replace next instruction with my code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

    MemNode *memRetrieveNodeFromOccupiedList(uint32_t address)
    {
        soProbe(410, "%s(%#x)\n", __func__, address);

        require(memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");

        /* TODO POINT: Replace next instruction with my code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

