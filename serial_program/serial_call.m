clc;
s = serial('COM1');     % creat serial port obj
set(s,'BaudRate',115200,'DataBits',8,'StopBits',1,...
    'Parity','none','FlowControl','none');  % set properties for serial


s.BytesAvailableFcnMode = 'terminator'; % byte number or terminator

% s.BytesAvailableFcnCount = 40;
% s.BytesAvailableFcnMode = 'byte';
s.BytesAvailableFcn = {@serial_callback};   % {@mycallback,time}
i=0;
fopen(s);
while(1)
i=i+1;
fprintf(s,'zq:987:123:459matlab%fh',i)
end
%fprintf('hzq:matlab send test\r\n')
%pause;      %right here is receiving the data and plot
fclose(s);
delete(s)
clear s
close all;
clear all;