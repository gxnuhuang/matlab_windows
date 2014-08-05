     t=tcpip('0.0.0.0', 30000, 'NetworkRole', 'server'); %接受来自任何计算机上的端口30000的连接     
     fopen(t);%打开一个连接。直到接受到连接才返回。
     pause(10)
     data=fread(t, t.BytesAvailable) %读取波形数据
     plot(data) %绘制波形图
