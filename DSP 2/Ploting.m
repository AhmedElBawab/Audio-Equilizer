% ------------------------------ Signal in time domain ---------%
[y,fs] = audioread('NoisySpeech-16-22p5-mono-5secs.wav');
%y = samples
%fs = sampling frequency 
t=linspace(0,length(y)/fs,length(y));
%linspace = creating time vector
%0= start time
%length(y)/fs = end time
%length(y) = number of samples in y 
Nfft=length(y);
%Nfft = length of fft
subplot(4,1,1);
plot(t(1:Nfft/2),y(1:Nfft/2));
title('Original Time');
% ------------------------------ Signal in time domain ---------%

% ------------------------------ Signal in freq domain ---------%
f=linspace(-fs/2,fs/2,Nfft);
%f =creating frequency vector
%-fs/2 = start time
%fs/2 = End time
%Nfft = Length of the frequency vector
y_fft=fftshift(fft(y)./(Nfft));
%y_fft = the fft of the samples y in 1024 points
subplot(4,1,2);
plot(f(1:Nfft),y_fft(1:Nfft));
title('Original Freq');
% ------------------------------ Signal in freq domain ---------%

% ------------------------------- Filtered Time Signal ---------%
fill_y = filter(test8 , y);

subplot(4,1,3);
plot(t(1:Nfft/2),fill_y(1:Nfft/2));
title('Filtered Time');
% ------------------------------- Filtered Time Signal ---------%

% ------------------------------- Filtered Freq Signal ---------%
fill_y_fft = filter(test8 , y_fft);

subplot(4,1,4);
plot(f(1:Nfft),fill_y_fft(1:Nfft));
title('Filtered Freq');
% ------------------------------- Filtered Freq Signal ---------%

% ------------------------------ Play Audio File ---------------%
player = audioplayer(y,fs);
play(player);
% ------------------------------ Play Audio File ---------------%