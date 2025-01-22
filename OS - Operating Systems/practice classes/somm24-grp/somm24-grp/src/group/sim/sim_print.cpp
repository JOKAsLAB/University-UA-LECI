/*
 *  \author ...
 */

#include "somm24.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{

// ================================================================================== //

    void simPrint(FILE *fout, uint32_t satelliteModules)
    {
        soProbe(103, "%s(\"%p\")\n", __func__, fout);

        require(simTime != UNDEF_TIME, "Module not in a valid open state!");
        require(fout != NULL and fileno(fout) != -1, "fout must be a valid file stream");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

