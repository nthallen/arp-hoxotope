function phxpcg(varargin);
% phxpcg( [...] );
% P Control Gains
h = timeplot({'PV_Gp','PV_Gi'}, ...
      'P Control Gains', ...
      'Gains', ...
      {'Gp','Gi'}, ...
      varargin{:} );
