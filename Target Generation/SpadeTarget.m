function [Target] = SpadeTarget(Nx)

    xi = linspace(0, 1, Nx);

    Target = imread('CardSuits.png');
    Target = rgb2gray(Target);
    Target = Target(1:size(Target,1)/2,1:size(Target,1)/2);
    Target = double(Target);
    
    x = linspace(0, 1, size(Target, 1));
    
    Target = interp2(x, x.', Target, linspace(0, 0.8, Nx), xi.');
    Target = imbinarize(Target, 100);
    Target = ~Target;
    Target(:,Nx/2+1:end) = fliplr(Target(:,1:Nx/2));

end