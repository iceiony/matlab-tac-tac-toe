function drawellipse(x1,y1,x2,y2)
% draws an ellipse with extremities in win [x1 y1] and [x2 y2]
% code from http://www.mathworks.com/matlabcentral/answers/86615-how-to-plot-an-ellipse
    eccentricity = 0.95;

    a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
    b = a*sqrt(1-eccentricity^2);
    t = linspace(0,2*pi);
    X = a*cos(t);
    Y = b*sin(t);
    w = atan2(y2-y1,x2-x1);
    x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
    y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
    
    hold on;
    elipse = plot(x,y,'r');
    set(elipse,'linewidth',3);
end
