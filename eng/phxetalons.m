function phxetalons(varargin);
% phxetalons( [...] );
% Etalon Step
h = timeplot({'EtnPs','EtPos'}, ...
      'Etalon Step', ...
      'Step', ...
      {'Step','Pot'}, ...
      varargin{:} );
