// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
// Copyright (C) 2013 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// prod
// Check error
d=[1 10;254 9];

assert_checkfalse(execstr("prod(d, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"), "prod",2,"""*"",""r"",""c"",""m"",""native"",""double""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"), "prod", 2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

//==============================================================================
// matrices of integer
i = uint8(d);

assert_checkfalse(execstr("prod(i, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"), "prod",2,"""*"",""r"",""c"",""m"",""native"",""double""");
assert_checkerror("prod(i, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(i, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"), "prod", 2);
assert_checkerror("prod(i, [""r"", ""c""])", refMsg);

assert_checkfalse(execstr("prod(i,""r"", ""nat"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: %s or %s expected.\n"),"prod", 3, """native""", """double""");
assert_checkerror("prod(i,""r"", ""nat"")", refMsg);

assert_checkfalse(execstr("prod(i,""r"", [""nat"" ""dble""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"), "prod", 3);
assert_checkerror("prod(i,""r"", [""nat"" ""dble""])", refMsg);

assert_checkfalse(execstr("prod(i,""orient"", ""t"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"), "prod",2,"""*"",""r"",""c"",""m""");
assert_checkerror("prod(i,""orient"", ""t"")", refMsg);

assert_checkfalse(execstr("prod(i,1,1)"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: string expected.\n"), "prod", 3);
assert_checkerror("prod(i,1,1)", refMsg);

//==============================================================================
// sparse matrices
d = sparse(d);
assert_checkfalse(execstr("prod(d, ""orient"")","errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"), "prod",2,"""*"",""r"",""c"",""m""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: string expected.\n"),"prod",2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

//==============================================================================
// boolean matrices
d = [%f %t;%t %f];
assert_checkfalse(execstr("prod(d, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),"prod",2,"""*"",""r"",""c"",""m"",""native"",""double""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"),"prod",2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

assert_checkfalse(execstr("prod(d,""r"", ""nat"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: %s or %s expected.\n"),"prod", 3, """native""", """double""");
assert_checkerror("prod(d,""r"", ""nat"")", refMsg);

assert_checkfalse(execstr("prod(d,""r"", [""nat"" ""dble""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"),"prod",3);
assert_checkerror("prod(d,""r"", [""nat"" ""dble""])", refMsg);

assert_checkfalse(execstr("prod(d,""orient"", ""t"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),..
"prod",2,"""*"",""r"",""c"",""m""");
assert_checkerror("prod(d,""orient"", ""t"")", refMsg);

assert_checkfalse(execstr("prod(d,1,1)"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: string expected.\n"),"prod",3);
assert_checkerror("prod(d,1,1)", refMsg);

//==============================================================================
// sparse boolean matrices
d = sparse(d);
assert_checkfalse(execstr("prod(d, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),..
"prod",2,"""*"",""r"",""c"",""m""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: string expected.\n"),"prod",2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

assert_checkfalse(execstr("prod(d,""r"", ""nat"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: ""%s"" or ""%s"" expected.\n"),"prod", 3, "native", "double");
assert_checkerror("prod(d,""r"", ""nat"")", refMsg);

assert_checkfalse(execstr("prod(d,""r"", [""nat"" ""dble""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: string expected.\n"),"prod",3);
assert_checkerror("prod(d,""r"", [""nat"" ""dble""])", refMsg);

assert_checkfalse(execstr("prod(d,""orient"", ""t"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),..
"prod",2,"""*"",""r"",""c"",""m""");
assert_checkerror("prod(d,""orient"", ""t"")", refMsg);

assert_checkfalse(execstr("prod(d,1,1)"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: string expected.\n"),"prod",3);
assert_checkerror("prod(d,1,1)", refMsg);

//==============================================================================
// hypermatrices
d = rand(2,2,2);
assert_checkfalse(execstr("prod(d, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"), "prod",2,"""*"",""r"",""c"",""m"",""native"",""double""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"),"prod",2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

//==============================================================================
// polynome
s = poly(0, "s");
d = [s s^2;s*%i 1];
assert_checkfalse(execstr("prod(d, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),"prod",2,"""*"",""r"",""c"",""m"",""native"",""double""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A scalar string expected.\n"),"prod",2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

//==============================================================================
// rational matrices
s = poly(0, "s");
d = [1/s 1/s^2; 1/s 1];
assert_checkfalse(execstr("prod(d, ""orient"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),"prod",2,"""*"",""r"",""c"",""m""");
assert_checkerror("prod(d, ""orient"")", refMsg);

assert_checkfalse(execstr("prod(d, [""r"", ""c""])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: string expected.\n"),"prod",2);
assert_checkerror("prod(d, [""r"", ""c""])", refMsg);

//empty matrices
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod([], typ(:)), 1);
    assert_checkequal(prod([], "*", typ(:)), 1);
    assert_checkequal(prod([], 1, typ(:)), []);
    assert_checkequal(prod([], 2, typ(:)), []);
    assert_checkequal(prod([], 3, typ(:)), []);
end

//=======================================================================
//float matrices
d=[1 10;254 9];
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod(d, typ(:)), 22860);
    assert_checkequal(prod(d, "*", typ(:)), 22860);
    assert_checkequal(prod(d, 1, typ(:)), [254 90]);
    assert_checkequal(prod(d, 2, typ(:)), [10;2286]);
    assert_checkequal(prod(d, 3, typ(:)), d);
end


//hypermatrices of floats
d=[1 10;254 9];d(:,:,2)=1;
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod(d, typ(:)), 22860);
    assert_checkequal(prod(d, "*", typ(:)), 22860);
    assert_checkequal(prod(d, 1, typ(:)), hypermat([1,2,2],[254;90;1;1]));
    assert_checkequal(prod(d, 2, typ(:)), hypermat([2,1,2],[10;2286;1;1]));
    assert_checkequal(prod(d, 3, typ(:)), [1,10;254,9]);
    assert_checkequal(prod(d, 5, typ(:)), d);
end

//=======================================================================
//matrices of short integers
i=uint8([1 10;254 9]);
T=list(list(),list("native"));
for typ=T
    assert_checkequal(prod(i, typ(:)), uint8(76));
    assert_checkequal(prod(i, "*", typ(:)), uint8(76));
    assert_checkequal(prod(i, 1, typ(:)), uint8([254 90]));
    assert_checkequal(prod(i, 2, typ(:)), uint8([10;238]));
    assert_checkequal(prod(i, 3, typ(:)), i);
end

assert_checkequal(prod(i, "double"), 22860);
assert_checkequal(prod(i, "*", "double"), 22860);
assert_checkequal(prod(i, 1, "double"), [254 90]);
assert_checkequal(prod(i, 2, "double"), [10;2286]);
assert_checkequal(prod(i, 3, "double"), double(i));

//with hypermatrices
i=uint8([1 10;254 9]);i(:,:,2)=uint8(1);
T = list(list(),list("native"));
for typ=T
    assert_checkequal(prod(i, typ(:)), uint8(76));
    assert_checkequal(prod(i, "*", typ(:)), uint8(76));
    assert_checkequal(prod(i, 1, typ(:)), hypermat([1,2,2],uint8([254;90;1;1])));
    assert_checkequal(prod(i, 2, typ(:)), hypermat([2,1,2],uint8([10;238;1;1])));
    assert_checkequal(prod(i, 3, typ(:)), uint8([1,10;254,9]));
    assert_checkequal(prod(i, 5, typ(:)), i);
end

assert_checkequal(prod(i, "double"), 22860);
assert_checkequal(prod(i, "*", "double"), 22860);
assert_checkequal(prod(i, 1, "double"), hypermat([1,2,2],[254;90;1;1]));
assert_checkequal(prod(i, 2, "double"), hypermat([2,1,2],[10;2286;1;1]));
assert_checkequal(prod(i, 3, "double"), [1,10;254,9]);
assert_checkequal(prod(i, 5, "double"), double(i));

//Polynomials
s=%s;p=[s s+1;s^2 1];
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod(p, typ(:)), s^3+s^4);
    assert_checkequal(prod(p, "*", typ(:)), s^3+s^4);
    assert_checkequal(prod(p, 1, typ(:)), [s^3,1+s]);
    assert_checkequal(prod(p, 2, typ(:)), [s+s^2;s^2]);
    assert_checkequal(prod(p, 3, typ(:)), p);
end
//with hypermatrices
s=%s;p=[s s+1;s^2 1];p(:,:,2)=[1 s;s+1 2];
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod(p, typ(:)), 2*s^4+4*s^5+2*s^6);
    assert_checkequal(prod(p, "*", typ(:)), 2*s^4+4*s^5+2*s^6);
    assert_checkequal(prod(p, 1, typ(:)), hypermat([1,2,2],[s^3;1+s;1+s;2*s]));
    assert_checkequal(prod(p, 2, typ(:)), hypermat([2,1,2],[s+s^2;s^2;s;2+2*s]));
    assert_checkequal(prod(p, 3, typ(:)), [s,s+s^2;s^2+s^3,2]);
    assert_checkequal(prod(p, 5, typ(:)), p);
end

//=======================================================================
//Matrices of rationals
s=%s;r=1.0 ./[s s+1;s^2 1];
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod(r, typ(:)), 1.0/(s^3+s^4));
    assert_checkequal(prod(r, "*", typ(:)), 1.0/(s^3+s^4));
    assert_checkequal(prod(r, 1, typ(:)), [1,1]./[s^3,1+s]);
    assert_checkequal(prod(r, 2, typ(:)), [1;1]./[s+s^2;s^2]);
    assert_checkequal(prod(r, 3, typ(:)), r);
end

//=======================================================================
//Matrices of booleans
b=[%t %t; %f %t];
T = list(list(),list("double"));
for typ=T
    assert_checkequal(prod(b, typ(:)), 0);
    assert_checkequal(prod(b, "*", typ(:)), 0);
    assert_checkequal(prod(b, 1, typ(:)), [0 1]);
    assert_checkequal(prod(b, 2, typ(:)), [1;0]);
    assert_checkequal(prod(b, 3, typ(:)), double(b));
end

assert_checkequal(prod(b, "native"), %f);
assert_checkequal(prod(b, "*", "native"), %f);
assert_checkequal(prod(b, 1, "native"), [%f %t]);
assert_checkequal(prod(b, 2, "native"), [%t;%f]);
assert_checkequal(prod(b, 3, "native"), b);

//with hypermatrices
b=[%t %t;%f %t];b(1,1,2)=%t;
T = list(list(),list("double"));
for typ=T
    assert_checkequal(prod(b, typ(:)), 0);
    assert_checkequal(prod(b, "*", typ(:)), 0);
    assert_checkequal(prod(b, 1, typ(:)), hypermat([1,2,2],[0;1;0;0]));
    assert_checkequal(prod(b, 2, typ(:)), hypermat([2,1,2],[1;0;0;0]));
    assert_checkequal(prod(b, 3, typ(:)), [1,0;0,0]);
    assert_checkequal(prod(b, 5, typ(:)), double(b));
end

assert_checkequal(prod(b, "native"), %f);
assert_checkequal(prod(b, "*", "native"), %f);
assert_checkequal(prod(b, 1, "native"), hypermat([1,2,2],[%f;%t;%f;%f]));
assert_checkequal(prod(b, 2, "native"), hypermat([2,1,2],[%t;%f;%f;%f]));
assert_checkequal(prod(b, 3, "native"), [%t,%f;%f,%f]);
assert_checkequal(prod(b, 5, "native"), b);

//=======================================================================
//sparse matrices of floats
s=sparse([1 10 2;-1 254 9]);
T=list(list(),list("native"),list("double"));
for typ=T
    assert_checkequal(prod(s, typ(:)), -45720);
    assert_checkequal(prod(s, "*", typ(:)), -45720);
    assert_checkequal(prod(s, 1, typ(:)), sparse([-1 2540 18]));
    assert_checkequal(prod(s, 2, typ(:)), sparse([20;-2286]));
    assert_checkequal(prod(s, 3, typ(:)), s);
end

//=======================================================================
//sparse  matrices of boolean
bs=sparse([%t %t %f;%t %t %t]);
T = list(list(),list("double"));
for typ=T
    assert_checkequal(prod(bs, typ(:)), 0);
    assert_checkequal(prod(bs, "*", typ(:)), 0);
    assert_checkequal(prod(bs, 1, typ(:)), sparse([1,1,0]));
    assert_checkequal(prod(bs, 2, typ(:)), sparse([0;1]));
    assert_checkequal(prod(bs, 3, typ(:)), bool2s(bs));
end

assert_checkequal(prod(bs, "native"), %f);
assert_checkequal(prod(bs, "*", "native"), %f);
assert_checkequal(prod(bs, 1, "native"), sparse([%t,%t,%f]));
assert_checkequal(prod(bs, 2, "native"), sparse([%f;%t]));
assert_checkequal(prod(bs, 3, "native"), bs);

// TODO : test the "m" option
