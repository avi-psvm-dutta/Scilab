// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 8622 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=8622
//
// <-- Short Description -->
// Iserting counter in a cell should not create a reference but clone object.

for i = 1:2; c{i} = i; end;
if c{1} <> 1 then pause, end
if c{2} <> 2 then pause, end
