function [Target] = DotTarget(Nx)
    
    Target = zeros(Nx, Nx);
    Target(Nx/2:Nx/2+2,Nx/2:Nx/2+2) = 500;

end