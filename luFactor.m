function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[rows,col]=size(A);
n=1;
if rows~=col
    error('The matrix must be square(3x3,4x4,5x5).')
end
U=A;
L=eye(rows);
P=eye(rows);
for i=2:rows
    for j=1:n
        pv=U(:,i-1);
        pvmax=max(abs(pv));
        if pvmax>U(j,j)
            for k=1:rows
                if pvmax==abs(pv(k,1))
                    pos=k;
                end
        else
            mult=U(i,j)/U(j,j);
            L(i,j)=mult;
        end
        U(i,:)=(U(j,:).*mult)-U(i,:);
        L(i,j)=mult;
    end
    n=n+1;
end
end