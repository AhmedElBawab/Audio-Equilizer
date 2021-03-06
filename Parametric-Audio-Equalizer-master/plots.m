function varargout = plots(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plots_OpeningFcn, ...
                   'gui_OutputFcn',  @plots_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function plots_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global global_struct;

% the values of the gain
slid1 = global_struct.slid1;
slid2 = global_struct.slid2;
slid3 = global_struct.slid3;
slid4 = global_struct.slid4;
slid5 = global_struct.slid5;
slid6 = global_struct.slid6;
slid7 = global_struct.slid7;
slid8 = global_struct.slid8;
slid9 = global_struct.slid9;

global x1 x2 x3 x4 x5 x6 x7 x8 x9 total_x outputSampleRate;

outputSampleRate = global_struct.outputSampleRate;  % output sample rate
firType = global_struct.firType;   %filter type
x = global_struct.x;           %input wav
fir = global_struct.fir;       %if the filter is fir 
fs=global_struct.fs;           %the sample rate of the wav

order=10;


if fir == 1
    %fir filter
    if firType == 1
        %equiripple
        f=fir_lp_equiripple(fs,order,170,180);
        x1=filter(f,x);
        f=fir_bp_equiripple(fs,order,160,170,310,320);
        x2=filter(f,x);
        f=fir_bp_equiripple(fs,order,300,310,600,610);
        x3=filter(f,x);
        f=fir_bp_equiripple(fs,order,590,600,1000,1010);
        x4=filter(f,x);
        f=fir_bp_equiripple(fs,order,990,1000,3000,3010);
        x5=filter(f,x);
        f=fir_bp_equiripple(fs,order,2990,3000,6000,6010);
        x6=filter(f,x);
        f=fir_bp_equiripple(fs,order,5990,6000,12000,12010);
        x7=filter(f,x);
        f=fir_bp_equiripple(fs,order,11990,12000,14000,14010);
        x8=filter(f,x);
        f=fir_bp_equiripple(fs,order,13990,14000,16000,16010);
        x9=filter(f,x);
       
    elseif firType == 2
        %least-square
        f=fir_lp_least_squares(fs,order,170,180);
        x1=filter(f,x);
        f=fir_bp_least_squares(fs,order,160,170,310,320);
        x2=filter(f,x);
        f=fir_bp_least_squares(fs,order,300,310,600,610);
        x3=filter(f,x);
        f=fir_bp_least_squares(fs,order,590,600,1000,1010);
        x4=filter(f,x);
        f=fir_bp_least_squares(fs,order,990,1000,3000,3010);
        x5=filter(f,x);
        f=fir_bp_least_squares(fs,order,2990,3000,6000,6010);
        x6=filter(f,x);
        f=fir_bp_least_squares(fs,order,5990,6000,12000,12010);
        x7=filter(f,x);
        f=fir_bp_least_squares(fs,order,11990,12000,14000,14010);
        x8=filter(f,x);
        f=fir_bp_least_squares(fs,order,13990,14000,16000,16010);
        x9=filter(f,x);
    elseif firType == 3
        %rectangular
         f=fir_lp_window_rectangular(fs,order,170);
        x1=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_rectangular(fs,order,14000,16000);
        x9=filter(f,x);
    elseif firType == 4
        %Chebyshev
        f=fir_lp_window_chebyshev(fs,order,170);
        x1=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_chebyshev(fs,order,14000,16000);
        x9=filter(f,x);
    elseif firType == 5
        %hamming
        f=fir_lp_window_hamming(fs,order,170);
        x1=filter(f,x);
        f=fir_bp_window_hamming(fs,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_hamming(fs,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_hamming(fs,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_hamming(fs,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_hamming(fs,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_hamming(fs,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_hamming(fs,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_hamming(fs,order,14000,16000);
        x9=filter(f,x);
    else
        %blackman-harris
        f=fir_lp_window_blackman_harris(fs,order,170);
        x1=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,order,14000,16000);
        x9=filter(f,x);
    end
else
    %iir filter
    f=iir_lp_butterworth(fs,order,170);
    x1=filter(f,x);
    f=iir_bp_butterworth(fs,order,170,310);
    x2=filter(f,x);
    f=iir_bp_butterworth(fs,order,310,600);
    x3=filter(f,x);
    f=iir_bp_butterworth(fs,order,600,1000);
    x4=filter(f,x);
    f=iir_bp_butterworth(fs,order,1000,3000);
    x5=filter(f,x);
    f=iir_bp_butterworth(fs,order,3000,6000);
    x6=filter(f,x);
    f=iir_bp_butterworth(fs,order,6000,12000);
    x7=filter(f,x);
    f=iir_bp_butterworth(fs,order,12000,14000);
    x8=filter(f,x);
    f=iir_bp_butterworth(fs,order,14000,16000);
    x9=filter(f,x);
end

%multiply the gain with each band
x1s=x1*10^(slid1/20);
x2s=x2*10^(slid2/20);
x3s=x3*10^(slid3/20);
x4s=x4*10^(slid4/20);
x5s=x5*10^(slid5/20);
x6s=x6*10^(slid6/20);
x7s=x7*10^(slid7/20);
x8s=x8*10^(slid8/20);
x9s=x9*10^(slid9/20);

%the total output signal in time domain
total_x = x1s+x2s+x3s+x4s+x5s+x6s+x7s+x8s+x9s;

global_struct.output = total_x;
total_y=fft(total_x);
total_y=fftshift(total_y);
total_y_abs=abs(total_y);
total_y_ang=angle(total_y);

playControls;

t = (1/fs)*(1:length(x));    % time of the wav
axes(handles.in_time);
plot(t,x);                   % plot the input signal of time domain
title('Input in time domain');
xlabel('Time(S)');
ylabel('Amplitude(db)');

freq=linspace(-fs/2,fs/2,length(x));   % frequencies of the wav
axes(handles.in_freq_mag);
plot(freq,abs(fftshift(fft(x))));      % the magnitude of the input signal
title('Input in frequency domain (Magnitude Response)');
xlabel('Frequence(Hz)');
ylabel('Magnitude(db)');

axes(handles.in_freq_phase);
plot(freq,angle(fftshift(fft(x))));     % the phase of the input signal
title('Input in frequency domain (Phase Response)');
xlabel('Frequency(Hz)');
ylabel('Phase(Rad)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = (1/outputSampleRate)*(1:length(total_x));    % time of the wav
axes(handles.out_time);
plot(t,total_x);   % plot the output signal of time domain
title('output in time domain');
xlabel('Time(S)');
ylabel('Amplitude(db)');

freq=linspace(-outputSampleRate/2,outputSampleRate/2,length(total_x));    % frequencies of the wav
axes(handles.out_freq_mag);
plot(freq,total_y_abs);    % the magnitude of the output signal
title('output in frequence domain (Magnitude Response)');
xlabel('Frequence(Hz)');
ylabel('Magnitude(db)');

axes(handles.out_freq_phase);
plot(freq,total_y_ang);      % the phase of the output signal
title('output in frequence domain (Phase Response)');
xlabel('Frequence(Hz)');
ylabel('Phase(Rad)');



function varargout = plots_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes when selected object is changed in outType.
function outType_SelectionChangeFcn(hObject, eventdata, handles)

global var;
global x1 x2 x3 x4 x5 x6 x7 x8 x9 total_x outputSampleRate;

%get the specific band
if eventdata.NewValue == handles.band1
    var=x1;
elseif eventdata.NewValue == handles.band2   
     var=x2;
elseif eventdata.NewValue == handles.band3
     var=x3;
elseif eventdata.NewValue == handles.band4
     var=x4;
elseif eventdata.NewValue == handles.band5
     var=x5;
elseif eventdata.NewValue == handles.band6
     var=x6;
elseif eventdata.NewValue == handles.band7
     var=x7;
elseif eventdata.NewValue == handles.band8
     var=x8;
elseif eventdata.NewValue == handles.band9
     var=x9;
else
     var=total_x;
end

% plot the specific band in time and frequency domain
t = (1/outputSampleRate)*(1:length(var));
axes(handles.out_time);
plot(t,var);
title('Output in time domain');
xlabel('Time(S)');
ylabel('Amplitude(db)');

freq=linspace(-outputSampleRate/2,outputSampleRate/2,length(var));
axes(handles.out_freq_mag);
plot(freq,abs(fftshift(fft(var))));
title('Output in frequency domain (Magnitude Response)');
xlabel('Frequence(Hz)');
ylabel('Magnitude(db)');

axes(handles.out_freq_phase);
plot(freq,angle(fftshift(fft(var))));
title('Output in frequency domain (Phase Response)');
xlabel('Frequence(Hz)');
ylabel('Phase(Rad)');
