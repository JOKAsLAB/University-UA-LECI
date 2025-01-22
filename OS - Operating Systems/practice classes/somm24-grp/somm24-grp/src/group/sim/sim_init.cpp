/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    /*
     * \brief Init the module's internal data structure
     */
    void simInit(FILE *fin)
    {
        soProbe(101, "%s(%p)\n", __func__, fin);

        require(simTime == UNDEF_TIME and submissionTime == UNDEF_TIME
                    and runoutTime == UNDEF_TIME, "Module is not in a valid closed state!");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

