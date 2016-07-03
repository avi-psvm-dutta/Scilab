// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function c=hsvcolormap(varargin)

    // Check number of input argument
    if size(varargin)<>1 then
        error(msprintf(gettext("%s: Wrong number of input argument(s): %d expected.\n"), "hsvcolormap", 1));
    end
    n=varargin(1);

    // Check type of input argument
    // Check if input argument is real
    if typeof(n)<>"constant" | ~isreal(n) then
        error(msprintf(gettext("%s: Wrong type for input argument #%d: a real scalar expected.\n"), "hsvcolormap", 1));
    end

    // Check size of input argument
    if size(n,"*")<>1 then
        error(msprintf(gettext("%s: Wrong size for input argument #%d: a real scalar expected.\n"), "hsvcolormap", 1));
    end
    h = (0:n-1)'/max(n,1);
    if isempty(h) then
        c = [];
    else
        c = hsv2rgb([h ones(n,2)]);
    end
endfunction
