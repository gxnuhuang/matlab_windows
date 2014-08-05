     data=sin(1:64); %创建波形和可视化它。
     plot(data);
     t=tcpip('localhost', 30000, 'NetworkRole', 'client');%创建一个客户端接口，并打开它。
     fopen(t);%这时候，服务器端的fopen将会返回。
     fwrite(t, data);%写波形到服务器
