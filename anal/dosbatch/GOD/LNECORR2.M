% lnecorr2.m 
%   The assumption is made that the line tracking program is not 
%       biased to one side or the other of the true line center.
%       By running a median filter through the data we hope to capture 
%       the true online position and then calculate a difference for each
%       point. 
%

function del=lnecorr2(pos)

% find best estimate of true online position by first applying a median
% filter and than applying a running mean filter

trueo=medianf(pos,5);
trueona=meanf(trueo',5);

del=(pos-trueona');

