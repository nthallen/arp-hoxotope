function phxpower300v_current(varargin);
% phxpower300v_current( [...] );
% Power 300V_ Current
h = timeplot({'V300I'}, ...
      'Power 300V_ Current', ...
      '300V_Current', ...
      {'V300I'}, ...
      varargin{:} );
