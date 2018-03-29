close all, clear all, clc;
a = [1,-1.3789,0.9506];
b = [1];
n=[0:200]'; 
[z,p,k] = tf2zp(b,a);                % �õ��㼫��       
peak_freq = angle(p(1))/(2*pi)*8000; % �����Ƶ��
%plot
figure;
zplane(b,a),title('�㼫��ͼ');        % �����㼫��ͼ
figure;
freqz(b,a);                          % ��ϵͳ������Ƶ����Ӧ
figure;
hi=impz(b,a,n);                      % ��impz��ϵͳ��λ��ֵ��Ӧ
subplot(1,2,1);
stem(n,hi,'b-');
subplot(1,2,2);                      % ��filter��ϵͳ��λ��ֵ��Ӧ                     
x = (n==0);                          % �Ե�λ��ֵ����Ϊ�����ź�
hf=filter(b,a,x);
stem(n,hf,'k-');
%12�ʣ������Ƶ�����150Hz ���a1 ��a2 �ֱ��Ƕ��٣�
p11=p(1)*exp(i*150*2*pi/8000);     %ֱ�Ӽ����µ�p
p12=p(2)*exp(-i*150*2*pi/8000);
p1=[p12,p11]';                %ƴ�ӵõ���ά��p1
[b1,a1]=zp2tf(z,p1,k);        %���µ�p����zp2tf�������ɵõ�a��b��ֵ
