/*
 *  \author ...
 */

#include "somm24.h"

#include <stdio.h>

namespace group
{

// ================================================================================== //

    uint32_t jdtLoad(FILE *fin, uint32_t maxSize)
    {
        soProbe(204, "%s(%p, %#x)\n", __func__, fin, maxSize);

        require(fin != nullptr and fileno(fin) != -1, "fin must be a valid file stream");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

