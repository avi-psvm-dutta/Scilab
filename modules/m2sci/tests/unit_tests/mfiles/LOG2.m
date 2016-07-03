% Test file for function log2()
% Matlab version: 7.9.0.529 (R2009b)

% TEST 1
res1 = log2([]);
% TEST 2
res2 = log2(m2sciUnknownType([]));
% TEST 3
res3 = log2(m2sciUnknownDims([]));
% TEST 4
res4 = log2([1]);
% TEST 5
res5 = log2([1,2,3]);
% TEST 6
res6 = log2([1;2;3]);
% TEST 7
res7 = log2([1,2,3;4,5,6]);
% TEST 8
res8 = log2(m2sciUnknownType([1]));
% TEST 9
res9 = log2(m2sciUnknownType([1,2,3]));
% TEST 10
res10 = log2(m2sciUnknownType([1;2;3]));
% TEST 11
res11 = log2(m2sciUnknownType([1,2,3;4,5,6]));
% TEST 12
res12 = log2(m2sciUnknownDims([1]));
% TEST 13
res13 = log2(m2sciUnknownDims([1,2,3]));
% TEST 14
res14 = log2(m2sciUnknownDims([1;2;3]));
% TEST 15
res15 = log2(m2sciUnknownDims([1,2,3;4,5,6]));
% TEST 16
res16 = log2([i]);
% TEST 17
res17 = log2([i,2i,3i]);
% TEST 18
res18 = log2([i;2i;3i]);
% TEST 19
res19 = log2([i,2i,3i;4i,5i,6i]);
% TEST 20
res20 = log2(m2sciUnknownType([i]));
% TEST 21
res21 = log2(m2sciUnknownType([i,2i,3i]));
% TEST 22
res22 = log2(m2sciUnknownType([i;2i;3i]));
% TEST 23
res23 = log2(m2sciUnknownType([i,2i,3i;4i,5i,6i]));
% TEST 24
res24 = log2(m2sciUnknownDims([i]));
% TEST 25
res25 = log2(m2sciUnknownDims([i,2i,3i]));
% TEST 26
res26 = log2(m2sciUnknownDims([i;2i;3i]));
% TEST 27
res27 = log2(m2sciUnknownDims([i,2i,3i;4i,5i,6i]));
% TEST 28
[res28,res29] = log2([]);
% TEST 29
[res30,res31] = log2(m2sciUnknownType([]));
% TEST 30
[res32,res33] = log2(m2sciUnknownDims([]));
% TEST 31
[res34,res35] = log2([1]);
% TEST 32
[res36,res37] = log2([1,2,3]);
% TEST 33
[res38,res39] = log2([1;2;3]);
% TEST 34
[res40,res41] = log2([1,2,3;4,5,6]);
% TEST 35
[res42,res43] = log2(m2sciUnknownType([1]));
% TEST 36
[res44,res45] = log2(m2sciUnknownType([1,2,3]));
% TEST 37
[res46,res47] = log2(m2sciUnknownType([1;2;3]));
% TEST 38
[res48,res49] = log2(m2sciUnknownType([1,2,3;4,5,6]));
% TEST 39
[res50,res51] = log2(m2sciUnknownDims([1]));
% TEST 40
[res52,res53] = log2(m2sciUnknownDims([1,2,3]));
% TEST 41
[res54,res55] = log2(m2sciUnknownDims([1;2;3]));
% TEST 42
[res56,res57] = log2(m2sciUnknownDims([1,2,3;4,5,6]));
% TEST 43
[res58,res59] = log2([i]);
% TEST 44
[res60,res61] = log2([i,2i,3i]);
% TEST 45
[res62,res63] = log2([i;2i;3i]);
% TEST 46
[res64,res65] = log2([i,2i,3i;4i,5i,6i]);
% TEST 47
[res66,res67] = log2(m2sciUnknownType([i]));
% TEST 48
[res68,res69] = log2(m2sciUnknownType([i,2i,3i]));
% TEST 49
[res70,res71] = log2(m2sciUnknownType([i;2i;3i]));
% TEST 50
[res72,res73] = log2(m2sciUnknownType([i,2i,3i;4i,5i,6i]));
% TEST 51
[res74,res75] = log2(m2sciUnknownDims([i]));
% TEST 52
[res76,res77] = log2(m2sciUnknownDims([i,2i,3i]));
% TEST 53
[res78,res79] = log2(m2sciUnknownDims([i;2i;3i]));
% TEST 54
[res80,res81] = log2(m2sciUnknownDims([i,2i,3i;4i,5i,6i]));
