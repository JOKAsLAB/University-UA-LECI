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
    void swpInit(SwappingPolicy policy)
    {
        const char *pas;
        switch (policy)
        {
            case FIFO: pas = "FIFO"; break;
            case FirstFit: pas = "FirstFit"; break;
            case UndefSwappingPolicy: pas = "UndefSwappingPolicy"; break;
            default: pas = "Unknown policy"; break;
        }
        soProbe(601, "%s(%s)\n", __func__, pas);

        require(swappingPolicy == UndefSwappingPolicy, "Module is not in a valid closed state!");
        require(swpList == UNDEF_SWP_NODE and swpTail == UNDEF_SWP_NODE, "Module is not in a valid closed state!");
        require(policy == FIFO or policy == FirstFit, "Given policy is not valid");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

