/*
 *  \author ...
 */

#include "somm24.h"

#include <stdint.h>

namespace group 
{

// ================================================================================== //

    void memAddNodeToFreeList(MemNode *p)
    {
        soProbe(407, "%s(%p)\n", __func__, p);

        require(memFreeList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(p != nullptr, "p must be a valid pointer");

        /* TODO POINT: Replace next instruction with my code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

    void memAddNodeToOccupiedList(MemNode *p)
    {
        soProbe(408, "%s(%p)\n", __func__, p);

        require(memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(p != nullptr, "p must be a valid pointer");

        /* TODO POINT: Replace next instruction with my code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

