// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 10503 -->
//
// <-- CLI SHELL MODE -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=10503
//
// <-- Short Description -->
// error(999.666) did trunc error code without an error

msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: string expected.\n"), "error", 1);
assert_checkerror("error(999.666)", msgerr);
assert_checkerror("error(999)", msgerr);
