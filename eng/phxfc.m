function phxfc(varargin);
% phxfc( [...] );
% Flow Command
h = ne_dstat({
  'AC_S', 'DStt1', 0 }, 'Command', varargin{:} );
