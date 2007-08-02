function phxpdvb(varargin);
% phxpdvb( [...] );
% PD Valve Bits
h = ne_dstat({
  'R', 'PDVStat', 3; ...
	'D', 'PDVStat', 2; ...
	'O', 'PDVStat', 1; ...
	'I', 'PDVStat', 0; ...
	'Scan', 'IXStt', 7 }, 'Bits', varargin{:} );
