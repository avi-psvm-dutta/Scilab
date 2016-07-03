// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->

// Double
a(:, :, 4) = [7 8 9; 10 11 12];
res = data2sig(a, 0.1);

resRef.values = a;
resRef.time = (0:0.1:0.3)';

assert_checkequal(res, resRef);


// Int8
a_int = int8(a);
res_int = data2sig(a_int, 0.1);

resRef_int.values = a_int;
resRef_int.time = (0:0.1:0.3)';

assert_checkequal(res_int, resRef_int);


//---------------------------------------
// sig2data

[data, time] = sig2data(res);

assert_checkequal(data, a);
assert_checkequal(time, resRef.time);

[data_int, time] = sig2data(res_int);

assert_checkequal(data_int, a_int);
assert_checkequal(time, resRef.time);

refMsg = msprintf(_("%s: Wrong size for input argument #%d : A single struct expected.\n"), "sig2data", 1);
assert_checkerror("sig2data(struct())", refMsg);

refMsg = msprintf(_("%s: Wrong fields for input argument #%d : ""%s"" and ""%s"" expected.\n"), "sig2data", 1, "values", "time");
assert_checkerror("sig2data(struct(""values"", 1))", refMsg);
