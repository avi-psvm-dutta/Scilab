// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 11076 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=11076
//
// <-- Short Description -->
// mlist('r'), tlist('r') returned a wrong error message

msgerr = msprintf(gettext("%ls: Can not create a %ls with input argument #%d.\n"), "mlist", "mlist", 1);
assert_checkerror ("mlist(''r'')", msgerr );

msgerr = msprintf(gettext("%ls: Can not create a %ls with input argument #%d.\n"), "tlist", "tlist", 1);
assert_checkerror ("tlist(''r'')", msgerr );
