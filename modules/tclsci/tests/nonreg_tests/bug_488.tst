// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 488 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=488
//
// <-- Short Description -->
//    Bug Report Id: 122062003795731
//     seems to have popped up in 2.7.2 - did not happen in 2.7.1
//
//
//
//    On Scilab 2.7.2 with " Help menu or Editor Menu " function
//    The Error Messages are:
//       !--error   999
//    TK_EvalStr, Can't find a usable init.tcl in the following directories:
//        {C:/Program Files/Scilab-2.7.2\tcl\tcl8.3} {C:/Program Files/Scilab-2.7.2\tcl\tcl8.3} {C:/Program Files/Scilab-2.7.2
//    /tcl/tcl8.3} {C:/Program Files/Scilab-2.7.2/lib/tcl8.3}
//
//
//
//    This probably means that Tcl wasn't installed properly.
//     at line 1
//    at line      13 of function tcltk_help               called by :
//    line    22 of function run_help                 called by :
//    line    46 of function browsehelp               called by :
//    line    10 of function help                     called by :
// ...


// bug488
// 489, 491 492 496 duplicate

// rechercher l'existance du r�pertoire tcl sous Scilab

tcl_dir = getenv('SCI')+"/modules/tclsci/tcl";
if ~(isdir(tcl_dir)) then pause,end

if isdir(tcl_dir) & (getos() == 'Windows') then
	// si oui rechercher l'existance du fichier init.tcl sous un repertoire de tcl
	tcl_list = basename(listfiles(listfiles(tcl_dir+"/tcl*")+"/init.*"));
	if (grep ( tcl_list , "init") == []) & ( grep ( tcl_list , "INIT") == []) then pause,end
end // du if
