function y = expo(t,x1,x2,x3)
% This script models an exponential function with a lag phase. The
% variables are used as follows:
% x1 = Initial biomass (gDCW/L)
% x2 = Maximum growth rate (1/hr)
% x3 = Delay Time (hr)
%
% This piecewise model is garnered with a condition based on the time
% compared to the delay. If the reaction time is lower that the delay time,
% the piecewise returns the initial biomass. However, if the reaction time
% exceeds the delay, the model is based on the traditional exponential fit:
% X = Xo * exp(mu(t-t_d)).

n = length(t);
y = zeros(size(t));

for i = 1:n
    if t(i) <= x3 % Lag region
      y(i) = x1;
    else %Exponential region
      y(i) = x1 * exp(x2*(t(i)-x3));
    end
end