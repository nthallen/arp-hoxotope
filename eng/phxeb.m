function phxeb(varargin);
% phxeb( [...] );
% Excimer Bits
h = ne_dstat({
  'EHV1S', 'DStt1', 1; ...
	'EHV2S', 'DStt0', 3 }, 'Bits', varargin{:} );
