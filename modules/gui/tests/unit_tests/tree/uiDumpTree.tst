// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Sylvestre KOUMAR
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH TREE -->

lines(0)

// test to check the dumped tree

// tree dumping error test
refMsg = msprintf(_("%s: Wrong number of input arguments: %d to %d expected.\n"), "uiDumpTree",1,2);
assert_checkerror("uiDumpTree()", refMsg);

refMsg = msprintf(_("%s: Wrong type for input argument #%d: uitree expected.\n"), "uiDumpTree",1);
assert_checkerror("uiDumpTree(123)", refMsg);
assert_checkerror("uiDumpTree(123, 123)", refMsg);
assert_checkerror("uiDumpTree(123, %F)", refMsg);
assert_checkerror("uiDumpTree(123, %T)", refMsg);

refMsg = msprintf(_("Wrong number of input arguments."));
assert_checkerror("uiDumpTree(123, 123, 123)", refMsg);

// node creation
leaf11 = uiCreateNode("leaf 1.1", "iconLeaf1.1", "callbackLeaf1.1");
leaf12 = uiCreateNode("leaf 1.2", "iconLeaf1.2", "callbackLeaf1.2");
leaf31 = uiCreateNode("leaf 3.1", "iconLeaf3.1", "callbackLeaf3.1");
leaf32 = uiCreateNode("leaf 3.2", "iconLeaf3.2", "callbackLeaf3.2");
node1 = uiCreateNode("Node 1", "iconNode1", "callbackNode1");
node2 = uiCreateNode("Node 2", "iconNode2", "callbackNode2");
node3 = uiCreateNode("Node 3", "iconNode3", "callbackNode3");
root = uiCreateNode("Root", "iconRoot", "callbackRoot");

// right inputs
uiDumpTree(leaf11);
uiDumpTree(leaf11,%F);
uiDumpTree(leaf11,%T);

// wrong inputs
refMsg = msprintf(_("%s: Wrong type for input argument #%d: Boolean expected.\n"), "uiDumpTree",2);
assert_checkerror("uiDumpTree(leaf11,123)", refMsg);


// node creation with errors
refMsg = msprintf(_("%s: Wrong number of input arguments: %d to %d expected.\n"), "uiCreateNode",1,3);
assert_checkerror("myErrorNode1 = uiCreateNode()", refMsg);

// right inputs
refMsg = msprintf(_("Undefined variable: %s\n"), "myErrorNode1");
assert_checkerror("uiDumpTree(myErrorNode1)", refMsg);
assert_checkerror("uiDumpTree(myErrorNode1, %F)", refMsg);
assert_checkerror("uiDumpTree(myErrorNode1, %T)", refMsg);
//wrong
assert_checkerror("uiDumpTree(myErrorNode1, 123)", refMsg);

refMsg = msprintf(_("%s: Wrong type for input argument #%d: String expected.\n"), "uiCreateNode",1);
assert_checkerror("myErrorNode2 = uiCreateNode(123)", refMsg);
assert_checkerror("myErrorNode3 = uiCreateNode(123, ''icon of My Node'')", refMsg);

// right inputs
refMsg = msprintf(_("%s: Wrong type for input argument #%d: String expected.\n"), "uiCreateNode",2);
assert_checkerror("myErrorNode4 = uiCreateNode(''My Node'', 123)", refMsg);

refMsg = msprintf(gettext("%s: Wrong type for input argument #%d: String expected.\n"), "uiCreateNode",1);
assert_checkerror("myErrorNode5 = uiCreateNode(123, ''icon of My Node'', ''callback of My Node'')", refMsg);

refMsg = msprintf(gettext("%s: Wrong type for input argument #%d: String expected.\n"), "uiCreateNode",2);
assert_checkerror("myErrorNode6 = uiCreateNode(''My Node'', 123, ''callback of My Node'')", refMsg);

refMsg = msprintf(gettext("%s: Wrong type for input argument #%d: String expected.\n"), "uiCreateNode",3);
assert_checkerror("myErrorNode6 = uiCreateNode(''My Node'', ''icon of My Node'', 123)", refMsg);

refMsg = msprintf(_("Wrong number of input arguments."));
assert_checkerror("myErrorNode8 = uiCreateNode(''My Node'', ''icon of My Node'', ''callback of My Node'', ''test'')", refMsg);
assert_checkerror("myErrorNode9 = uiCreateNode(''My Node'', ''icon of My Node'', ''callback of My Node'', 123)", refMsg);


// tree creation
treeOnlyNode1 = uiCreateTree(node1);

// right inputs
uiDumpTree(treeOnlyNode1);
uiDumpTree(treeOnlyNode1,%F);
uiDumpTree(treeOnlyNode1,%T);

// wrong inputs
refMsg = msprintf(_("%s: Wrong type for input argument #%d: Boolean expected.\n"), "uiDumpTree",2);
assert_checkerror("uiDumpTree(treeOnlyNode1,123)", refMsg);

treeNode1 = uiCreateTree(node1, leaf11,leaf12);
treeNode3 = uiCreateTree(node3, leaf31,leaf32);
treeRoot = uiCreateTree(root, node1,node2,node3);

// right inputs
uiDumpTree(treeRoot);
uiDumpTree(treeRoot,%F);
uiDumpTree(treeRoot,%T);

// wrong inputs
refMsg = msprintf(_("%s: Wrong type for input argument #%d: Boolean expected.\n"), "uiDumpTree",2);
assert_checkerror("uiDumpTree(treeRoot,123)", refMsg);

// tree creation with wrong inputs
refMsg = msprintf(_("%s: Wrong number of input argument(s): At least %d expected.\n"), "uiCreateTree",1);
assert_checkerror("uiCreateTree()", refMsg);

// right inputs
refMsg = msprintf(_("Undefined variable: %s\n"), "myTree");
assert_checkerror("uiDumpTree(myTree)", refMsg);
assert_checkerror("uiDumpTree(myTree, %F)", refMsg);
assert_checkerror("uiDumpTree(myTree, %T)", refMsg);
assert_checkerror("uiDumpTree(myTree, 123)", refMsg);

refMsg = msprintf(_("%s: Wrong type for input argument #%d: uitree expected.\n"), "uiCreateTree",1);
assert_checkerror("myTree = uiCreateTree(123)", refMsg);


refMsg = msprintf(_("%s: Wrong type for element %d of input argument #%d: uitree expected.\n"), "uiCreateTree", 3, 2);
assert_checkerror("myTree = uiCreateTree(root, node1, node2, 123)", refMsg);

// tree creation with invalid nodes
refMsg = msprintf(_("Undefined variable: %s\n"), "myErrorNode1");
assert_checkerror("uiDumpTree(myErrorNode1)", refMsg);
assert_checkerror("myTree = uiCreateTree(myErrorNode1, node1, node2, 123)", refMsg);
assert_checkerror("myTree = uiCreateTree(root, myErrorNode1,node2,node3)", refMsg);
assert_checkerror("myTree = uiCreateTree(root, node1,myErrorNode1,node3)", refMsg);
assert_checkerror("myTree = uiCreateTree(root, node1,node2,myErrorNode1)", refMsg);





