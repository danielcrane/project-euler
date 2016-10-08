function s = P020(n)
a=1;
for i=1:n
    a=longmult(a,i);
end
s=sum(a);
fprintf('Answer: %d\n',s);
end