/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    void simRun(uint32_t cnt)
    {
        soProbe(106, "%s(%u)\n", __func__, cnt);

        require(simTime != UNDEF_TIME, "Module not in a valid open state!");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

