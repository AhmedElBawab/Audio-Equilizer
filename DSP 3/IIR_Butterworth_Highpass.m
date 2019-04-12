function Hd = IIR_Butterworth_Highpass(fs , n , fc)
%IIR_BUTTERWORTH_HIGHPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 18:35:28

% Butterworth Highpass filter designed using FDESIGN.HIGHPASS.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N  = n;   % Order
Fc = fc;  % Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.highpass('N,F3dB', N, Fc, Fs);
Hd = design(h, 'butter');

% [EOF]