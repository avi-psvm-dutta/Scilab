// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9396 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=9396
//
// <-- Short Description -->
// add_params() accepted duplicate keys.

p = init_param();
p = add_param(p, "field1", 10);
// Check that defining the key "field1" again yields an error
refMsg = msprintf(_("%s: Wrong value for input argument #%d: key ""%s"" already defined.\n"), "add_param", 2, "field1");
assert_checkerror("p = add_param(p, ''field1'', 10);", refMsg);
