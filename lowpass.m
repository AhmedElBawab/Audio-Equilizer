 fs = 50e3;
 t = linspace(0,1,50e3);
 % 1 kHz and 3 kHz sine waves
 x = cos(2*pi*1e3*t)+0.5*sin(2*pi*3e3*t)+randn(size(t));
 % Lowpass filter everything below 20 kHz
 % Specify the filter
 hlpf = fdesign.lowpass('Fp,Fst,Ap,Ast',20e3,20.1e3,0.5,50,50e3);
 % Design the filter
 D = design(hlpf);
 % apply the filter
 %y = filter(D,x);
 y = filter(test3 , x);
 subplot(211)
 plot(t(1:1000),x(1:1000)); title('Original Waveform');
 subplot(212)
 plot(t(1:1000),y(388:1000+387)); title('Filtered Waveform');
 figure;
 subplot(211)
 plot(psd(spectrum.periodogram,x,'Fs',fs,'NFFT',length(x)));
 title('Original Signal PSD');
 subplot(212);
 plot(psd(spectrum.periodogram,y,'Fs',fs,'NFFT',length(x)));
 title('Filtered Signal PSD');