/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    void swpInsert(uint16_t pid, uint32_t size)
    {
        soProbe(604, "%s(%hu, %u)\n", __func__, pid, size);

        require(swappingPolicy == FIFO or swappingPolicy == FirstFit, "Module is not in a valid open state!");
        require(swpList != UNDEF_SWP_NODE and swpTail != UNDEF_SWP_NODE, "Module is not in a valid open state!");
        require(pid != 0, "a valid process ID must be greater than zero");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

