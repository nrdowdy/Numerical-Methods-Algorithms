function [A] = specialMatrix(n,m,varargin)
% This function should return a matrix A as described in the problem statement
%specialMatrix.m
%created on: 09/14/19
%created by: Nathan Dowdy
%last modified: 09/14/19
%Inputs
%   n - rows
%   m - colums
%Outputs
%   [A] = n x m matrix
if nargin~=2
    error('User must input 2 variables')
end
A = zeros(n,m);

% Now the real challenge is to fill in the correct values of A
for j=1:n
    if j==1
        for k=1:m
            A(j,k)=k;
        end
    else
        for i=1:m
            if i==1
                A(j,i)=j;
            else
                A(j,i)=A(j,i-1)+A(j-1,i);
            end
        end
    end
end
end
