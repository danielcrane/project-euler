function s = P010(y)
%Find the sum of all primes below input y.
if nargin<1; y=2e6; end
x=1:y;
x(1) = 0;
for p = [2:floor(sqrt(length(x)))+1]
     i = 0;
    if p == 0; i = y+1; end
while p^2+i*p <= length(x)
    if rem(p^2 + i*p,p)==0
        x(p^2+i*p)=0;
    end
    i=i+1;
end
end
x=x(x~=0);
s=sum(x);
fprintf('Answer: %d\n',s);
end