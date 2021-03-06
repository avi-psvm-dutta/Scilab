// Copyright (C) 2008 - INRIA - Michael Baudin
// Copyright (C) 2010 - DIGITEO - Michael Baudin
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

function flag = MY_assert_equal ( computed , expected )
    if ( and ( computed==expected ) ) then
        flag = 1;
    else
        flag = 0;
    end
    if flag <> 1 then pause,end
endfunction

function checkassert ( flag , errmsg , ctype )
    if ( ctype == "success" ) then
        MY_assert_equal ( (flag==%t) & (errmsg==""), %t )
    else
        MY_assert_equal ( (flag==%f) & (errmsg<>""), %t )
    end
endfunction

format("v",10);

// Check error message when number of arguments is false
instr = "assert_checkequal ( )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 10000 );
//
instr = "assert_checkequal ( 1 )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 10000 );
//
instr = "[o1,o2,o3]=assert_checkequal ( 1 , 1 )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 999 );

//////////////////////////////////////////
// Check error message when type of arguments is false
instr = "assert_checkequal ( ""a"" , 2 )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 10000 );
//
instr = "assert_checkequal ( 1 , ""b"" )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 10000 );
//////////////////////////////////////////
// Check error message when size of arguments are not equal
instr = "assert_checkequal ( 1 , [2 3] )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 10000 );
//
// Check that the error message is correctly handled.
instr = "assert_checkequal ( [1 2], [3 4] )";
ierr=execstr(instr,"errcatch");
MY_assert_equal ( ierr , 10000 );
errmsg = lasterror();
refmsg = msprintf( gettext( "%s: Assertion failed: expected = %s while computed = %s (mean diff = %s)" ) , "assert_checkequal" , "[3 ...]" , "[1 ...]", "-2");
MY_assert_equal ( errmsg , refmsg );
//
[flag , errmsg] = assert_checkequal ( %T , %T );
checkassert ( flag , errmsg , "success" );
//
[flag , errmsg] = assert_checkequal ( %F , %T );
checkassert ( flag , errmsg , "failure" );
//
[flag , errmsg] = assert_checkequal ( %nan , %nan );
checkassert ( flag , errmsg , "success" );
//
[flag , errmsg] = assert_checkequal ( list() , list() );
checkassert ( flag , errmsg , "success" );
//
[flag , errmsg] = assert_checkequal ( [%T %F], [%T %F] );
checkassert ( flag , errmsg , "success" );
//
// Test all IEEE values
[flag , errmsg] = assert_checkequal ( [1 %inf -%inf %nan] , [1 %inf -%inf %nan] );
checkassert ( flag , errmsg , "success" );
//
[flag , errmsg] = assert_checkequal ( [] , [] );
checkassert ( flag , errmsg , "success" );
////////////////////////////////////////////////////////
// Check complex entries.
[flag , errmsg] = assert_checkequal(complex(%nan,%nan),complex(%nan,0));
checkassert ( flag , errmsg , "failure" );
//
[flag , errmsg] = assert_checkequal(complex(%nan,%inf),complex(%nan,0));
checkassert ( flag , errmsg , "failure" );
//
[flag , errmsg] = assert_checkequal(complex(%nan,%nan),complex(0,%nan));
checkassert ( flag , errmsg , "failure" );
//
[flag , errmsg] = assert_checkequal(complex(%nan,%inf),complex(0,%inf));
checkassert ( flag , errmsg , "failure" );
//
[flag , errmsg] = assert_checkequal(complex(0,%inf),complex(0,%inf));
checkassert ( flag , errmsg , "success" );
//
[flag , errmsg] = assert_checkequal(complex(%nan,%nan),complex(%nan,%nan));
checkassert ( flag , errmsg , "success" );
//
[flag , errmsg] = assert_checkequal(complex(%inf,%nan),complex(%inf,%nan));
checkassert ( flag , errmsg , "success" );
//
////////////////////////////////////////////////////////
// Check various types
//
//  Mlist
s=mlist(["V","name","value"],["a","b";"c" "d"],[1 2; 3 4]);
t=s;
assert_checkequal(s, t);
//
//  Tlist
s=tlist(["V","name","value"],["a","b";"c" "d"],[1 2; 3 4]);
t=s;
assert_checkequal(s, t);
//
// Polynomial
s=poly(0,"s");
t=s;
assert_checkequal(s, t);
//
// Sparse
s=spzeros(3,5);
t=s;
assert_checkequal(s, t);
s(1)=12;
instr="assert_checkequal(s, t)";
ierr=execstr(instr,"errcatch");
MY_assert_equal(ierr, 10000);

//
// Boolean
s=(ones(3,5)==ones(3,5));
t=s;
assert_checkequal(s, t);
//
// Sparse Boolean
s=(spzeros(3,5)==spzeros(3,5));
t=s;
assert_checkequal(s, t);
s(1)=%f;
instr="assert_checkequal(s, t)";
ierr=execstr(instr,"errcatch");
MY_assert_equal(ierr, 10000);

//
// Integer  8
s=int8(3);
t=s;
assert_checkequal(s, t);
//
// String
s="foo";
t=s;
assert_checkequal(s, t);
//
// List
s=list("foo",2);
t=s;
assert_checkequal(s, t);
//
// Hypermatrix
// - Double
s = rand(2,2,2);
t = s;
assert_checkequal(s,t);
// - int8
s = int8(rand(2,2,2));
t = s;
assert_checkequal(s,t);
// - wrong type
s = rand(2,2,2);
t = int8(s);
instr="assert_checkequal(s, t)";
ierr=execstr(instr,"errcatch");
MY_assert_equal(ierr, 10000);


















