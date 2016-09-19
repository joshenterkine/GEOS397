%% GEOS397_HW3_Enterkine
% Josh Enterkine
% 09/19/2016

%% Part 1: The finite difference approximation

% Step 1: Taylor Series expansion 

% s = 1; % step 
% n = anInteger; %(number of derivative expansions desired)
% tSeries = f(k,t) + h(df(k,t))/dk % initial conditions of Taylor series, 
    % = f(k+h,t)
% for s = 1:n % for loop to expand series as desired
%   tSeries = tSeries +
%   ((h^(s+1))/((s+1)*2)*((d^(s+1))*f(k,t))/(dk^(s+1))); % incrementing
%   series within loop
% end % ending loop


% Step 2: The forward difference operator for first derivatives 

% The term O(h) represents the order of error of the series that fits the 
% function. Because this is on a computer, h cannot equal zero. 

% The first order time derivative using the forward difference operator
% would be:

% df(x,t)/(dx) = ((f(x+h,t) - f(x,t))/h) + O(h)


% Step 3: The centered difference operator for second derivatives

% (d^2)*f(x)/(dx^2) ~= (f(x+h)-2*f(x) + f(x-h))/(h^2)


% Step 4: Approximate the derivatives

% (d*f(x,t))/(dt) ~= (f(x+h) - f(x-h))/(2h)


%% Part 2: The finite difference solution to the diffusion equation

% Step 1: Approximate the partial differential equation

% dx/dt = -otherK((d^2x)/dx^2), substituting previous equations from Part1:

%(z(x+h,t) - z(x,t))/h + O(h) = -otherK((z(x+h)-2*z(x) + z(x-h))/(h^2)) 
    % otherK is topographic diffusivity from Part 1: Step 1
    
    
% Step 2: Solve for the value of the function at time t+k

% (z(x+h,t+k) - z(x,t+k))/h + O(h) = -otherK((z(x+h)-2*z(x) + z(x-h))/(h^2))

% (z(x+h,t+k) - z(x,t+k)) = h(-otherK((z(x+h)-2*z(x) +
% z(x-h))/(h^2)) - O(h))

% z(x,t+k) = -(h(-otherK((z(x+h)-2*z(x) + z(x-h))/(h^2)) - O(h)) - (z(x+h,t+k))


%% Part 3: Implementing the numerical solution

% Step 1: Define parameters and constants

e = exp(1); % euiler's number
otherK = 2*e^(-3); % [(m^2)/year]
dt = 1; % dt = k, [year]
dx = 1; % dx = h, [m]


% Step 2: Make the initial model

z = [0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1 0 0 0 0 0]; % elevation, [m]
nNode = numel( z ); % [No] number of elements in the x-direction
xArray = ( 0 : nNode - 1 ) .* dx; % [m] make the x-position vector

% The x location with maximum elevation in the model assuming dx = 1 is 15.
[Y,xArray] = max(z); % returns the value (Y) and its index in xArray.

fig = figure; % creates new figure window
hold on % 
title('Part 3, Step 2: Initial Topography at Time Zero; Part 3, Step 4: at 100 years') % title for chart
xlabel('Horizontal Distance, meters (m)') % x-axis label for chart
ylabel('Vertical Distance, meters (m)') % y-axis label for chart
plot(z) % plotting values, since evenly spaced
legend('Initial Profile','Location', 'northeastOutside') % adding legend


% fig.PaperPositionMode = 'auto';
% fig.PaperPosition = [0 0 600 600]; % units in pixels as is default, setting dimensions per instructions
print(fig,  '-dpng', 'Initial Profile.png')% save figure with type and title


% Step 3: Loop through time to compute the topography at t + dt

t0 = dt; % for clarification, per instructions
tMax = 100; % end time, per instructions

for c = (t0+dt):dt:tMax
    % I am confused as to which variables need to be changed to what. 
       % x now = c? h = d?
    % Also not sure what equations are the 'z(x,t+dt) equation' and the
    % 'finite difference eqation', or how the inner for loop interfaces
    % with outer loop.
    
    x = c;
    -(h(-otherK((z(x+h)-2*z(x) + z(x-h))/(h^2)) - O(h)) - (z(x+h,t+k))) % RH side of equation from Part 2, Step 2
    
   for d = 2:(nNode-1) 
       
       h = d;
       z(x,t+k) = -(h(-otherK((z(x+h)-2*z(x) + z(x-h))/(h^2)) - O(h)) - (z(x+h,t+k))) % finite difference equation? from Part 2, Step 2 
       
   end

end

% Part 4: Plot your results

hold on; % holding figure on to plot new data on same chart
plot(z) % plotting z again, with changed values from loop
legend('Profile, 100 years later','Location', 'northeastOutside') % updating legend, per instructions



%% Part 4: Discussion

% Since I was not able to plot my formulas, I could not discern what
% varying the tMax function with the prescribed new values would look like.
% However, I would imagine that the 1e2, 1e3, and 1e4 values would create a
% slope that would retain more of the original profile (1e2 being
% closest to original) since they are less than 100. Therefore, I would
% expect 1e5 to have more 'slump' than tMax = 100, and 1e6 having the most.
% This is in line with what little I know about erosion and sediment
% movement.

% Varying the k (otherK is my variable) would change the rate at which soil
% moves from upslope to downslope, making the progression faster or slower.