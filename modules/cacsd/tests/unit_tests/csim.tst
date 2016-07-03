//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->

// Unit test for csim function

a=0;b=1;c=2;
t=0:0.1:1;
sl=syslin('c',a,b,c);
u=ones(1,11);
xrefstep = 0:0.1:1;
yrefstep=0:0.2:2;

//step
y=csim('step',t,sl);
assert_checkalmostequal(y, yrefstep);
y=csim('step',[],sl);
assert_checkequal(y, []);
[y1,x]=csim('step',[],sl);
assert_checkequal(y1, []);
assert_checkequal(x, []);

[y1,x]=csim('step',t,sl);
assert_checkalmostequal(y1, yrefstep);
assert_checkalmostequal(x, xrefstep);

y=csim('step',t,sl,0);
assert_checkalmostequal(y, yrefstep);

[y1,x]=csim('step',t,sl,0);
assert_checkalmostequal(y1, yrefstep);
assert_checkalmostequal(x, xrefstep);

y=csim('step',t,sl,1);
assert_checkalmostequal(y, yrefstep);

y=csim('step',t,sl,0,[10*%eps %eps]);
assert_checkalmostequal(y, yrefstep);

[y1,x]=csim('step',t,sl,1,[10*%eps %eps]);
assert_checkalmostequal(y, yrefstep);
assert_checkalmostequal(x, xrefstep);


//impulse
yrefimp=2*ones(1,11);
xrefimp=ones(1,11);

y=csim('impulse',t,sl);
assert_checkalmostequal(y, yrefimp);

y=csim('impulse',[],sl);
assert_checkequal(y, []);

[y1,x]=csim('impulse',[],sl);
assert_checkequal(y1, []);
assert_checkequal(x, []);

w=ones(t)-eye(t);
y=csim('impulse',t,sl);
assert_checkalmostequal(y, yrefimp);

[y1,x]=csim('impulse',t,sl);
assert_checkalmostequal(y1, yrefimp);
assert_checkalmostequal(x, xrefimp);

y=csim('impulse',t,sl,0);
assert_checkalmostequal(y, yrefimp);

[y1,x]=csim('impulse',t,sl,0);
assert_checkalmostequal(y1, yrefimp);
assert_checkalmostequal(x, xrefimp);

y=csim('impulse',t,sl,1);
assert_checkalmostequal(y, yrefimp);

[y1,x]=csim('impulse',t,sl,1);
assert_checkalmostequal(y1, yrefimp);
assert_checkalmostequal(x, xrefimp);

y=csim('impulse',t,sl,0,[10*%eps %eps]);
assert_checkalmostequal(y, yrefimp);

[y1,x]=csim('impulse',t,sl,1,[10*%eps %eps]);
assert_checkalmostequal(y1, yrefimp);
assert_checkalmostequal(x, xrefimp);

//function
function y=step(t),if t<0 then y=0,else y=1,end,endfunction

y=csim(step,t,sl);
assert_checkalmostequal(y, yrefstep);

y=csim(step,[],sl);
assert_checkequal(y, []);

[y1,x]=csim(step,[],sl);
assert_checkequal(y1, []);
assert_checkequal(x, []);

y=csim(step,t',sl);
assert_checkalmostequal(y, yrefstep);

[y1,x]=csim(step,t,sl);
assert_checkalmostequal(y1, yrefstep);
assert_checkalmostequal(x, xrefstep);

y=csim(step,t,sl,0);
assert_checkalmostequal(y, yrefstep);

[y1,x]=csim(step,t,sl,0);
assert_checkalmostequal(y1, yrefstep);
assert_checkalmostequal(x, xrefstep);

yrefstep2=2:0.2:4;
xrefstep2=1:0.1:2;
y=csim(step,t,sl,1);
assert_checkalmostequal(y, yrefstep2);

[y1,x]=csim(step,t,sl,1);
assert_checkalmostequal(y1, yrefstep2);
assert_checkalmostequal(x, xrefstep2);

y=csim(step,t,sl,0,[10*%eps %eps]);
assert_checkalmostequal(y, yrefstep);

//with transfer function
y=csim(step,t,ss2tf(sl));
assert_checkalmostequal(y, yrefstep);

//with parameter
function y=step(t,t0),if t<t0 then y=0,else y=1,end,endfunction

y=csim(list(step,0),t,sl);
assert_checkalmostequal(y, yrefstep);

y=csim(list(step,0),t,ss2tf(sl));
assert_checkalmostequal(y, yrefstep);
