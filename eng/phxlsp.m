function phxlsp(varargin);
% phxlsp( [...] );
% Laser Set Point
h = timeplot({'LTETV','LTEST'}, ...
      'Laser Set Point', ...
      'SetPoint', ...
      {'LTETV','LTEST'}, ...
      varargin{:} );
