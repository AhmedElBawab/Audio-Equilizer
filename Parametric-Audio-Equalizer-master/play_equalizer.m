function play_equalizer(hObject, handles)
global player;
global global_struct;
[handles.y,handles.Fs] = audioread(global_struct.path);
%handles.Volume=get(handles.slider15,'value');
%handles.y=handles.y(NewStart:end,:); 
handles.g1=get(handles.slider11,'value');
handles.g2=get(handles.slider22,'value');
handles.g3=get(handles.slider33,'value');
handles.g4=get(handles.slider44,'value');
handles.g5=get(handles.slider55,'value');
 handles.g6=get(handles.slider66,'value');
 handles.g7=get(handles.slider77,'value');
 handles.g8=get(handles.slider88,'value');
 handles.g9=get(handles.slider99,'value');
%handles.g10=get(handles.slider12,'value');
set(handles.text16, 'String',handles.g1);
set(handles.text19, 'String',handles.g2);
set(handles.text20, 'String',handles.g3);
set(handles.text21, 'String',handles.g4);
set(handles.text22, 'String',handles.g5);
set(handles.text23, 'String',handles.g6);
set(handles.text24, 'String',handles.g7);
set(handles.text25, 'String',handles.g8);
set(handles.text26, 'String',handles.g9);
set(handles.text27, 'String',handles.g10);

cut_off=200; %cut off low pass dalama Hz
orde=16;
a=fir1(orde,cut_off/(handles.Fs/2),'low');
y1=handles.g1*filter(a,1,handles.y);

% %bandpass1
f1=201;
f2=400;
b1=fir1(orde,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.y);
% 
% %bandpass2
f3=401;
f4=800;
b2=fir1(orde,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.g3*filter(b2,1,handles.y);
% 
% %bandpass3
 f4=801;
f5=1500;
 b3=fir1(orde,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
 y4=handles.g4*filter(b3,1,handles.y);
% 
% %bandpass4
 f5=1501;
f6=3000;
 b4=fir1(orde,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
 y5=handles.g5*filter(b4,1,handles.y);
% 
% %bandpass5
  f7=3001;
f8=5000;
  b5=fir1(orde,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
  y6=handles.g6*filter(b5,1,handles.y);
% 
% %bandpass6
  f9=5001;
f10=7000;
  b6=fir1(orde,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
  y7=handles.g7*filter(b6,1,handles.y);
% 
% %bandpass7
  f11=7001;
f12=10000;
  b7=fir1(orde,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
  y8=handles.g8*filter(b7,1,handles.y);
% 
 % %bandpass8
  f13=10001;
f14=15000;
  b8=fir1(orde,[f13/(handles.Fs/2) f14/(handles.Fs/2)],'bandpass');
  y9=handles.g9*filter(b8,1,handles.y);
% 
 %highpass
cut_off2=15000;
c=fir1(orde,cut_off2/(handles.Fs/2),'high');
y10=handles.g10*filter(c,1,handles.y);
%handles.yT=y1+y2+y3+y4+y5+y6+y7;
 handles.yT=y1+y2+y3+y4+y5+y6+y7+y8+y9+y10;
player = audioplayer(handles.Volume*handles.yT, handles.Fs);
 subplot(2,1,1);
 plot(handles.y);
 subplot(2,1,2);
 plot(handles.yT);

guidata(hObject,handles)

