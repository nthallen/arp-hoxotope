function phxdlb(varargin);
% phxdlb( [...] );
% Dye Laser Bits
h = ne_dstat({
  'DL_Fl', 'DStt1', 6; ...
	'DyePS', 'DStt2', 5 }, 'Bits', varargin{:} );
