function [Target] = alphaTarget(Nx)

    Target = imread('alpha.png');
    Target = double(Target);
    Target = Target(51:380, 51:350);
    
    x1 = linspace(0, 1, size(Target, 2));
    x2 = linspace(0, 1, size(Target, 1));
    [x1, x2] = meshgrid(x1, x2);
    
    xi = linspace(0, 1, Nx);
    [xi1, xi2] = meshgrid(xi, xi.');
    
    Target = interp2(x1, x2, Target, xi1, xi2);
    Target = imbinarize(Target, 100);
    Target = ~Target;
    
    x = linspace(-1,1, size(Target, 1));
    Target = fftshift(fft2(fftshift(Target)));
    filter = exp(-(x.^2 +x.'.^2)*20);
    Target = Target.*filter;
    Target = fftshift(ifft2(fftshift(Target)));
    Target = abs(Target);
    
    Target = Target*8;

end