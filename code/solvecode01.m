close all, clear all, clc;
a = [1,-1.3789,0.9506];
b = [1];
n=[0:200]'; 
[z,p,k] = tf2zp(b,a);                % 得到零极点       
peak_freq = angle(p(1))/(2*pi)*8000; % 共振峰频率
%plot
figure;
zplane(b,a),title('零极点图');        % 画出零极点图
figure;
freqz(b,a);                          % 画系统函数的频率响应
figure;
hi=impz(b,a,n);                      % 用impz求系统单位样值响应
subplot(1,2,1);
stem(n,hi,'b-');
subplot(1,2,2);                      % 用filter求系统单位样值相应                     
x = (n==0);                          % 以单位样值序列为激励信号
hf=filter(b,a,x);
stem(n,hf,'k-');
%12问，共振峰频率提高150Hz 后的a1 和a2 分别是多少？
p11=p(1)*exp(i*150*2*pi/8000);     %直接计算新的p
p12=p(2)*exp(-i*150*2*pi/8000);
p1=[p12,p11]';                %拼接得到二维的p1
[b1,a1]=zp2tf(z,p1,k);        %由新的p利用zp2tf函数即可得到a与b的值
