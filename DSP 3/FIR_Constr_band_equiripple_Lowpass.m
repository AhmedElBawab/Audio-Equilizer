function Hd = FIR_Constr_band_equiripple_Lowpass(fs , n , fpass , fstop)
%FIR_CONSTR_BAND_EQUIRIPPLE_LOWPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 18:12:02

% Constrained Band Equiripple FIR Lowpass filter designed using the
% FIRCBAND function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N     = n;   % Order
Fpass = fpass;  % Passband Frequency
Fstop = fstop;  % Stopband Frequency
Wpass = 1;     % Passband Weight
Wstop = 1;     % Stopband Weight
dens  = 20;    % Density Factor

% Calculate the coefficients using the FIRCBAND function.
b  = fircband(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
              {dens});
Hd = dfilt.dffir(b);

% [EOF]