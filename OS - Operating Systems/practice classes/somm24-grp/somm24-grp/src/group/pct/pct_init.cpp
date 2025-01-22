/*
 *  \author ...
 */

#include "somm24.h"

namespace group 
{

// ================================================================================== //

    void pctInit() 
    {
        soProbe(301, "%s()\n", __func__);

        require(pctList == UNDEF_PCT_NODE, "The PCT linked list must not exist");
        
        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

