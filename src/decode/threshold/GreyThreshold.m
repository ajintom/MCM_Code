function [BW] = GreyThreshold(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder App. The colorspace and
%  minimum/maximum values for each channel of the colorspace were set in the
%  App and result in a binary mask BW and a composite image maskedRGBImage,
%  which shows the original RGB image values under the mask BW.

% Auto-generated by colorThresholder app on 25-Mar-2016
%------------------------------------------------------


RGB = im2double(RGB);
cform = makecform('srgb2lab', 'AdaptedWhitePoint', whitepoint('D65'));
I = applycform(RGB,cform);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 7.951;
channel1Max = 44.073;

% Define thresholds for channel 2 based on histogram settings
channel2Min = -20.858;
channel2Max = 27.816;

% Define thresholds for channel 3 based on histogram settings
channel3Min = -45.526;
channel3Max = -25.607;

% Create mask based on chosen histogram thresholds
BW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);

