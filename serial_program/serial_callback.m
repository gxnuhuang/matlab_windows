function serial_callback(obj, event)
%����printf("9600;123;568;NONE;LF\t\n");�ַ���
%     % Determine the type of event.
%     EventType = event.Type;
% 
%     % Determine the time of the error event.
%     EventData = event.Data;
%     EventDataTime = EventData.AbsTime;
% 
%     % Create a display indicating the type of event, the time of the event and
%     % the name of the object.
%     name = get(obj, 'Name');
%     fprintf([EventType ' event occurred at ' datestr(EventDataTime,13),...
%         ' for the object: ' name '.\n']);
    
    out = fscanf(obj); %read data from s
 %   fprintf('time_callback\n');
%     fprintf('time_callback out=%s\n',out);
%     
     C = textscan(out, '%d%d%d%s%s','delimiter',';'); 
    [br, sfc, hfc, par, tm] = deal(C{:});
    fprintf('br=%d sfc=%d hfc=%d \n',br,sfc,hfc);
    


end