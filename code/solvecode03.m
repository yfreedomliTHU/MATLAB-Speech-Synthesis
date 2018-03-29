close all,clear all,clc;
fs=8000;
i=1;
x=zeros(8000,1);
while(i<=fs)     %循环实现
    x(i)=1;
    %由于每段为10ms，所以m=i/80取整数,根据提示，基音周期
    PT=80+5*mod(floor(i/80),50);
    i=i+PT;
end
%sound(x,fs);
% plot(x);
a = [1,-1.3789,0.9506];
b = [1];
s=filter(b,a,x);
sound(s,fs);
subplot(2,1,1);
plot(x);
title('e(n)');
subplot(2,1,2);
plot(s);
title('s(n)');