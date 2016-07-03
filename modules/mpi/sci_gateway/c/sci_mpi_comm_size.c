/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2007-2009 - DIGITEO - Sylvestre LEDRU
 *
 * Copyright (C) 2012 - 2016 - Scilab Enterprises
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */
#include <stdio.h>
#include "gw_mpi.h"
#include "sci_mpi.h"
#include "api_scilab.h"
#include "Scierror.h"
#include "localization.h"
#include "sci_malloc.h"

/**
 * This function returns the rank of a process
 */
int sci_mpi_comm_size(char *fname, void* pvApiCtx)
{
    SciErr sciErr;
    int comm_size;
    MPI_Comm comm = MPI_COMM_WORLD;
    int *piAddr = NULL;
    double dblReal = 0;

    CheckInputArgument(pvApiCtx, 0, 1);            // Check the parameters of the function ... Here 0 or 1
    CheckOutputArgument(pvApiCtx, 1, 1);            // The output of the function (1 parameter)

    if (nbInputArgument(pvApiCtx) == 1)
    {
        sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddr);
        if (sciErr.iErr)
        {
            printError(&sciErr, 0);
            Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, 1);
            return 0;
        }

        if (getScalarDouble(pvApiCtx, piAddr, &dblReal))
        {
            Scierror(999, _("%s: Wrong type for input argument #%d: A scalar integer value expected.\n"), fname, 1);
            return 0;
        }

        comm = (MPI_Comm)(int)dblReal;
    }

    MPI_Comm_size(comm, &comm_size);
    if (createScalarDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, (double)comm_size))
    {
        Scierror(999, _("%s: Memory allocation error.\n"), fname);
        return 0;
    }

    AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
    ReturnArguments(pvApiCtx);
    return 0;
}
