// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 656 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=656
//
// <-- Short Description -->
//    Not the same behaviour between Linux mode and Windows mode :
//
//    isdir(getenv('SCI'))
//    isdir(getenv('SCI')+"/")
//
//    True for Linux, the first one is True for Windows and False 
//    for the second one

if ~isdir(getenv('SCI'))                            then pause,end
if ~isdir(getenv('SCI')+"/")                        then pause,end
if isdir(getenv('SCI')) <> isdir(getenv('SCI')+"/") then pause,end
