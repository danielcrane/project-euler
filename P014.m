function x0 = P014(X)
%Find x0, the starting number number under 1e6 that results in the longest Collatz sequence.
%This method is inefficient, there must be a better way by storing subcycles.
if nargin<1; X=1e6; end
s = 0;
for x=1:X-1
    z = x;
    y = 1;
    while z > 1
    if rem(z,2) == 0; 
        z = z/2;
    else
        z = 3*z+1;
    end
    y=y+1;
    end

    if y > s
        s = y;
        y0 = y;
        x0 = x;
    end
end

fprintf('Answer: %d (results in a chain of length %d).\n',x0,y0);
end