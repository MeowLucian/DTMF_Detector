global tone_all h1 h2
fs=8000;
t=[0:length(tone_all)-1]/fs;
h1=subplot(2,3,2);plot(t,tone_all);grid on;
title('Signal tone');
ylabel('Amplitude');
xlabel('time (second)');

for ii=0:(length(tone_all)/1421-1)
    tone=tone_all(1+1421*ii:1421*(ii+1));
    tone=tone(401:end);
    Ak=2*abs(fft(tone))/length(tone);Ak(1)=Ak(1)/2;
    f=[0:1:(length(tone)-1)/2]*fs/length(tone);
    h2=subplot(2,3,5);plot(f,Ak(1:(length(tone)+1)/2));grid on
    title('Spectrum for tone');
    ylabel('Amplitude');
    xlabel('frequency (Hz)');
    axis([500 2000 0 1]);
    soundsc(tone,fs);
    pause(0.25);
end

% Save tone_all.wav
audiowrite('tone_all.wav',(tone_all')/2,fs);