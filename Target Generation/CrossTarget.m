function [Target] = CrossTarget(Nx)

    Target = zeros(Nx, Nx);
    
    Target(Nx/10:Nx-Nx/10,Nx/2-Nx/20:Nx/2+Nx/20) = 8;
    Target(Nx/2-Nx/20:Nx/2+Nx/20,Nx/10:Nx-Nx/10) = 8;

end