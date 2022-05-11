function [Target] = lambdaTarget(Nx)

    Target = imread('lambda.png');
    Target = double(Target);
    Target = Target(1:500,70:470);
    
    x1 = linspace(0, 1, size(Target, 2));
    x2 = linspace(0, 1, size(Target, 1));
    [x1, x2] = meshgrid(x1, x2);
    
    xi = linspace(0, 1, Nx);
    [xi1, xi2] = meshgrid(xi, xi.');
    
    Target = interp2(x1, x2, Target, xi1, xi2);
    Target = imbinarize(Target, 100);
    Target = ~Target;
    Target = Target*8;

end