function phxdo(varargin);
% phxdo( [...] );
% Diodes On
h = ne_dstat({
  'On', 'RDiode_On', 0 }, 'On', varargin{:} );
