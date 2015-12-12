% project

clc
clear
close all

%start matrix and set up walls and depos (do I need that here?
taxiGrid = zeros(25,25);
starthor = [13 1];
endhor = [13 25];
startver = [1 13];
endver = [25 13];

reward = 0;
% two possigle states 1 = (r,g) and 2 = (g,r)
% two actions 1 = stay, 2 flip
Q = zeros(2,2);
e = zeros(2,2);
gamma = 1;  %decay

alpha = 0.9;
lambda = 1;

%total number of cars
ncars = 400;

icars = 0;

nepisode = 100;

avgtime = [];
stateset = [];
startlocations = [];

for iepisode = 1:nepisode
    carid = zeros(1,ncars);
carscore = zeros(1,ncars);
carloc = zeros (2,ncars);
cartime = zeros(1,ncars);
carstart = zeros (1,ncars);
state = 1;
    a = 1;
    endfl = 0;
    lastcar = 1;
    count = 0;
    while endfl == 0
        %put a car on the road
        [carloc, carid, lastcar, carstart] = addcar (carloc, carid, lastcar,carstart);
        
        if count < 45
            a = 1;
            count = count + 1;
        else
            
            a = 2;
            count = 0;
        end
        
     
        
        [state] = executAction(state,a);
        %move cars one step forward
        % cars after signals
        [carloc, carid, carscore, cartime] = updatecar(carloc, carid, carscore,cartime,state);
        

%         nsteps = nsteps+1;
        sumc = sum(carid);
        stateset = [stateset state];
        if sumc == length(carid)*2
            endfl = 1;
        end 
        for i = 1:length(carid)
        if carid(i) == 1
            location = carloc(:,i);
            taxiGrid(location(1), location(2)) = 1;
%             surf(taxiGrid)

            
        end
        end
%                     surf(taxiGrid)
            
    end
    avgtime = [cartime' avgtime];
    
    tempvar = (carstart(1:(ncars)) == 1);
    summ = sum(tempvar);
    startlocations = [startlocations (tempvar)'];
%     ca
%     figure, plot(cartime)
%     close all
                        e = zeros(2,2);
                        Q = zeros(2,2);


end

meany = sum(startlocations,2);
yy = startlocations.*avgtime;
sumy = sum(yy,2);

y = sum(avgtime,2)/nepisode;

plot(y);
figure, plot(sumy./meany)

% carscore = zeros(1,100);



