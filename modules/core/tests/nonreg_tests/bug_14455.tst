// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Clement David
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//<-- CLI SHELL MODE -->

function test()
    d = dir(".")
    d.name(1)
endfunction

t1 = macr2tree(test);

