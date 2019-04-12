function Hd = FIR_Window_Rectangular_Highpass(fs , n , fc)
%FIR_WINDOW_RECTANGULAR_HIGHPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 18:34:17

% FIR Window Highpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N    = n;      % Order
Fc   = fc;     % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = rectwin(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'high', win, flag);
Hd = dfilt.dffir(b);

% [EOF]