%% Authors: Josh Enterkine and Mitch Giebler

%% Problem 1: Variables and time

% A)
% time is of size [1,6], containing six elements.
% time is a row vector. 
% time contains six elements (year month day hour minute seconds), seconds
%   are displayed with three decimal places of accuracy.
% time is a vector containing numeric (double) variables. 

time = clock; % assigns variable time to clock function
size(time); % returns 1 6, therefore one row of six elements
isrow(time); % returns 1, therefore true

% B)

yearString = datestr(now,10); % returns string of current year

% C)

save HW2part1.mat % saves all variables to file
savefile = 'HW2part1specific.mat'; % creates variable for filename
save(savefile, 'time', 'yearString', '-mat') % saves filename with specified variables


%% Problem 2: Plotting sine and cosine waves

% A)

% The sample interval for tArray is (tMax - tMin)/(1000) seconds, or 0.0010
% seconds. 

tMin = 0; % starting variable
tMax = 1; % ending variable
tInterval = 1000; % interval per specifications
tArray = linspace(tMin, tMax, tInterval + 1); % creating array of 1001 points between starting and ending variables, and including the end value (1)

% B) 

f = 5/(tMax-tMin); %? tInterval % 5 Hz, or 5 cycles per second

% C)

% To convert from frequency to angular frequency, multiply by 2pi

omega = f *((2*pi)); % converting frequency (f) to angular frequency (omega)

% D)

sineArray = sin(omega*tArray); % computing sine values for array, units in radians

%sineArray = 

cosineArray = cos(omega*tArray); % computing cosine values for array, units in radians

% E) 

figure % creates new figure window
hold on % keeping axes same so both sine and cosine are on same graph
title('Problem 2, Part E: Sine and Cosine Graph') % title for chart
xlabel('time (seconds)') % x-axis label for chart
ylabel('angular frequency (omega)') % y-axis label for chart
plot(tArray, sineArray, '--b') % plotting sineArray with specified style
plot(tArray, cosineArray, '-r') % plotting cossineArray with specified style

% F)

legend(' sineArray',' cosineArray', 'Location', 'northeastOutside') % adding legend outside of plot, in figure window per specifications

% G)

axis([tMin tMax -1.5 1.5]); % setting axes values per specification

% H)

grid on; % turning on the grid for the plot

% I)

% I computed 5Hz sin and cos waves, evidenced by each having five
% oscillations occuring within one second. They are also similar in
% amplitude, but are out of phase with one-another as is expected with sine
% and cosine graphs.

% J)

% The amplitude of the waves is 1, for both sine and cosine.

% K)

% The amplitude of the waves could be changed by a factor in front of the
% sine or cosine function.


%% Problem 3: Population Growth

% A)

initialRabbits = 2; % initial population, per specifications
dt = 1; % gestation unit, per specifications

% B)

growthCycles = 10; % number of gestation units to run model for
growthRate = 0.5; % rate of growth, between 0 and 1 (inclusive)

% C)

populationArray = zeros(growthCycles, 2); % creates an empty array to fill
ii = 0; % index used for filling in array
jj = growthCycles; % index used for filling in array, to start at second column
numGenerations = 0; % index to track number of generation



while growthCycles > 0 % while loop, 
    initialRabbits = initialRabbits +  (initialRabbits * growthRate * dt); % population growth formula, provided
    growthCycles = growthCycles - 1; % decrimenting growth cycles each iteration
    numGenerations = numGenerations + 1; % incrementing growth cycles each iteration
    ii = ii + 1; % incrementing index
    jj = jj + 1; % incrementing index
    populationArray(ii) = initialRabbits; % filling in indexed location with population value
    populationArray(jj) = numGenerations;  % filling in indexed location with generations value
    
end

% D)

figure (2) % creating new figure

subplot(1,2,1) % creating subplot of requisite size, position 1
plot(populationArray(:,2),populationArray(:,1)); % values to plot from array
grid on % turning on grid
xlabel('Number of Gestations') % x-axis label for chart
ylabel('Rabbit Population') % y-axis label for chart


subplot(1,2,2) % creating subplot of requisite size, position 2
plot(populationArray(:,2),log10(populationArray(:,1))); % values to plot from array with log10 modifier
grid on % turning on grid
xlabel('Number of Gestations') % x-axis label for chart
ylabel('log10 Rabbit Population') % y-axis label for chart

% E)

% The population change with various growth rates showed that the smaller
% the growth rate, the closer the curve was to a straight line (meaning a
% more steady population growth), while larger growth rates created an
% exponential curve (a population boom). Because of mathematical
% properties, the log10 curve remained straight independent of growth rate.

% F) 

% The gestation period for rabbits is approximately 31 days
% (http://www.rabbit.org/fun/answer3.html, accessed 09/07/2016). There
% would be roughly 12 gestation periods in a year (365/31 = 11 complete
% cycles). With an initial population of two rabbits, a growth rate of 1,
% for 11 cycles in a calendar year, the end population would be 4096.




