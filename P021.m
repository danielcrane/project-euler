function s = P021(N)
% Evaluates the sum of all amicable numbers below N.
if nargin<1; N=10000; end
N=N-1; %Must be BELOW N.
d=ones(1,N);
for m=1:N
    if isitprime(m)==1; continue; end;
    for i=2:floor(sqrt(m))
        if rem(m,i)==0; d(m)=d(m)+i+(m/i); end;
    end
end

s=0;

for n=1:N;
    if d(n)~=n && d(n)<=N;
        if d(d(n))==n; s=s+n;
        end
    end
end

fprintf('Answer: %d\n',s);
end