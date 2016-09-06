function [ w ] = stochastic_gradient_decent( x, y, c )

alpha=1;
EPOCH_TIMES=3;
[T,~]=size(x);
w=zeros(alpha,EPOCH_TIMES);

    for t=1 :1:T*EPOCH_TIMES
        i=randi([1 T],1);

        if 1 - y(i)*(x(i,:)*w') <= 0
        w1=(1/T)*w;
        else
        w1= (1/T)*w - c*y(i)*x(i,:);
        end
        w= w - (alpha/t)*w1;
    end 
end