function h = Delta(time,n)
h = zeros(1, length(time));
for i = 1:length(time)
    if(time(i)==n)
        h(i)=1;
    end


end