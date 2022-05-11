% Ralf Mouthaan
% University of Cambridge
% September 2020
%
% Script to generate holograms for imaging. In other words, this script
% takes an image and converts it to a format that allow it to be uploaded
% onto the SLM. 

clc; clear variables; close all;
Nx = 32;

%% Diamond

Holo = zeros(32);
Holo(3:30,3:30) = DiamondTarget(28);
Holo(:,1:16) = fliplr(Holo(:,17:end));

Holo = Holo/100;

figure;
imagesc(abs(Holo));
axis square;

Holo = reshape(Holo,1,Nx*Nx).';

fid = fopen('Diamond Target.txt', 'w+');

for i = 1:length(Holo)
    fprintf(fid, num2str(Holo(i)));
    if i ~= length(Holo)
        fprintf(fid, ",");
    end
end

fclose(fid);

%% Heart

Holo = zeros(32);
Holo(5:32,3:30) = HeartTarget(28);
Holo(:,17:end) = fliplr(Holo(:,1:16));

Holo = Holo/100;

figure;
imagesc(abs(Holo));
axis square;

Holo = reshape(Holo,1,Nx*Nx).';

fid = fopen('Heart Target.txt', 'w+');

for i = 1:length(Holo)
    fprintf(fid, num2str(Holo(i)));
    if i ~= length(Holo)
        fprintf(fid, ",");
    end
end

fclose(fid);

%% Spade

Holo = zeros(32);
Holo(3:30,3:30) = SpadeTarget(28);
Holo(:,17:end) = fliplr(Holo(:,1:16));

Holo = Holo/100;

figure;
imagesc(abs(Holo));
axis square;

Holo = reshape(Holo,1,Nx*Nx).';

fid = fopen('Spade Target.txt', 'w+');

for i = 1:length(Holo)
    fprintf(fid, num2str(Holo(i)));
    if i ~= length(Holo)
        fprintf(fid, ",");
    end
end

fclose(fid);

%% Club

Holo = zeros(32);
Holo(3:30,3:30) = ClubTarget(28);
Holo(:,1:16) = fliplr(Holo(:,17:end));

Holo = Holo/100;

figure;
imagesc(abs(Holo));
axis square;

Holo = reshape(Holo,1,Nx*Nx).';

fid = fopen('Club Target.txt', 'w+');

for i = 1:length(Holo)
    fprintf(fid, num2str(Holo(i)));
    if i ~= length(Holo)
        fprintf(fid, ",");
    end
end

fclose(fid);