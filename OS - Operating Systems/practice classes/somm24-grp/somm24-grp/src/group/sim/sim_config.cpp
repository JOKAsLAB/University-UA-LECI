/*
 *  \author ...
 */

#include "somm24.h"

#include <stdio.h>
#include <string.h>

namespace group
{

// ================================================================================== //

    void simConfig(FILE *fin, SimParameters *spp)
    {
        soProbe(104, "%s(\"%p\")\n", __func__, fin);

        require(fin != nullptr and fileno(fin) != -1, "fin must be a valid file stream");
        require(spp != nullptr, "spp must be a valid pointer");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

