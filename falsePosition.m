function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
if nargin<3
    error('At least 3 inout arguments required')
end
if nargin<4 || isempty(es)
    es=0.0001;
end
if nargin<5 || isempty(maxit)
    maxit=200;
end
if (func(xl)*func(xu))>0
    error('no sign change')
end
ea=100;
iter=-1;
rootp=0;
root=xl;
while ea>=es || iter==maxit
    root=xu-((func(xu)*(xu-xl))/(func(xu)-func(xl)));
    iter=iter+1;
    ea=((root-rootp)/root)*100;
    if root==0
        break
    elseif (func(root)*func(xl))<0
        xl=root;
        rootp=xl;
    else
        xu=root;
        rootp=xu;
    end
end
fx=func(root);
end