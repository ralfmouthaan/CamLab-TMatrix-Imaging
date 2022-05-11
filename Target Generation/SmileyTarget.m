function [Target] = SmileyTarget(Nx)

    Target = imread('SmileyFace.jpg');
    Target = rgb2gray(Target);
    Target = double(Target);
    
    x = linspace(0, 1, size(Target, 1));
    xi = linspace(-0.2, 1.2, Nx);    
    
    Target = interp2(x, x.', Target, xi, xi.');
    Target = imbinarize(Target, 100);
    Target = ~Target;
    Target = Target*8;
    
    [x, y] = meshgrid(xi, xi.');
    Target(x < 0) = 0;
    Target(x > 1) = 0;
    Target(y < 0) = 0;
    Target(y > 1) = 0;

end