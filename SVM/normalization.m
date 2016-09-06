function [ x ] = normalization( x, maxM, MinM )
%Make all elements to be between 0 and 1
[~,len]=size(x);
    for i=1 : 1 : len
        x(:,i) = x(:,i) - MinM(i);%make min to be 0   
        x(:,i) = x(:,i)/(maxM(i)-MinM(i)); 
    end
end

