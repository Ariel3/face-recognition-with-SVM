function [ s ] = sum_Matrix(m)
assert(ismatrix(m));
s=sum(sum(sum(m)));
end

