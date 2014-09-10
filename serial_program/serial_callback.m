function serial_callback(obj, event)
%½âÎöprintf("9600;123;568;NONE;LF\t\n");×Ö·û´®
    % Determine the type of event.
    EventType = event.Type;

    % Determine the time of the error event.
    EventData = event.Data;
    EventDataTime = EventData.AbsTime;

    % Create a display indicating the type of event, the time of the event and
    % the name of the object.
    name = get(obj, 'Name');
    fprintf([EventType ' event occurred at ' datestr(EventDataTime,13),...
        ' for the object: ' name '.\n']);
    
    out = fscanf(obj) %read data from s

 %   fprintf('time_callback\n');
%     fprintf('time_callback out=%s\n',out);
%     
%      C = textscan(out, '%s%f%f%f','delimiter',' '); 
%     [par,br, sfc, hfc] = deal(C{:});
%     fprintf('br=%f sfc=%f hfc=%f \n',br,sfc,hfc);
    


end