function [ count ] = Error( realWord_x, realWord_tags, w)
test=realWord_x*w';
count=0;
for i=1:1:length(test)
    a=test(i);
    b=realWord_tags(i);
    if a*b<0 %we where worng
        count=count+1;
    else if a*b == 0 %we flip a coin 
		count=count+randi([0 1],1);
        end
    end
end

count=count/length(realWord_x);
end

