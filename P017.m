function s = P017()
l(1:20)=[3 3 5 4 4 3 5 5 4 3 6 6 8 8 7 7 9 8 8 6];
l(30)=6;l(40)=5;l(50)=5;l(60)=5;l(70)=7;l(80)=6;l(90)=6;l(100)=7+3;l(1000)=8+3;

s=sum(l(1:20));

for i=21:99;
    if l(i)==0;
        n=num2str(i);
        l(i)=l(str2double(n(1))*10)+l(str2double(n(2)));
    end
    s=s+l(i);
end

s=s+l(100);

for i=101:999;
    n=num2str(i);
    if rem(i,100)==0; l(i)=l(str2double(n(1)))+l(100)-3;
    else l(i)=3+l(str2double(n(1))*100)+l(str2double(n(2:3))); end
    s=s+l(i);
end

s=s+l(1000);
fprintf('Answer: %d\n',s);
end