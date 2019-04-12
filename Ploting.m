% ------------------------------ Signal in time domain ---------%
[y,fs] = audioread('NoisySpeech-16-22p5-mono-5secs.wav');
%y = samples
%fs = sampling frequency 
t=linspace(0,length(y)/fs,length(y));
%linspace = creating time vector
%0= start time
%length(y)/fs = end time
%length(y) = number of samples in y 
subplot(3,1,1);
plot(t,y);
title('Original Time');
% ------------------------------ Signal in time domain ---------%

% ------------------------------ Signal in freq domain ---------%
Nfft=1024;
%Nfft = length of fft
f=linspace(0,fs,Nfft);
%f =creating frequency vector
%0 = start time
%fs = End time
%Nfft = Length of the frequency vector
X=abs(fft(y,Nfft));
%X = the fft of the samples y in 1024 points
subplot(3,1,2);
plot(f(1:Nfft/2),X(1:Nfft/2));
title('Original Freq');
% ------------------------------ Signal in freq domain ---------%

% ------------------------------ Play Audio File ---------------%
%player = audioplayer(y,fs);
%play(player);
% ------------------------------ Play Audio File ---------------%

% ------------------------------ Filtered Signal ---------------%

n = 7;
beginfreq = 700/(fs/2);
endfreq = 1100/(fs/2);
[b,a] = butter(n , [beginfreq, endfreq] , 'bandpass');
[H,W] = freqz(b,a,n);
fout = filter(b,a,X);

subplot(3,1,3);
plot(fout);
%stem(f(1:Nfft/2),yFilt(1:Nfft/2));
title('Filtered Time');
%plot(abs(yFilt));
player = audioplayer(,fs);
play(player);
% ------------------------------ Filtered Signal ---------------%