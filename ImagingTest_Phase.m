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

arrSymbols = {'Spade', 'Club', 'Heart', 'Diamond'};

for i = 1:length(arrSymbols)
    
    Symbol = arrSymbols{i};

    Eout_meas = dlmread([Symbol ' Result.txt']);
    Ein_meas = dlmread([Symbol ' Hologram.txt']);

    Ein_meas = reshape(Ein_meas, 25,25);

    h = figure('Position', [400 400 400 400]);
    imagesc(angle(Ein_meas));
    cbar = colorbar;
    axis square;
    xticks('');
    yticks('');
    caxis([0 2*pi])
    cbar.Ticks = [0 pi 2*pi];
    cbar.TickLabels = {'0', '\pi', '2\pi'};
    colormap hsv
    
    saveas(h, [Symbol 'PhaseDisplayed.png'])

    Eout_meas = Eout_meas(:);
    Eout_meas = conj(Eout_meas);

    Ein_est = Tinv*Eout_meas;
    Ein_est = reshape(Ein_est, 25,25);
    arg = angle(Ein_est);
    arg = arg - mean(mean(arg(Ein_meas > 0)));
    arg(arg < 0) = arg(arg < 0) + 2*pi;
    arg(arg > 2*pi) = arg(arg > 2*pi) - 2*pi;

    h = figure('Position', [400 400 400 400]);
    imagesc(arg);
    cbar = colorbar;
    axis square;
    xticks('');
    yticks('');
    caxis([0 2*pi])
    cbar.Ticks = [0 pi 2*pi];
    cbar.TickLabels = {'0', '\pi', '2\pi'};
    colormap hsv

    Diff = angle(Ein_meas) - arg;
    Diff = abs(Diff);
    Diff(Diff > pi) = Diff(Diff > pi) - 2*pi;

    figure;
    imagesc(Diff);
    colorbar
    fprintf('%s Error = %f\n', Symbol, sum(sum(Diff(Mask)))/sum(sum(Mask)));

    saveas(h, [Symbol 'PhasePredicted.png'])

end

