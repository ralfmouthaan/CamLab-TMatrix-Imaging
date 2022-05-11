function [Target] = DiamondTarget(Nx)

%     xi = linspace(0, 1, Nx);
% 
%     Target = imread('CardSuits.png');
%     Target = rgb2gray(Target);
%     Target = Target(size(Target,2)/2+1:size(Target,2),1:size(Target,1)/2);
%     Target = double(Target);
%     
%     x = linspace(0, 1, size(Target, 1));
%     
%     Target = interp2(x, x.', Target, linspace(0, 0.8, Nx), xi');
%     Target = imbinarize(Target, 100);
%     Target = ~Target;
%     Target = Target*100;

    x = linspace(-1,1,Nx);

    [x_mesh, y_mesh] = meshgrid(x, x.');
    
    Target = ones(Nx);
    
    Target((x_mesh + y_mesh) < -0.75) = 0;
    Target((x_mesh + y_mesh) > 0.75) = 0;    
    Target((x_mesh - y_mesh) < -0.75) = 0;
    Target((x_mesh - y_mesh) > 0.75) = 0;
end