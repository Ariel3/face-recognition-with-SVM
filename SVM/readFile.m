function [ x,tags,c ] = readFile()

x = importdata('dataSet.txt');
tags=x(:,4);
x(:,4)=[];
assert(length(x)==length(tags));
for i=1:1:length(x)
%assert(x(i,1)<256 && x(i,1)> -256);
%assert(x(i,2)<256 && x(i,2)> -256);
%assert(x(i,3)<256 && x(i,3)> -256);
%assert(tags(i)==1 || tags(i)==-1);
end

%Create Vector of scalars
c = zeros(1,11);
pow = -5;
for i = 1:11
    c(i) = power(2,pow);
    pow = pow + 2;
end
end

