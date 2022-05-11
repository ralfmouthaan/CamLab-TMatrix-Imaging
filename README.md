# CamLab-TMatrix-Imaging

Matlab scripts to compare estimated image to ground truth image for imaging through scattering media and multimode fibres.

First, perform a transmission matrix measurement run using CamLab-TMatrix-Measurement, then calculate the transmission matrix using CamLab-TMatrix-Calculation. CamLab-TMatrix-Measurement can then be used to display images on the SLM, and to capture the corresponding scrambled light fields. The scripts in this repository allow the calculated transmission matrix to be used to unscramble the light fields and obtain an estimate of the displayed image. This estimated image can then be compared to the ground truth.

This has been implemented for both amplitude and phase imaging.
