// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 8397 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=8397
//
// <-- Short Description -->
// After detection of variable/equation difference, the error message should be
// printed on the scilab console but must not deactivate xcos simulation.
//


src_file = TMPDIR + "/sample_imf.mo";
function_file = TMPDIR + "/sample_imf_functions.mo";
xml_file = TMPDIR + "/sample_imSim.xml";
c_file = TMPDIR + "/sample_im.c";

// unsolvable system of equation
mo_content = [..
"class sample_imf";..
"    Real `a` """";";..
"    Real `b` """";";..
"    Real `c` """";";..
"equation";..
"    a = b + 3 * c;";..
"    c = a + 3 * b;";..
"end sample_imf;";..
""];

// Creating source content
fd = mopen(src_file, "wt");
mputl(mo_content, fd);
mclose(fd);

// override messagebox method
save_messagebox = messagebox;
p = funcprot();
funcprot(0);
function messagebox(msg, Title, icon, isModal), endfunction
funcprot(p);

// modelicac call
ok = modelicac(src_file, function_file, xml_file, %t, c_file, %f);
assert_checkequal(ok, %f);

messagebox = save_messagebox;
