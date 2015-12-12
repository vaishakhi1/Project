function nextfree = checknextlocation(carloc,nextlocation)
nextfree = 0;
for i = 1: length(carloc)
    
    if ((carloc(1,i) == nextlocation(1)) && (carloc(2,i) == nextlocation(2)))
        nextfree = 1;
        break;
    else
        if nextfree ~= 1
        nextfree = 0;
        end
    end
end
end




