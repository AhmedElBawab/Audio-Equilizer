[y,fs] = audioread('NoisySpeech-16-22p5-mono-5secs.wav');
t = linspace(0,length(y)/fs,length(y));

nfft = length(y);
ydft = abs(fft(y,nfft));
f = linspace(0,length(ydft)/fs,length(ydft));

yfilt = filter(test6 , y);

ydftfilt = filter(test6 , ydft);

subplot(311)
plot(t,y,t,yfilt,'r','linewidth',1.5);
title('Time Waveforms');
xlabel('Time (s)')
legend('Original Noisy Signal','Filtered Signal');
grid on
axis tight

subplot(312)
plot(f(1:nfft/2),ydft(1:nfft/2),'r','linewidth',1.5);
subplot(313);
plot(f(1:nfft/2),ydftfilt(1:nfft/2));
title('Frequency Waveforms');
xlabel('Frequency (HZ)')
legend('Original Noisy Signal','Filtered Signal');
grid on
axis tight

%subplot(411)
%plot(t,y);
%title('Original time Waveform');

%subplot(412)
%plot(f(1:nfft/2),ydft(1:nfft/2));
%title('Original freq Waveform');

%subplot(413)
%plot(t,yfilt);
%title('filtered time Waveform');

%subplot(414)
%plot(f(1:nfft/2),ydftfilt(1:nfft/2));
%title('filtered freq Waveform');