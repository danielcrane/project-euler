function s = P1()
s=0;
for i=1:999
    if rem(i,3)==0 || rem(i,5)==0;
        s=s+i;
    end
end
fprintf('Answer: %d\n',s);
end