function timer_obj=mycalltimerback()
    timer_obj=timer;
    timer_obj.TimerFcn = @timercallback;
    timer_obj.Period = 0.01;
    
    %timer_obj.TasksToExecute = 10; 
    timer_obj.ExecutionMode = 'fixedSpacing';
    global sensor_obj;
    sensor_obj = sensorgroup('AndroidMobile')
end
function timercallback(mTimer,~)
    global sensor_obj;
    %[a, t] = accellog(sensor_obj);
    fprintf('hzq:timer_callback test  %f\n',sensor_obj.Acceleration);
end

