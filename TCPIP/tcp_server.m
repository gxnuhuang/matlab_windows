     t=tcpip('0.0.0.0', 30000, 'NetworkRole', 'server'); %���������κμ�����ϵĶ˿�30000������     
     fopen(t);%��һ�����ӡ�ֱ�����ܵ����Ӳŷ��ء�
     pause(10)
     data=fread(t, t.BytesAvailable) %��ȡ��������
     plot(data) %���Ʋ���ͼ
