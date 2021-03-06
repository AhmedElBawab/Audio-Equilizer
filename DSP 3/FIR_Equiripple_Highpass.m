function Hd = FIR_Equiripple_Highpass(fs , n , fstop , fpass)
%FIR_EQUIRIPPLE_HIGHPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 18:26:52

% Equiripple Highpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N     = n;   % Order
Fstop = fstop;  % Stopband Frequency
Fpass = fpass;  % Passband Frequency
Wstop = 1;     % Stopband Weight
Wpass = 1;     % Passband Weight
dens  = 20;    % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop Fpass Fs/2]/(Fs/2), [0 0 1 1], [Wstop Wpass], ...
           {dens});
Hd = dfilt.dffir(b);

% [EOF]
