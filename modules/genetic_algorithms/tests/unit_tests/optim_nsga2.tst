
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - Yann COLLETTE <yann.collette@renault.com>
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

function Res = min_bd_deb_1(n)
if ~isdef('n','local') then n = 10; end;
Res = zeros(n,1);
endfunction

function Res = max_bd_deb_1(n)
if ~isdef('n','local') then n = 10; end;
Res = ones(n,1);
endfunction

function f = get_opti_deb_1(x)
f1_x1 = x(1);
g_x2  = 1;
h     = 1 - sqrt(f1_x1 / g_x2);

f(1,1) = f1_x1;
f(1,2) = g_x2 * h;
endfunction

function f = deb_1(x)
f1_x1 = x(1);
g_x2  = 1 + 9 * sum((x(2:$)-x(1)).^2) / (length(x) - 1);
h     = 1 - sqrt(f1_x1 / g_x2);

f(1,1) = f1_x1;
f(1,2) = g_x2 * h;
endfunction

ga_params = init_param();
ga_params = add_param(ga_params,'minbound',min_bd_deb_1(2));
ga_params = add_param(ga_params,'maxbound',max_bd_deb_1(2));
ga_params = add_param(ga_params,'dimension',2);
ga_params = add_param(ga_params,'beta',0);
ga_params = add_param(ga_params,'delta',0.1);

[pop_opt, fobj_pop_opt, pop_init, fobj_pop_init] = optim_nsga2(deb_1, 25, 3, 0.1, 0.7, %F, ga_params);

if length(pop_opt)~=length(pop_init) then pause,end
if size(fobj_pop_opt)~=size(fobj_pop_init) then pause,end
