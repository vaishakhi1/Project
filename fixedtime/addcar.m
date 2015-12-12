function [carloc, carid, lastcar, carstart] = addcar (carloc, carid, lastcar, carstart)


          pd_car = makedist('Bino','p' ,0.1);
            loc = random(pd_car) + 1;
            
            if loc == 2
            nextfree = checknextlocation(carloc, [13 1]);
            carstart(lastcar) = 2;
            else 
                nextfree = checknextlocation(carloc, [1 13]);
                carstart(lastcar) = 1;
            end

            
if nextfree == 0 && lastcar < length(carid) + 1
  if loc == 2
      carid(lastcar) = 1;
      carloc(1,lastcar) = 13;
      carloc(2,lastcar) = 1;
  else
      carid(lastcar) = 1;
      carloc(1,lastcar) = 1;
      carloc(2,lastcar) = 13;

  end
  lastcar = lastcar + 1;
end

end
