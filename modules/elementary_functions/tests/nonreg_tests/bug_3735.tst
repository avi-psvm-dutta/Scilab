// <-- Non-regression test for bug 3735 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=3735
//
// <-- Short Description -->
// cat() is broken when working with matrix of strings.
// Scilab Project - Antoine ELIAS
// Copyright INRIA 2008
// Date : November 2008

// <-- CLI SHELL MODE -->

A = ["First Row";"Second Row"];
B = ["Third Row";"Fourth Row"];
result = cat(1,A,B)

if result <> ["First Row";"Second Row";"Third Row";"Fourth Row"] then pause,end

