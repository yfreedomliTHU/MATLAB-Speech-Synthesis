close all,clear all,clc;
%����8KHz�����ĳ���1���ӵ������źţ���Ƶ��Ϊ200Hz�ĵ�λ��ֵ������
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
sound(double(result2),fs); %��ҪתΪdoule�Ų��ᱨ��