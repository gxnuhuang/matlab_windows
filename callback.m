function callback(s,BytesAvailable,p)
    global i;
    global t;
    global x;
    global m;
    
%     p = plot(t,m,...
%              'EraseMode','background','MarkerSize',5);
    out = fscanf(s) %read data from s

    data = str2num(out);
    if data>-2 & data < 2 %detect if data is legal
    %    disp('*******data comes! \n');
    t=[t 0.01*2*pi*i];   %0 0.1 0.2 0.3.. %Matrix 1*(i+1), column is increasing
    m=[m data]; %Matrix 2*(i+1), 2row, i+1 column.
    
    %set(p(1),'XData',t,'YData',m(1,:))
    %set(p(2),'XData',t,'YData',m(2,:))
    set(p,'XData',t,'YData',m(1,:))
    
    drawnow
    x = x + 3.6/360*2*pi;   % x = x+0.1
    axis([x x+2*pi -1.5 1.5]);
    pause(0.1);
    i = i+1;
    end
    

end
