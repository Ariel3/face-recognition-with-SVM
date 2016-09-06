function [ testing_x,realWord_x,testing_tags,realWord_tags ] = split_matrix_and_tags(x,tags)

r=randperm(length(x));
split=round(length(r)*0.7);
seventy_percentage= r(1 : split);
thirty_percentage= r(split+1 :length(r));

%Take 70% from x and tags for lernig
testing_x=x(seventy_percentage(:),:);
testing_tags=tags(seventy_percentage(:),:);

%Take 30% from x and tags for realWord
realWord_x=x(thirty_percentage(:),:);
realWord_tags=tags(thirty_percentage(:),:);

end

