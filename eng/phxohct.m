function phxohct(varargin);
% phxohct( [...] );
% OH Cell Temps
h = timeplot({'OHC2T','OHCHT'}, ...
      'OH Cell Temps', ...
      'Temps', ...
      {'OHC2T','OHCHT'}, ...
      varargin{:} );
