// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 8597 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=8597
//
// <-- Short Description -->
// Uncontrolled message of grand/clcg4 should be displayed as warning

warning("off");
grand('setgen',"clcg4");
grand('setsd',123456,123456,123456,123456);

warning("on");
grand('setgen',"clcg4");
grand('setsd',123456,123456,123456,123456);
