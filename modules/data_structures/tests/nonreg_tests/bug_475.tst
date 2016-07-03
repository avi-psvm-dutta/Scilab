//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 475 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=475
//
// <-- Short Description -->
//    Bug Report Id: 120442003624175150
//    m=min(a) and m=max(a) give correct results
//
//
//    On Scilab CVS with " min(), max() " function
//    The Error Messages are:
//                                                 !--error    59 
//    incorrect # of outputs in the function
//    arguments are :
//     x
//
//    Commands:  a=hypermat([3,3,1],uint16(1:9)); [m,k]=max(a)
//
//    or
//
//     a=hypermat([3,3,1],uint16(1:9)); [m,k]=min(a)
//
//    Enrico Segre on Linux version RH9 distribution  with  gnome as window manager
//    Israel  July 24, 2003 at 17:51:50

a = hypermat([3,3,1],uint16(1:9));

result = execstr("[m,k]=max(a)","errcatch","n");

if result <> 0 then pause,end

if result == 0 then
   if execstr("[m,k]=min(a)","errcatch","n") <> 0 then pause,end
end
