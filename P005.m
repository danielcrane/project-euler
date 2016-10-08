function p=P005(n)
% Calculates the smallest number that is disible by all numbers 1:n.
if nargin<1; n=20; end
x=2;
for i=3:n;
    f=factor(i);
    X=x;
    for j=1:length(f);
        if ~isempty(find(X==f(1), 1)); X(find(X==f(1),1))=[]; f(1)=[];
        else x=[x f(1)]; f(1)=[];
        end
    end
end

p=1; for i=1:length(x); p=p*x(i); end
fprintf('Answer: %d\n',p);
end