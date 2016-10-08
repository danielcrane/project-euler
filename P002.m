function s=P002(N)
% Calculates the sum of even numbers of the Fibonacci sequence below N.
if nargin<1; N=4e6; end
s=0;
f_p=1;
f=2;
while f<=N
    if rem(f,2)==0;
        s=s+f;
    end
    f1=f;
    f=f+f_p;
    f_p=f1;
end
fprintf('Answer: %d\n',s);
end