s = serial('COM1');
set(s,'BaudRate',115200,'DataBits',8,'StopBits',1,...
    'Parity','none','FlowControl','none');
fopen(s)
fprintf(s,'huang')
out = fscanf(s)

fclose(s)
delete(s)
clear s