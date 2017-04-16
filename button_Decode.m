global tone_all h1 h3 h4 Decode_output
Decode_output=[];
output=[];
tone_all_2=audioread('tone_all.wav'); % load 
tone_all_2=(tone_all_2')*2;
fs=8000;
%% Filter Bank Design
a697=[1 -2*cos(2*pi*18/205) 1];
a770=[1 -2*cos(2*pi*20/205) 1];
a852=[1 -2*cos(2*pi*22/205) 1];
a941=[1 -2*cos(2*pi*24/205) 1];
a1209=[1 -2*cos(2*pi*31/205) 1];
a1336=[1 -2*cos(2*pi*34/205) 1];
a1477=[1 -2*cos(2*pi*38/205) 1];
a1633=[1 -2*cos(2*pi*42/205) 1];

[w1, f]=freqz([1 -exp(-2*pi*18/205)],a697,512,fs);
[w2, f]=freqz([1 -exp(-2*pi*20/205)],a770,512,fs);
[w3, f]=freqz([1 -exp(-2*pi*22/205)],a852,512,fs);
[w4, f]=freqz([1 -exp(-2*pi*24/205)],a941,512,fs);
[w5, f]=freqz([1 -exp(-2*pi*31/205)],a1209,512,fs);
[w6, f]=freqz([1 -exp(-2*pi*34/205)],a1336,512,fs);
[w7, f]=freqz([1 -exp(-2*pi*38/205)],a1477,512,fs);
[w8, f]=freqz([1 -exp(-2*pi*42/205)],a1633,512,fs);

t=[0:length(tone_all_2)-1]/fs;
h1=subplot(2,3,2);plot(t,tone_all_2);grid on;
title('Signal tone');
ylabel('Amplitude');
xlabel('time (second)');

h3=subplot(2,3,3);plot(f,abs(w1)/1000,f,abs(w2)/1000,f,abs(w3)/1000,f,abs(w4)/1000,f,abs(w5)/1000,f,abs(w6)/1000,f,abs(w7)/1000,f,abs(w8)/1000);grid on
title('BPF frequency responses');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
axis([500 2000 0 1]);
legend('697','770','852','941','1209','1336','1477','1633');
%% Decode
for ii=0:(length(tone_all_2)/1421-1)
    tone=tone_all_2(1+1421*ii:1421*(ii+1));
    tone=tone(401:end);
    
    yDTMF=[tone 0];
    y697=filter(1,a697,yDTMF);
    y770=filter(1,a770,yDTMF);
    y852=filter(1,a852,yDTMF);
    y941=filter(1,a941,yDTMF);
    y1209=filter(1,a1209,yDTMF);
    y1336=filter(1,a1336,yDTMF);
    y1477=filter(1,a1477,yDTMF);
    y1633=filter(1,a1633,yDTMF);

    m(1)=sqrt(y697(206)^2+y697(205)^2-2*cos(2*pi*18/205)*y697(206)*y697(205));
    m(2)=sqrt(y770(206)^2+y770(205)^2-2*cos(2*pi*20/205)*y770(206)*y770(205));
    m(3)=sqrt(y852(206)^2+y852(205)^2-2*cos(2*pi*22/205)*y852(206)*y852(205));
    m(4)=sqrt(y941(206)^2+y941(205)^2-2*cos(2*pi*24/205)*y941(206)*y941(205));
    m(5)=sqrt(y1209(206)^2+y1209(205)^2-2*cos(2*pi*31/205)*y1209(206)*y1209(205));
    m(6)=sqrt(y1336(206)^2+y1336(205)^2-2*cos(2*pi*34/205)*y1336(206)*y1336(205));
    m(7)=sqrt(y1477(206)^2+y1477(205)^2-2*cos(2*pi*38/205)*y1477(206)*y1477(205));
    m(8)=sqrt(y1633(206)^2+y1633(205)^2-2*cos(2*pi*42/205)*y1633(206)*y1633(205));
    m=2*m/205;
    th=sum(m)/4;  % based on empirical measurement
    f=[697 770 852 941 1209 1336 1477 1633];
    f1=[0  4000];
    th=[th th];
    
    idx=find(m>th(1));
    Determination=f(idx);
    switch Determination(1)
            case {697}
                switch Determination(2)
                    case {1209}
                        output='1';
                    case {1336}
                        output='2';
                    case {1477}
                        output='3';
                    case {1633}
                        output='A';
                end
            case {770}
                switch Determination(2)
                    case {1209}
                        output='4';
                    case {1336}
                        output='5';
                    case {1477}
                        output='6';
                    case {1633}
                        output='B';
                end
            case {852}
                switch Determination(2)
                    case {1209}
                        output='7';
                    case {1336}
                        output='8';
                    case {1477}
                        output='9';
                    case {1633}
                        output='C';
                end
            case {941}
                switch Determination(2)
                    case {1209}
                        output='*';
                    case {1336}
                        output='0';
                    case {1477}
                        output='#';
                    case {1633}
                        output='D';
                end
    end
    
    Decode_output=[Decode_output,output];
    
    h4=subplot(2,3,6);stem(f,m);grid on
    hold on;
    plot(f1,th); % Threshold
    title('Decode Spectrum');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    axis([500 2000 0 1]);
    clear th
    hold off
    
    set(Display2,'String',Decode_output); % Property
    soundsc(tone,fs);
    pause(0.25);
end % LOOP