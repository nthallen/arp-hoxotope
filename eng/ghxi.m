function fig = ghxi(varargin);
% ghxi(...)
% Inlet
ffig = ne_group(varargin,'Inlet','phxit','phxidp','phxip','phxiv');
if nargout > 0 fig = ffig; end
