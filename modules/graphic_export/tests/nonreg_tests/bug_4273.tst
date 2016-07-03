// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 4273 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=4273
//
// <-- Short Description -->
// xs2file crashs
// 

scf(10);
plot3d();
title('Title in bold-italic');

xs2svg(10,TMPDIR+'/bug_4273.svg');
if fileinfo(TMPDIR+'/bug_4273.svg') == [] then pause,end

xs2png(10,TMPDIR+'/bug_4273.png');
if fileinfo(TMPDIR+'/bug_4273.png') == [] then pause,end

xs2bmp(10,TMPDIR+'/bug_4273.bmp');
if fileinfo(TMPDIR+'/bug_4273.bmp') == [] then pause,end

xs2gif(10,TMPDIR+'/bug_4273.gif');
if fileinfo(TMPDIR+'/bug_4273.gif') == [] then pause,end


