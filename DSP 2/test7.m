%s is the original voice signal
%Fs is the sampling frequency of the voice signal
[s,Fs]=audioread('NoisySpeech-16-22p5-mono-5secs.wav');                       
ts = linspace(0,length(s)/Fs,length(s));         %time axis for the original voice signal
s1=s(1:5*Fs,:);                                  %s1 is the voice signal for a duration of 5 seconds
ts1 = linspace(0,length(s1)/Fs,length(s1));      %time axis for a duration of 5 seconds
S1=fftshift(fft(s1)./length(s1));                %S1 is the voice signal after using Fourier Transform
fs1=linspace(-Fs/2,Fs/2,length(s1));             %frequency axis
magnitudeS1=abs(S1);                             %Magnitude Value Of the voice signal after using Fourier Transform
X = S1;                                          %Phase Angles In Degree Of the voice signal after using Fourier Transform
thX = max(abs(S1))./10;
X(abs(S1)<thX)=0;
phaseS1 = angle(X)*180/pi;
spectral_densityS1=abs(S1).^2;                   %Power Spectral Density Of the voice signal after using Fourier Transform
%3rd order Low Pass Filter
Fc=300;    %cutoff frequency = 4 KHZ
N=3;        %order Of Filter
h  = fdesign.lowpass('N,F3dB', N, Fc, Fs);
Hd = design(h, 'butter');
os1=filter(Hd,s1);                               %os1 is the Output voice signal from the filter
OS1=fftshift(fft(os1)./length(os1));             %OS1 is the Output voice signal from the filter after using Fourier Transform
magnitudeOS1=abs(OS1);                           %Magnitude Value Of the voice signal from the filter 
OX = OS1;                                        %Phase Angles In Degree Of the voice signal from the filter
thOX = max(abs(OS1))./10;
OX(abs(OS1)<thOX)=0;
phaseOS1 = angle(OX)*180/pi;
spctral_densityOS1=abs(OS1).^2;                  %Power Spectral Density Of the voice signal from the filter
subplot(3,2,[1 2]);       plot(ts1,s1);
title('the voice signal for a duration of 5 seconds.');
subplot(3,2,3);           plot(fs1,magnitudeS1);
title('Magnitude Value Of the voice signal In Frequency Domain');
subplot(3,2,5);           plot(fs1,phaseS1);
title('Phase Angles In Degree Of the voice signal In Frequency Domain');
subplot(3,2,[4,6]);       plot(fs1,spectral_densityS1);
title('Power Spectral Density Of the voice signal In Frequency Domain');
figure
subplot(3,2,[1 2]);       plot(ts1,os1);
title('the output voice signal From The Filter for a duration of 5 seconds. ');
subplot(3,2,3);           plot(fs1,magnitudeOS1);
title('Magnitude Value Of the output voice signal From The Filter In Frequency Domain');
subplot(3,2,5);           plot(fs1,phaseOS1);
title('Phase Angles In Degree Of the output voice signal From The Filter In Frequency Domain');
subplot(3,2,[4,6]);       plot(fs1,spctral_densityOS1);
title('Power Spectral Density Of the output voice signal From The Filter In Frequency Domain');
figure;
plot(fs1,S1);