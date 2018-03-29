close all,clear all,clc;
%生成8KHz抽样的持续1秒钟的数字信号，是频率为200Hz的单位样值“串”
fs=8000;
NS1=200;
NS2=300;
N_200=floor(fs/200);
N_300=floor(fs/300);
T=1:fs;
L=length(T);
result1=(mod(T,N_200)==0);
result2=(mod(T,N_300)==0);
figure;
subplot(2,1,1);
plot(0.2*L:0.4*L,result1(0.2*L:0.4*L));
title('200Hz');
subplot(2,1,2);
plot(0.2*L:0.4*L,result2(0.2*L:0.4*L));
title('300Hz');
sound(double(result1),fs);
sound(double(result2),fs); %需要转为doule才不会报错