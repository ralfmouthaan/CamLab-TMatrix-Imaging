% Ralf Mouthaan
% University of Cambridge
% September 2020
%
% Testing the imaging capability of my system.

clc; clear variables; close all;

%%

Mask = ones(25, 25);
x = linspace(-12,12,25);
Mask(sqrt(x.^2 + x.'.^2) > 12) = 0;
Mask = logical(Mask);
imagesc(Mask);

load('T-Matrix');

%% Spade Hologram

Eout_meas = dlmread('Spade Result.txt');
Ein_meas = dlmread('Spade Hologram.txt');

Ein_meas = Ein_meas.';

Ein_meas = reshape(Ein_meas, 25, 25);
h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_meas));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'SpadeAmplitudeDisplayed.png');

Eout_meas = Eout_meas(:);
Eout_meas = conj(Eout_meas);

Ein_est = Tinv*Eout_meas;
Ein_est = reshape(Ein_est, 25,25);

h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_est));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'SpadeAmplitudeEstimated.png');

fprintf('Spade Error = %f\n', sum(sum(abs(abs(Ein_est(Mask)) - abs(Ein_meas(Mask))))) / sum(sum(Mask)));

%% Club Hologram

Eout_meas = dlmread('Club Result.txt');
Ein_meas = dlmread('Club Hologram.txt');

Ein_meas = Ein_meas.';

Ein_meas = reshape(Ein_meas, 25, 25);
h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_meas));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'ClubAmplitudeDisplayed.png');

Eout_meas = Eout_meas(:);
Eout_meas = conj(Eout_meas);

Ein_est = Tinv*Eout_meas;
Ein_est = reshape(Ein_est, 25,25);

h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_est));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'ClubAmplitudeEstimated.png');

fprintf('Club Error = %f\n', sum(sum(abs(abs(Ein_est(Mask)) - abs(Ein_meas(Mask))))) / sum(sum(Mask)));

%% Heart Hologram

Eout_meas = dlmread('Heart Result.txt');
Ein_meas = dlmread('Heart Hologram.txt');

Ein_meas = Ein_meas.';

Ein_meas = reshape(Ein_meas, 25, 25);
h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_meas));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'HeartAmplitudeDisplayed.png');

Eout_meas = Eout_meas(:);
Eout_meas = conj(Eout_meas);

Ein_est = Tinv*Eout_meas;
Ein_est = reshape(Ein_est, 25,25);

h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_est));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'HeartAmplitudeEstimated.png');

fprintf('Heart Error = %f\n', sum(sum(abs(abs(Ein_est(Mask)) - abs(Ein_meas(Mask))))) / sum(sum(Mask)));

%% Diamond Hologram

Eout_meas = dlmread('Diamond Result.txt');
Ein_meas = dlmread('Diamond Hologram.txt');

Ein_meas = Ein_meas.';

Ein_meas = reshape(Ein_meas, 25, 25);
h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_meas));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'DiamondAmplitudeDisplayed.png');

Eout_meas = Eout_meas(:);
Eout_meas = conj(Eout_meas);

Ein_est = Tinv*Eout_meas;
Ein_est = reshape(Ein_est, 25,25);

h = figure('Position', [400 400 400 400]);
imagesc(abs(Ein_est));
cbar = colorbar;
axis square;
xticks('');
yticks('');
caxis([0 1.1])
cbar.Ticks = [0 0.25 0.5 0.75 1];

saveas(h, 'DiamondAmplitudeEstimated.png');

fprintf('Diamond Error = %f\n', sum(sum(abs(abs(Ein_est(Mask)) - abs(Ein_meas(Mask))))) / sum(sum(Mask)));

