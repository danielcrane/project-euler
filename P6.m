function sd = P6(n)
% Calculate difference between sum of squares and square of sum of first
% n natural numbers.
if nargin<1; n=100; end

sqSum = (n*(n+1)/2)^2;
sumSq = sum((1:n).^2);

sd = sqSum-sumSq;
fprintf('Answer: %d\n',sd);
end