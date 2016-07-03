// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ???? - INRIA - Farid BELAHCENE
// Copyright (C) 2008 - INRIA - Pierre MARECHAL
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function z = bitor(x,y)

    // BITOR function
    // Given x,y two positives integers this function returns the decimal
    // number whose the binary form is the OR of the binary representations
    // of x and y

    // -Inputs :
    //  x, y :  scalars/vectors/matices of positives integers,
    //          x and y must have the same size
    // -Output :
    //  z : scalar/vector/matrix
    //
    // F.Belahcene

    // P. Marechal, 5 Feb 2008
    //   - fix bug 2691 and 2692
    //   - Add argument check

    // Check input arguments
    // =========================================================================

    rhs = argn(2);

    if rhs <> 2 then
        error(msprintf(gettext("%s: Wrong number of input argument(s): %d expected.\n"),"bitor",2));
    end

    if typeof(x)<>typeof(y)
        error(msprintf(gettext("%s: Wrong type for input arguments: Same types expected.\n"),"bitor"));
    end

    if or(size(x)<>size(y)) then
        error(msprintf(gettext("%s: Wrong size for input arguments: Same size expected.\n"),"bitor"));
    end

    if isempty(x) & isempty(x)
        z=[];
        return
    end

    if    (type(x)==1  & (x-floor(x)<>0 | x<0)) ..
        | (type(x)==8  & (inttype(x)<10) ) ..
        | (type(x)<>1  & type(x)<>8) then

        error(msprintf(gettext("%s: Wrong input argument #%d: Scalar/matrix of unsigned integers expected.\n"),"bitor",1));
    end

    if    (type(y)==1  & (y-floor(y)<>0 | y<0)) ..
        | (type(y)==8  & (inttype(y)<10) ) ..
        | (type(y)<>1  & type(y)<>8) then

        error(msprintf(gettext("%s: Wrong input argument #%d: Scalar/matrix of unsigned integers expected.\n"),"bitor",2));
    end

    // Algorithm
    // =========================================================================

    if type(x)==8 then
        z = x | y;
    else
        a = 2^32;
        z = double( uint32(x/a) | uint32(y/a) ) * a;
        z = z + double(uint32(x-z) | uint32(y-z));
    end

endfunction
