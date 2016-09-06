function [w,maxM,MinM] = classifier()

[ x,tags,c ] = readFile();

%Take 70% from x for lernig and 30% for realWord
%Take 70% from tags for lernig and 30% for realWord
[ testing_x,realWord_x,testing_tags,realWord_tags ]= split_matrix_and_tags(x,tags);

[bestC,errorV,w,maxM,MinM]=SVM(testing_x,testing_tags,c);
%norm 30/100%
[ realWord_x ] = normalization( realWord_x,maxM,MinM );

worng_percentage =Error(realWord_x,realWord_tags,w);
end

