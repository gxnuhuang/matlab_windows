function timer_obj=mycalltimerback()
    timer_obj=timer;
    timer_obj.TimerFcn = @timercallback;
    timer_obj.Period = 0.01;
    
   % timer_obj.TasksToExecute = 10; 
    timer_obj.ExecutionMode = 'fixedSpacing';
    %sensorgroup
    global sensor_obj;
    sensor_obj = sensorgroup('AndroidMobile')
    %3d animation
    global myworld;
    myworld = vrworld('my3danimation')
    open(myworld);
    view(myworld);
    vrdrawnow;
    %pause(5);
end
function timercallback(mTimer,~)
    global sensor_obj;
    global myworld;
    %[a, t] = accellog(sensor_obj);
    y=sensor_obj.Acceleration
    fprintf('hzq:timer_callback test  %f\n',sensor_obj.Acceleration);
    
    myworld.B1.rotation = [y(1) y(2) 1 y(3)];
end

