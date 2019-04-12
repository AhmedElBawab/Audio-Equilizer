
%Fourier Transform of Sound File

%Load File
%file = 'C:\MATLAB7\work\tuning_fork_A4';
[y,Fs] = audioread('NoisySpeech-16-22p5-mono-5secs.wav');

Nsamps = length(y);
t = (1/Fs)*(1:Nsamps);          %Prepare time data for plot

%Do Fourier Transform
y_fft = abs(fft(y));            %Retain Magnitude
y_fft = y_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

%Plot Sound File in Time Domain
figure
plot(t, y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Junk in Time Domain')

%Plot Sound File in Frequency Domain
figure
plot(f, y_fft)
xlim([0 1000])
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Frequency Response of junk')

player = audioplayer(filter(test6,y_fft),fs);
play(player);