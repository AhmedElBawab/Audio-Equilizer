function Hd = test6
%TEST6 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 19-Dec-2018 16:57:59

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 22500;  % Sampling Frequency

Fstop1 = 0.2 * (Fs/2);            % First Stopband Frequency
Fpass1 = 0.225 * (Fs/2);            % First Passband Frequency
Fpass2 = 0.5 * (Fs/2);            % Second Passband Frequency
Fstop2 = 0.55 * (Fs/2);            % Second Stopband Frequency
Dstop1 = 0.001;           % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
