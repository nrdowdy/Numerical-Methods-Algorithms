function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
[x1,x2]=size(x); [y1,y2]=size(y); even=zeros(x1,x2); odd=zeros(y1,y2);
if x2~=y2 || x1~=1
    error('Matrices must be the same length')
end
if mean(x)==median(x)
    if 0==mod(x2,2)
        warning('The matrix contains a even number of elements. Trapeziodial Rule will be used for last interval.')
        for i=1:(x2/2-1)
            odd(1,i)=y(2*i);
            even(1,i)=y(2*i+1);
        end
        even(1,i)=0;
        simp=(x(x2-1)-x(1))*((y(1)+4*sum(odd)+2*sum(even)+y(y2-1))/(3*(x2-2)));
        warning('The matrix contains a even number of elements. Trapeziodial Rule will be used for last interval.')
        trap=((x(x2)-x(x2-1))*((y(y2)+y(y2-1))/2));
        I=trap+simp;
    else
        for i=1:((x2-1)/2)
            odd(1,i)=y(2*i);
            even(1,i)=y(2*i+1);
        end
        even(1,i)=0;
        I=(x(x2)-x(1))*((y(1)+sum(odd.*4)+sum(even.*2)+y(y2-1))/(3*(x2-1)));
    end
else
    error('X values are not evenly spaced')
end
