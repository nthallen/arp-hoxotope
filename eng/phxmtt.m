function phxmtt(varargin);
% phxmtt( [...] );
% Misc Temps Thermistors
h = timeplot({'PMonT','SDP_T','Inl_T','PumpT'}, ...
      'Misc Temps Thermistors', ...
      'Thermistors', ...
      {'PMonT','SDP\_T','Inl\_T','PumpT'}, ...
      varargin{:} );
