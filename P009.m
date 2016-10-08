function p = P009(s)
% Finds product abc of a pythagorean triplet for which a+b+c=s.
if nargin<1; s=1000; end
a = 1; b = 2; c = 3;
while c < s
    while b < c
        while a < b
            if (a^2+b^2) == c^2 && a+b+c == s
                p = a*b*c;
                fprintf('Answer: %d\n',p);
                return;
            end
            a = a+1;
        end
        a = 1;
        b = b+1;
    end
    b = 2;
    c = c+1;
end
error('No such triplet found');
end