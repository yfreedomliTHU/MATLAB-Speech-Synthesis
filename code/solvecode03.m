close all,clear all,clc;
fs=8000;
i=1;
x=zeros(8000,1);
while(i<=fs)     %ѭ��ʵ��
    x(i)=1;
    %����ÿ��Ϊ10ms������m=i/80ȡ����,������ʾ����������
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