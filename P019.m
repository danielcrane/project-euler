function s = P019()
weekday = 1;
day=1;
y = 1900;
months = [1 32 60 91 121 152 182 213 244 274 305 335];
s=0;

while y<=2000
    if rem(y,100)==0 && rem(y,400)==0; leap=1; y_d=366;
    elseif rem(y,100)~=0 && rem(y,4)==0; leap=1; y_d=366;
    else leap=0; y_d=365;
    end
    m=months; m(3:12)=m(3:12)+1;
    while day<=y_d;
        if weekday==7 && isempty(find(m==day, 1))==0 && y>1900; s=s+1; end
        if weekday+1==8; weekday=1; else weekday=weekday+1; end
        day=day+1;
    end
    y=y+1;
    day=1;
end

fprintf('Answer: %d\n',s);
end