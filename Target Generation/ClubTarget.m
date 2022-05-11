function [Target] = ClubTarget(Nx)

    xi = linspace(0, 1, Nx);

    Target = imread('CardSuits.png');
    Target = rgb2gray(Target);
    Target = Target(size(Target,2)/2+1:size(Target,2),size(Target,2)/2+1:size(Target,2));
    Target = double(Target);
    
    x = linspace(0, 1, size(Target, 1));
    
    Target = interp2(x, x.', Target, xi, xi.');
    Target = imbinarize(Target, 100);
    Target = ~Target;
    Target(:,1:Nx/2) = fliplr(Target(:,Nx/2+1:end));
    

end