%
%  no.m
%      created 4/11/93
%      calculates the no number density in the duct;
%      assumes evenly mixed no: no_density=mass_flow/(58cm2*velocity)
%      changed 10/08/95 for flow controler change to ~75sccm= 5V; Note
%      that this change was not properly accounted for in god_asho.
%      ans=no(flow,vel);   vel in cm/s; flow in volts ( 5V=20sccm )
%       
function j=no(flow,vel);
mass_flow=(flow./5).*75; % sccm
mass_flow=mass_flow.*2.69e19;  % molecules/min
mass_flow=mass_flow./60;  % molecules/sec
air_flow=3..*2.54.*3..*2.54.*vel;  % cc/sec
j=mass_flow./air_flow;  % molecules/cc
