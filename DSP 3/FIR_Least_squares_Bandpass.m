function Hd = FIR_Least_squares_Bandpass(fs , n , fstop1 , fpass1 , fpass2 , fstop2)
%FIR_LEAST-SQUARES_BANDPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the Signal Processing Toolbox 7.4.
% Generated on: 20-Dec-2018 17:33:50

% FIR least-squares Bandpass filter designed using the FIRLS function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N      = n;    % Order
Fstop1 = fstop1;   % First Stopband Frequency
Fpass1 = fpass1;   % First Passband Frequency
Fpass2 = fpass2;  % Second Passband Frequency
Fstop2 = fstop2;  % Second Stopband Frequency
Wstop1 = 1;   % First Stopband Weight
Wpass  = 1;   % Passband Weight
Wstop2 = 1;   % Second Stopband Weight

% Calculate the coefficients using the FIRLS function.
b  = firls(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [Wstop1 Wpass Wstop2]);
Hd = dfilt.dffir(b);

% [EOF]