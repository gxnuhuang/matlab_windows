     data=sin(1:64); %�������κͿ��ӻ�����
     plot(data);
     t=tcpip('localhost', 30000, 'NetworkRole', 'client');%����һ���ͻ��˽ӿڣ���������
     fopen(t);%��ʱ�򣬷������˵�fopen���᷵�ء�
     fwrite(t, data);%д���ε�������
