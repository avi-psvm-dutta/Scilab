//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
prot=funcprot();funcprot(0);
global a
a=133;
clear a;
if exists("a") then pause,end
global a;
if a<>133 then pause,end
a=["1234","456"];
if a(1)<>"1234" then pause,end

global b
b=10;a=-1;
clear a b
global a b
if a<>-1|b<>10 then pause,end
//
clearglobal()
try
    a
    n=0
catch
    [str,n]=lasterror(%t);
end
if n == 0 then pause,end

global a b c
a=1;b=2;c=3;
clearglobal b
try
    b
    n=0
catch
    [str,n]=lasterror(%t);
end
if n == 0 then pause,end

if a<>1|c<>3 then pause,end

clearglobal c
try
    c
    n=0
catch
    [str,n]=lasterror(%t);
end
if n == 0 then pause,end
if a<>1 then pause,end

clearglobal a
try
    a
    n=0
catch
    [str,n]=lasterror(%t);
end
if n == 0 then pause,end

clearglobal()


//
global a
a=133;
//insertion
a(2,2)=10;
if or(a<>[133 0;0 10]) then pause,end
clear a;
global a;
if or(a<>[133 0;0 10]) then pause,end

clear a;
global a;
if a(1,1)<>133  then pause,end

// global between the base workspace and the function workspace

deff("foo()","global a;if a<>133 then pause,end,a=10")
a=133;
foo();
if a<>10 then pause,end

// skipping a level
deff("y=foo()","y=f1()")
deff("y=f1(x)","global a,y=a^2")

a=5;
if foo()<>a^2 then pause,end

// a global variable used as an argument
deff("y=foo()","global a;a=143;y=f1(a)")
deff("y=f1(x)","a=1;y=x^2")
if foo()<>143^2|a<>143 then pause,end


//dealing with insertion and extraction
deff("foo()","global a;a=[];for k=1:5,a(1,k)=k;end")
foo();
if or(a<>(1:5)) then pause,end

deff("y=foo()","global a;y=a(1:2:$)")
if or(foo()<>(1:2:5)) then pause,end

if ~isglobal("a") then pause,end
clearglobal a
a=1;
if isglobal("a") then pause,end
if isglobal("1") then pause,end

clearglobal()

gsz=int(rand() * 1000);

global a b c
n=int(sqrt(gsz(1)))-3;
b=ones(n,n);
deff("foo()","global b;for k=1:5,b=[b ones(n,10)];end")
foo()
if or(size(b)<>[n,n+50]) then pause,end
if find(b<>1)<>[] then pause,end
clearglobal a b c

//test passing global variable as an argument
global G;
G=1;
function foo(x),x=-1,endfunction
foo(G);if G<>1 then pause,end

//change the global variable that had been passed as an argument
function y=foo(x),global G,G=33,y=x,endfunction
if (foo(G)<>1) then pause,end
clearglobal G

function y=foo(),global a b,b=[],a=1:3,y=foo1(a),endfunction
function y=foo1(x),global b,b=[b 1],y=x(3),endfunction
if (foo()<>3) then pause,end
clearglobal a b

global G b;
a=rand(3,3);
G=mlist(["test","a"],a);

function V=%s_i_test(i,j,I,V)
    global b; b=[b 1:5];  V.a(i,j)=I;
endfunction
G(1,3)=0;a(1,3)=0;
if or(a<>G.a) then pause,end

// Is it the good choice?
function r=%test_e(i,j,V)
    global G; G.a(i,j)=1;  r=V.a(i,j);
endfunction
a13=G.a(1,3);
X=G(1,3);
if or(G.a(1,3)<>1) then pause,end
funcprot(prot);

