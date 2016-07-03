// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - S/E - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
s=poly(0,'s');
a=tril([s,s;s,1]);
assert_checkequal(a, [s,0*s;s,1]);

