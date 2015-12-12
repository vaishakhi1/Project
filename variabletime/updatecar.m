function [carloc, carid, carscore,cartime] = updatecar (carloc, carid, carscore, cartime,state)
for i = 1:length(carid)
    if carid(i) == 1
        
        %car in the middle can go anywhere
        if carloc(1,i) == 13 && carloc(2,i) == 13
            loc = random('unid',2);
            nextlocation = carloc(loc,i) + 1;
            if loc == 2
            nextfree = checknextlocation(carloc, [13 nextlocation]);
            else 
                nextfree = checknextlocation(carloc, [nextlocation 13]);
            end
            if nextfree == 0
                carloc(loc,i) =  nextlocation;
            end
            
       % car along horixontal, before signal
        elseif carloc(1,i) == 13 && carloc(2,i) < 13 && state == 1
            nextlocation =  carloc(2,i) + 1;
            nextfree = checknextlocation(carloc, [13 nextlocation]);
            if nextfree == 0
                carloc(2,i) =  nextlocation;
            end
         % car along vertical, before signal
        elseif carloc(2,i) == 13 && carloc(1,i) < 13 && state == 2
            nextlocation =  carloc(1,i) + 1;
            nextfree = checknextlocation(carloc, [nextlocation 13]);
            if nextfree == 0
                carloc(1,i) =  nextlocation;
            end
         % car along horizontal, after signal
        elseif carloc(1,i) == 13 && carloc(2,i) > 13
            nextlocation = carloc(2,i) + 1;
            nextfree = checknextlocation(carloc, [13 nextlocation]);
            
            if nextfree == 0
                carloc(2,i) =  nextlocation;
            end
         % car along vertical, after signal
        elseif carloc(2,i) == 13 && carloc(1,i) > 13
            nextlocation = carloc(1,i) + 1;
            nextfree = checknextlocation(carloc, [nextlocation 13]);
            if nextfree == 0
                carloc(1,i) =  nextlocation;
            end
        end
        carscore(i) =  carscore(i) - 1;
        cartime (i) = cartime(i) + 1;
        if carid(i) == 2
            carscore(i) = 0;
        end
        
    end
    
    % if location is 25, remove the car from the grid
    if carloc(1,i) == 25 || carloc(2,i) == 25;
        carscore(i) = 0;
        carid(i) = 2;
        carloc(1,i) = 0;
        carloc(2,i) = 0;
    end
end
            
            