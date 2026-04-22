clc;
clear;
close all;
fs = 8000;		
t = 0:1/fs:2;		
x = sin(2*pi*500*t);	
noise = 0.5*randn(size(t));	
xn = x + noise;		
[b,a] = butter(4,0.2,'low');	
y = filter(b,a,xn);		
figure;			
subplot(3,1,1)				
plot(t(1:200),x(1:200),'LineWidth',1.5)		
title('Tin hieu goc')		
xlabel('Time (s)')		
ylabel('Amplitude')		
grid on			
subplot(3,1,2)
plot(t(1:200),xn(1:200))
title('Tin hieu bi nhieu')
xlabel('Time (s)')
ylabel('Amplitude')
grid on
subplot(3,1,3)
plot(t(1:200),y(1:200),'r','LineWidth',1.5)
title('Tin hieu sau loc IIR')
xlabel('Time (s)')
ylabel('Amplitude')
grid on
figure;
freqz(b,a,1024,fs);
title('Dap ung tan so bo loc IIR');
figure;
zplane(b,a);
title('Do thi cuc-zero cua bo loc');
