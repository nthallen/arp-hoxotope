% program to correct for under-counting in pulsed laser app.
% S = # of counts
% M = Rep. rate
% N = true signal assuming at most one count per shot.
%function N=oercount(S,M)
function N=oercount(S,M)
N=log(1-(S/M))./log((M-1)/M);
