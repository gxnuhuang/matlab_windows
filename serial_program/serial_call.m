clc;
s = serial('COM1');     % creat serial port obj
set(s,'BaudRate',38400,'DataBits',8,'StopBits',1,...
    'Parity','none','FlowControl','none');  % set properties for serial


s.BytesAvailableFcnMode = 'terminator'; % byte number or terminator

% s.BytesAvailableFcnCount = 40;
% s.BytesAvailableFcnMode = 'byte';
s.BytesAvailableFcn = {@serial_callback};   % {@mycallback,time}

fopen(s);

pause;      %right here is receiving the data and plot
fclose(s);
delete(s)
clear s
close all;
clear all;