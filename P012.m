function t = P012(r)
% Find the first triangle number to have over input r divisors.
if nargin<1; r=500; end
n=1;d=0;
while d<=r
    d=0; %d will be the number of divisors that we find for each triangular number.
    t=0.5*(n^2-n); x=1; %This defines the triangular number.
    while x<=floor(sqrt(t)) && (d<=r) %x is the number that we're checking to see if it's a divisor.
    if rem(t,x)==0; if x==sqrt(t); d=d+1; else d=d+2; end; end %This checks for divisors below sqrt(t), since after that they're just repetitions.
    x=x+1; %I chose d=d+2 since divisors come in pairs s.th one number is below, and one is above - unless x=sqrt(t), then it's a repetition of the same
    end %divisor, hence the if statement involving x==sqrt(t).
    n=n+1;
    if d==r; break; end;
end
fprintf('Answer: %d\n',t);
end
%This method is rather inefficient for large r, I plan on coming back
%to this and using the Tau function rather than simply checking each
%number below the root.