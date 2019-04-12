function Hd = IIR_Butterworth_Bandpass(fs , n , fc1 , fc2)
%IIR_BUTTERWORTH_BANDPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 17:57:04

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N   = n;    % Order
Fc1 = fc1;   % First Cutoff Frequency
Fc2 = fc2;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]