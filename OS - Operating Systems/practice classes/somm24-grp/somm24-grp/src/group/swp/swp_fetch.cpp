/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    uint16_t swpFetch(uint32_t sizeAvailable)
    {
        soProbe(605, "%s(%#x)\n", __func__, sizeAvailable);

        require(swappingPolicy == FIFO or swappingPolicy == FirstFit, "Module is not in a valid open state!");
        require(swpList != UNDEF_SWP_NODE and swpTail != UNDEF_SWP_NODE, "Module is not in a valid open state!");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

