% Ralf Mouthaan
% University of Cambridge
% September 2020
%
% Script to generate holograms for imaging. In other words, this script
% takes an image and converts it to a format that allow it to be uploaded
% onto the SLM. 

clc; clear variables; close all;

%% Save Hologram

Nx = 60;
Holo = alphaTarget(Nx);

figure;
imagesc(abs(Holo));
axis square;

Holo = reshape(Holo,1,Nx*Nx).';

fid = fopen('Alpha Target.txt', 'w+');

for i = 1:length(Holo)
    fprintf(fid, num2str(Holo(i)));
    if i ~= length(Holo)
        fprintf(fid, ",");
    end
end

fclose(fid);