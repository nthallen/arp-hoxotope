function fig = ghxattenuator(varargin);
% ghxattenuator(...)
% Attenuator
ffig = ne_group(varargin,'Attenuator','phxattenuators','phxattenuatorp','phxattenuatorb');
if nargout > 0 fig = ffig; end
