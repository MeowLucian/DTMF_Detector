close all;clear;clc;
%% Main program
global keyNames tone_all h1 h2 h3 h4 Decode_output
keyNames=[];
tone_all=[];
Decode_output=[];

h1=subplot(2,3,2);grid on;
title('Signal tone');
ylabel('Amplitude');
xlabel('time (second)');
axis([0 0.035 -2 2]);

h2=subplot(2,3,5);grid on;
title('Spectrum for tone');
ylabel('Amplitude');
xlabel('frequency (Hz)');
axis([500 2000 0 1]);

h3=subplot(2,3,3);grid on;
title('BPF frequency responses');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
axis([500 2000 0 1]);

h4=subplot(2,3,6);grid on;
title('Decode Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
axis([500 2000 0 1]);
%% Button and UI Window
set(gcf,'Units','centimeters','position',[1 2 49 24],'Name','DTMF_Main'); % UI Window Position

bip=[100,600]; % button inital position
bs=60; % button inital size

AuthorDisplay=uicontrol('Style', 'text', 'Position',[bip+[0 bs*3],320,35],'String', 'Designed by MeowLucian','FontSize',20,'HorizontalAlignment','left','BackgroundColor',[0.937 0.867 0.867]);

InputDisplay=uicontrol('Style', 'text', 'Position',[bip+[0 bs*2],85,35],'String', 'Input : ','FontSize',20,'HorizontalAlignment','left','BackgroundColor',[0.839 0.91 0.851]);

Display=uicontrol('Style', 'text', 'Position',[bip+[0 bs*1],385,35],'String', 'KeyNames','FontSize',15,'HorizontalAlignment','left','FontSize',20,'BackgroundColor',[0.973 0.973 0.973]);
set(Display,'String',keyNames); % Property

button1 = uicontrol; % Generate Button
set(button1,'String','1','Position',[bip,repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button1,'Callback','button_1'); % button reaction and call function button_1

button2 = uicontrol; % Generate Button
set(button2,'String','2','Position',[bip+[bs*1 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button2,'Callback','button_2'); % button reaction and call function button_2

button3 = uicontrol; % Generate Button
set(button3,'String','3','Position',[bip+[bs*2 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button3,'Callback','button_3'); % button reaction and call function button_3

buttonA = uicontrol; % Generate Button
set(buttonA,'String','A','Position',[bip+[bs*3 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonA,'Callback','button_A'); % button reaction and call function button_A

button4 = uicontrol; % Generate Button
set(button4,'String','4','Position',[bip+[0 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button4,'Callback','button_4'); % button reaction and call function button_4

button5 = uicontrol; % Generate Button
set(button5,'String','5','Position',[bip+[bs*1 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button5,'Callback','button_5'); % button reaction and call function button_5

button6 = uicontrol; % Generate Button
set(button6,'String','6','Position',[bip+[bs*2 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button6,'Callback','button_6'); % button reaction and call function button_6

buttonB = uicontrol; % Generate Button
set(buttonB,'String','B','Position',[bip+[bs*3 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonB,'Callback','button_B'); % button reaction and call function button_B

button7 = uicontrol; % Generate Button
set(button7,'String','7','Position',[bip+[0 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button7,'Callback','button_7'); % button reaction and call function button_7

button8 = uicontrol; % Generate Button
set(button8,'String','8','Position',[bip+[bs*1 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button8,'Callback','button_8'); % button reaction and call function button_8

button9 = uicontrol; % Generate Button
set(button9,'String','9','Position',[bip+[bs*2 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button9,'Callback','button_9'); % button reaction and call function button_9

buttonC = uicontrol; % Generate Button
set(buttonC,'String','C','Position',[bip+[bs*3 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonC,'Callback','button_C'); % button reaction and call function button_C

buttonStar = uicontrol; % Generate Button
set(buttonStar,'String','*','Position',[bip+[0 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonStar,'Callback','button_Star'); % button reaction and call function button_Star

button0 = uicontrol; % Generate Button
set(button0,'String','0','Position',[bip+[bs*1 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button0,'Callback','button_0'); % button reaction and call function button_0

buttonSign = uicontrol; % Generate Button
set(buttonSign,'String','#','Position',[bip+[bs*2 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonSign,'Callback','button_Sign'); % button reaction and call function button_Sign

buttonD = uicontrol; % Generate Button
set(buttonD,'String','D','Position',[bip+[bs*3 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonD,'Callback','button_D'); % button reaction and call function button_D

buttonSoundAll = uicontrol; % Generate Button
set(buttonSoundAll,'String','SoundAll','Position',[bip+[0 -bs*4],bs*4,bs],'BackgroundColor',[0.839 0.91 0.851]); % Property
set(buttonSoundAll,'Callback','button_SoundAll'); % button reaction and call function button_SoundAll

buttonClear = uicontrol; % Generate Button
set(buttonClear,'String','Clear','Position',[bip+[0 -bs*5],bs*4,bs],'BackgroundColor',[0.937 0.867 0.867]); % Property
set(buttonClear,'Callback','button_Clear'); % button reaction and call function button_Clear

buttonDecode = uicontrol; % Generate Button
set(buttonDecode,'String','Decode','Position',[bip+[0 -bs*6],bs*4,bs],'BackgroundColor',[0.992 0.918 0.796]); % Property
set(buttonDecode,'Callback','button_Decode'); % button reaction and call function button_Decode

DecodeDisplay=uicontrol('Style', 'text', 'Position',[bip+[0 -bs*7],125,35],'String', 'Decode : ','FontSize',20,'HorizontalAlignment','left','BackgroundColor',[0.839 0.91 0.851]);

Display2=uicontrol('Style', 'text', 'Position',[bip+[0 -bs*8],385,35],'String', 'KeyNames','FontSize',15,'HorizontalAlignment','left','FontSize',20,'BackgroundColor',[0.973 0.973 0.973]);
set(Display2,'String',Decode_output); % Property