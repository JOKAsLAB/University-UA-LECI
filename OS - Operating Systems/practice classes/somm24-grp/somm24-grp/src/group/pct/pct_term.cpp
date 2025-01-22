/*
 *  \author ...
 */

#include "somm24.h"

namespace group 
{

// ================================================================================== //

    void pctTerm() 
    {
        soProbe(302, "%s()\n", __func__);

        require(pctList != UNDEF_PCT_NODE, "Module is not in a valid open state!");
        
        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

