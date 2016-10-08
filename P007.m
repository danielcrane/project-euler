function p = P007(n)
% Finds the nth prime number.
if nargin<1; n=10001; end

y=1000000; %Upper bound.
x=1:y;
x(1) = 0;
for p = 2:floor(sqrt(length(x)))+1
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
if length(x)<n; error(fprintf('Unable to find %d th prime, increase upper bound.',n)); end
p=x(n);
fprintf('Answer: %d\n',p);
end