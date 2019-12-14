function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
%bisect: root location zeros
% [root,fx,ea,iter] = bisect(func,xl,xu,es,maxit)
%input:
%   func= name of function
%   xl, xu = lower and upper guess
%   es = desired relative error (default = 0.0001%)
%   maxit = mximum allowable iterations (default = 50)
%output:
%   root = real root
%   fx = function value at the root
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin<3
    error('at least 3 input arguments required')
end
test = func(xl, varargin{:})*func(xu,varargin{:});
if test>0
    error('no sign change')
end
if nargin<4 || isempty(es)
    es = 0.0001;
end
if nargin<5 || isempty(maxit)
    maxit=50;
end
iter=0; xr=xl; ea=100;
while (1)
    xrold = xr;
    xr=(xl+xu)/2;
    iter=iter+1;
    if xr~= 0
        ea=abs((xr - xrold)/xr)*100;
    end
    test = func(xl, varargin{:})*func(xu,varargin{:});
    if test<0
        xu=xr;
    elseif test>0
        xl=xr;
    else
        ea=0;
    end
    if ea<= es || iter>=maxit
        break
    end
    root =xr; fx=func(xr,varargin{:});
end
end
