

% This script computes a 3rd-order Taylor series approximation to the solution to an IVP
% on [0,5] on n+ 1 evenly-spaced values of t,including the endpoints
% The program runs a loop that approximates the solution to the IVP for n= 10, 100, 1000, and 10000.
% And for each value of n, plots the absolute global error vector in the approximate solution vs.t.
% And only for n= 10000, plots the approximate solution vector vs.t.

format long e

h = 0.5;

k = 1:3;

for n = 10:9*10.^k:10000 % loop for each value of n
n

    t = 0:5/(n):5 % vectr of n+1 evenly spaced nodes(x-axis points)

    wi(1) = 1000; % w_0 = y_0
    
    % iterative step ~ w_i+1 = w_i+hf(t_i,w_i)+(h^2/2)f''(t_i,w_i)+(h^3/6)f''(t_i,w_i)
    for i = 1:(n)

        %wi = wi_1(i); % ~ ith's element/prev elemnt in this vector

        f = 100 + wi(i)./(t(i)-10);

        df = -wi(i)./((t(i)-10).^2) + (1/(t(i)-10))*(100 + wi(i)./(t(i)-10));

        ddf = (2*wi(i))./((t(i)-10).^3) - (((100+wi(i))./(t(i)-10)+1)./((t(i)-10).^2)) + (2*wi(i))./((t(i)-10).^4);

        wi(i+1) = wi(i) + h*(f) + ((h^2)/2)*(df) + ((h^3)/6)*(ddf); % starting at second vec eleement

end

y_exct = 100.*(10-t).*(1+log((10./(10-t)))); % using t means this will be a vector of points of the same size as t, this may be problem bc wnant ln operatr to take ln of all elements of argument so can multiply by coefficient t vector


GE = abs(y_exct - wi); % vector argument of abs must be the samme size to subtract them!!



plot(t,GE);

% for n= 10000, plot the approximate solution vector vs.t
    if n == 10000
        plot(t,wi);
    end

end